#!/bin/bash

source ~/bin/hc-status.cfg

# Check if there are any connected Blink1 devices:
# 1. Execute `blink1-tool --list` command
# 2. Check for the presence of a Blink1 ID using `grep -q` to silence output
# 3. Return the exit status of the command using `echo`

blink1_devices=$(blink1-tool --list | grep -q "id:[0-9]\+"; echo $?)

while  [ "${blink1_devices}" == 0 ]; do

  echo "$(tput bold)Checking user object via HipChat API...$(tput sgr0)"
  echo "Last user show: ${user_last_show}"

  get_user=$(curl \
             --silent \
             --header "content-type: application/json" \
             --header "Authorization: Bearer ${view_token}" \
             --request GET https://api.hipchat.com/v2/user/{"${email}"}
            )

  user_presence=$(echo ${get_user} | jq -r ".presence.is_online")
  user_current_status=$(echo ${get_user} | jq -r ".presence.status")
  user_current_show=$(echo ${get_user} | jq -r ".presence.show")

  if [ "${user_presence}" == "true" ]; then

    echo "Current user show: ${user_current_show}"

    if [ "${user_current_show}" != "${user_last_show}" ]; then

      case ${user_current_show} in
        "chat") blink1-tool --rgb=0,255,0 --nogamma --quiet;; # Set Blink1 to rgb(0,255,0)
        "away" | "xa") blink1-tool --rgb=255,100,0 --nogamma --quiet;; # Set Blink1 to rgb(255,100,0)
        "dnd") blink1-tool --rgb=255,0,0 --nogamma --quiet;; # Set Blink 1 to rgb(255,0,0)
      esac

      echo "Status: ${user_current_show}"
      echo "Message: ${user_current_status}"
      user_last_show=${user_current_show}

    fi

  else
    echo "You aren't logged in to HipChat"
    blink1-tool --off --quiet
    exit 1;
  fi
  sleep 5
done

echo "No Blink1 device was detected"
