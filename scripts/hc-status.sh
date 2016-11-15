#!/bin/bash

source ~/bin/hc-status.cfg
trap ctrl_c INT

stty -echo
tput civis

icn="▯"
x_icn="$(tput setaf 1)✘$(tput sgr0)"
c_icn="$(tput bold)$(tput setaf 2)✔$(tput sgr0)"

iteration=0
last_status="null"

ctrl_c() {
  msg="$(tput bold)Disconnecting...$(tput setaf 2)✔$(tput sgr0)"
  case ${last_status} in
    "chat"|"away"|"xa"|"dnd" ) printf "%s\n\n%s\n" "${icn}" "${msg}" ;;
    *) printf "%s\n%s\n" "${x_icn}" "${msg}" ;;
  esac
  blink1-tool --off --quiet
  tput cnorm
  stty sane
  exit 1
}

blink1_detect() {
  blink1-tool --list | grep -q "id:[0-9]\+"
  blink1_detected=$(echo $?)
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
  user_title=$(echo ${user} | jq -r '.title')
  user_presence=$(echo ${user} | jq -r ".presence.is_online")
  user_current_status=$(echo ${user} | jq -r ".presence.show")
  user_last_active=$(echo ${user} | jq -r ".last_active")
  user_client_type=$(echo ${user} | jq -r ".presence.client.type")
}

while true; do

  blink1_detect
  get_user

  until [ "${blink1_detected}" == 0 ]; do
    if [ "${last_status}" != "blinkless" ]; then
      msg="$(tput bold)Connect a Blink1 device to continue...$(tput sgr0)"
      case ${last_status} in
        "chat"|"away"|"xa"|"dnd" ) printf "%s\n\n%s" "${icn}" "${msg}" ;;
        *) printf "%s" "${msg}" ;;
      esac
    fi
    blink1_detect
    export iteration=0
    export last_status="blinkless"
    sleep 3
  done

  if [ "${last_status}" == "blinkless" ]; then printf "%s\n" "${c_icn}"; fi

  until [ "${user_presence}" == "true" ]; do
    blink1_detect
    if [ "${blink1_detected}" != 0 ]; then
      printf "%s\n" "${x_icn}"
      continue 2
    elif [ "${last_status}" != "offline" ]; then
      msg="$(tput bold)Log into HipChat to continue...$(tput sgr0)"
      case ${last_status} in
        "chat"|"away"|"xa"|"dnd" ) printf "%s\n\n%s" "${icn}" "${msg}" ;;
        *) printf "%s" "${msg}" ;;
      esac
    fi
    blink1-tool --off --quiet
    get_user
    export iteration=0
    export last_status="offline"
    sleep 3
  done

  if [ "${last_status}" == "offline" ]; then printf "%s\n" "${c_icn}"; fi

  if [ "${iteration}" == 0 ]; then
    printf "%s\n\n" "$(tput bold)Establishing connection to HipChat API...$(tput setaf 2)✔$(tput sgr0)"
    printf "%-15s%s\n" "Blink1:" "$(blink1-tool --list | grep 'id:[0-9]\+')"
    printf "%-15s%s\n" "User:" "${user_name}"
    printf "%-15s%s\n" "Title:" "${user_title}"
    printf "%-15s%s\n" "Last Active:" "${user_last_active}"
    printf "%-15s%s\n" "Client:" "${user_client_type}"
    printf "%-15s" "Status:"
  elif [ "${iteration}" == 40 ]; then
    printf "\n%-15s"
    export iteration=0
  fi

  if [ "${user_current_status}" != "${last_status}" ]; then
    case ${user_current_status} in
      "chat")
        # Set Blink1 to rgb(0,255,0)
        blink1-tool --rgb=0,255,0 --nogamma --quiet
        print_color=$(tput setaf 2)
        ;;
      "away"|"xa")
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
    printf "%s" "${print_color}▮$(tput sgr0)"
  else
    printf "%s" "${print_color}▯$(tput sgr0)"
  fi

  let iteration+=1
  last_status="$user_current_status"
  sleep 3

done
