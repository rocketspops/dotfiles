#!/bin/bash

source ~/bin/hc-status.cfg

trap ctrl_c INT

ctrl_c() {
  printf "\n%s\n" "Disconnecting..."
  blink1-tool --off --quiet
  exit 1
}

get_user() {
  user=$(
    curl \
    --silent \
    --header "content-type: application/json" \
    --header "Authorization: Bearer ${view_token}" \
    --request GET https://api.hipchat.com/v2/user/{"${email}"}
  )
  user_name=$(echo ${user} | jq -r '.name')
  user_presence=$(echo ${user} | jq -r ".presence.is_online")
  user_current_status=$(echo ${user} | jq -r ".presence.show")
}

blink1_detect() {
  blink1-tool --list | grep -q "id:[0-9]\+"
  blink1_detected=$(echo $?)
}

# Check if there are any connected Blink1 devices:
# 1. Execute `blink1-tool --list` command
# 2. Check for the presence of a Blink1 ID using `grep -q` to silence output
# 3. Return the exit status of the command using `echo`

initalize="true"
last_status="null"

while true; do

  blink1_detect
  get_user

  until [ "${blink1_detected}" == 0 ]; do

    message="$(tput bold)No Blink1 detected...$(tput sgr0)"

    case ${last_status} in
      "chat" | "away" | "xa" | "dnd")
        printf "\n\n%s" "${message}"
        ;;
      "blinkless")
        printf "."
        ;;
      *)
        printf "${message}"
        ;;
    esac

    blink1_detect
    export initalize="true"
    export last_status="blinkless"
    sleep 5
  done

  if [ "${last_status}" == "blinkless" ]; then
    printf "%s\n" "$(tput bold)$(tput setaf 2)✔$(tput sgr0)"
  fi

  until [ "${user_presence}" == "true" ]; do

    blink1_detect

    if [ "${blink1_detected}" != 0 ]; then
      echo ${blink1_detected}
      continue 2
    fi

    message="$(tput bold)User not logged into HipChat...$(tput sgr0)"

    case ${last_status} in
      "chat" | "away" | "xa" | "dnd")
        printf "\n\n%s" "${message}"
        ;;
      "offline")
        printf "."
        ;;
      *)
        printf "${message}"
        ;;
    esac

    blink1-tool --off --quiet
    get_user
    export initalize="true"
    export last_status="offline"
    sleep 5
  done

  if [ "${last_status}" == "offline" ]; then
    printf "%s\n" "$(tput bold)$(tput setaf 2)✔$(tput sgr0)"
  fi

  if [ "${initalize}" == "true" ]; then
    printf "%s\n" "$(tput bold)Checking user status via HipChat API...$(tput setaf 2)✔$(tput sgr0)"
    echo "User:   ${user_name}"
    echo "Blink1: $(blink1-tool --list | grep 'id:[0-9]\+')"
    export initalize="false"
  fi

  if [ "${user_current_status}" != "${last_status}" ]; then

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

    printf "$(tput bold)${print_color}∙$(tput sgr0)"

  else
    printf "∙"
  fi

  last_status="$user_current_status"
  sleep 5

done
