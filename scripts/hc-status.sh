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
#  9. Get your current user info: $ sh hc-status.sh get
# 10. Update the rest of hc-status.cfg with correct user info
# 11. Update your status and Blink1 light: $ sh hc-status.sh chat "I'm available to answer questions."

source ~/bin/hc-status.cfg

# Arguments
status="$1"
message="$2"

function get_status() {
  curl --header "content-type: application/json" \
       --header "Authorization: Bearer $view_token" \
       --request GET \
       --data '{"name"}' \
       https://api.hipchat.com/v2/user/{"$email"} \
       | python -m json.tool
}

function update_status () {
  echo "Connecting to HipChat..."
  curl --header "content-type: application/json" \
       --header "Authorization: Bearer $admin_token" \
       --request PUT \
       --data '{
                 "name": "'"$name"'",
                 "mention_name": "'"$mention_name"'",
                 "email": "'"$email"'",
                 "roles": ['"$(printf '"%s", ' "${roles[@]}" | cut -d "," -f 1-${#roles[@]})"'],
                 "title": "'"$title"'",
                 "timezone": "'"$timezone"'",
                 "is_group_admin": '"$is_admin"',
                 "presence": {
                     "status": "'"$message"'",
                     "show": "'"$status"'"
                  }
               }' \
       https://api.hipchat.com/v2/user/{"$email"}
}

function print_status () {
  echo "HipChat Status: $($1)$(tput bold)$status$(tput sgr0)";
  if [ -n "$message" ]; then
    echo "HipChat Message: $message";
  fi
}

case $status in
  chat)
    blink1-tool -q --green
    update_status
    print_status "tput setaf 2" # Print status w/ green text
    ;;
  xa)
    blink1-tool -q --rgb=#FF9900
    update_status
    print_status "tput setaf 208" # Print status w/ orange text
    ;;
  dnd)
    blink1-tool -q --red
    update_status
    print_status "tput setaf 1" # Print status w/ red text
    ;;
  done)
    blink1-tool -q --off
    echo "HipChat Status: $(tput setaf 208)Your Blink(1) is off, but you are still connected to HipChat.$(tput sgr0)"
    ;;
  get)
    echo -e "$(tput bold)Fetching user object via HipChat API...$(tput sgr0)"
    get_status
    ;;
  *)
    echo "HipChat Status: $(tput setaf 1)Oops, you didn’t specify a valid status or command.$(tput sgr0)"
    exit 1
    ;;
esac
