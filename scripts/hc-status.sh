#!/bin/bash

# USAGE
#  1. Install Homebrew (http://brew.sh/)
#  2. Install blink1-tool: $ brew install blink1
#  3. Create a /bin file in your home directory: $ mkdir ~/bin
#  4. Grab a copy of hc-status.sh (https://git.io/vK6Ao) and place it in ~/bin
#  5. Grab a copy of hc-status.cfg (https://git.io/vK6x3) and place it in ~/bin
#  6. Add ~/bin to your $PATH (http://www.troubleshooters.com/linux/prepostpath.htm#_singleuser)
#  7. Create 2 personal API tokens scoped to Admin Group and View Group  (https://www.hipchat.com/sign_in?d=%2Faccount%2Fapi)
#  8. Update hc-status.cfg with your API tokens
#  9. Get your current user info: $ sh hc-status.sh

source ~/bin/hc-status.cfg

while true; do

  echo "$(tput bold)Fetching user object via HipChat API...$(tput sgr0)"

  get_user=$(curl \
             --silent \
             --header "content-type: application/json" \
             --header "Authorization: Bearer $view_token" \
             --request GET https://api.hipchat.com/v2/user/{"$email"}
            )

  user_presence=$(echo $get_user | jq -r ".presence.is_online")
  user_status=$(echo $get_user | jq -r ".presence.show")

  echo "$user_presence"
  echo "$user_status"

  get_last_color=$(blink1-tool --rgbread  --quiet)
  last_color=$(printf "rgb(%d,%d,%d)\n" ${get_last_color//,/ })
  echo $last_color

  if [ "$user_status" == "chat" ] && [ "$last_color" != "rgb(0,255,0)" ]; then
    blink1-tool --rgb=0,255,0 --nogamma --quiet
    echo "Your status has changed to: ${user_status}"
  elif [ "$user_status" == "away" ] || [ "$user_status" == "xa" ] && [ "$last_color" != "rgb(255,100,0)" ]; then
    blink1-tool --rgb=255,100,0 --nogamma --quiet
    echo "Your status has changed to: ${user_status}"
  elif [ "$user_status" == "dnd" ] && [ "$last_color" != "rgb(255,0,0)" ]; then
    blink1-tool --rgb=255,0,0 --nogamma --quiet
    echo "Your status has changed to: ${user_status}"
  fi
  sleep 10
done
