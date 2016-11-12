#!/bin/bash

source ~/bin/hc-status.cfg

get_user() {
  curl \
      --silent \
      --header "content-type: application/json" \
      --header "Authorization: Bearer ${view_token}" \
      --request GET https://api.hipchat.com/v2/user/{"${email}"}
}

# Check if there are any connected Blink1 devices:
# 1. Execute `blink1-tool --list` command
# 2. Check for the presence of a Blink1 ID using `grep -q` to silence output
# 3. Return the exit status of the command using `echo`

blink1-tool --list | grep "id:[0-9]\+"
blink1_devices=$(echo $?)
echo ${blink1_devices}

until [ "${blink1_devices}" == 0 ]; do
  printf "%s\n" "No Blink1 detected!"
  sleep 10
done

until [ "$(get_user | jq -r '.presence.is_online')" == "true" ]; do
  printf "\n%s\n" "You aren’t logged in to HipChat!"
  sleep 10
done

initalize="true"

while true; do

  user=$(get_user)
  user_name=$(echo ${user} | jq -r '.name')
  user_presence=$(echo ${user} | jq -r ".presence.is_online")
  user_last_status="${user_current_status}"
  user_current_status=$(echo ${user} | jq -r ".presence.show")

  if [ "${initalize}" == "true" ]; then
    echo "$(tput bold)Checking user status via HipChat API…$(tput sgr0)"
    echo "User:   ${user_name}"
    echo "Blink1: Detected"
  fi

  if [ "${user_current_status}" != "${user_last_status}" ]; then

    case ${user_current_status} in
      "chat")
        # Set Blink1 to rgb(0,255,0)
        blink1-tool --rgb=0,255,0 --nogamma --quiet
        print_color=$(tput setaf 2)
        ;;
      "away" | "xa")
        # Set Blink1 to rgb(255,100,0)
        blink1-tool --rgb=255,100,0 --nogamma --quiet
        print_color=$(tput setaf 208)
        ;;
      "dnd")
        # Set Blink 1 to rgb(255,0,0)
        blink1-tool --rgb=255,0,0 --nogamma --quiet
        print_color=$(tput setaf 1)
        ;;
    esac



    printf "$(tput bold)${print_color}•$(tput sgr0)"

  else
    printf "•"
  fi

  initalize="false"
  sleep 5

done
