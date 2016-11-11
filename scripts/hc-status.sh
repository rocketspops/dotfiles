#!/bin/bash

source ~/bin/hc-status.cfg

# Check if there are any connected Blink1 devices: `grep` output of `blink1-tool --list` using
# `-q` to silence the output, then return the exit status of the command using `echo`.

blink1_devices=$(blink1-tool --list | grep -q "id:[0-9]\+"; echo $?)

while  [ "$blink1_devices" == 0 ]; do

  echo "$(tput bold)Fetching user object via HipChat API...$(tput sgr0)"

  get_user=$(curl \
             --silent \
             --header "content-type: application/json" \
             --header "Authorization: Bearer $view_token" \
             --request GET https://api.hipchat.com/v2/user/{"$email"}
            )

  user_presence=$(echo $get_user | jq -r ".presence.is_online")
  user_status=$(echo $get_user | jq -r ".presence.show")

  get_last_color=$(blink1-tool --rgbread  --quiet)
  last_color=$(printf "rgb(%d,%d,%d)\n" ${get_last_color//,/ })

  if [ "$user_presence" == "true" ]; then

    echo "$user_presence"
    echo "$user_status"
    echo "$last_color"

    case $user_status in
      "chat")
        if [ "$last_color" != "rgb(0,255,0)" ]; then
          blink1-tool --rgb=0,255,0 --nogamma --quiet
          echo "Your status has changed to: ${user_status}"
        fi
        ;;
      "away"|"xa")
        if [ "$last_color" != "rgb(255,100,0)" ]; then
          blink1-tool --rgb=255,100,0 --nogamma --quiet
          echo "Your status has changed to: ${user_status}"
        fi
        ;;
      "dnd")
        if [ "$last_color" != "rgb(255,0,0)" ]; then
          blink1-tool --rgb=255,0,0 --nogamma --quiet
          echo "Your status has changed to: ${user_status}"
        fi
        ;;
      *)
        echo "..."
        ;;
    esac

  else
    echo "You aren't logged in to HipChat"
    blink1-tool --off --quiet
    exit 1;
  fi

  sleep 10
done

echo "No Blink1 device was detected"
