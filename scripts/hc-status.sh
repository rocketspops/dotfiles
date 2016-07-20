#!/bin/bash

# Arguments
status="$1"
message="$2"

# Usage
# ~ $ hc-status.sh chat "I'm available to answer questions."

# HipChat API Parameters
admin_token=c9kTooyd0EKFdByz3fAStpRFmiJq8glIITbI4DWQ
view_token=Gf641la2tp9i3gsPyppGaBQj9Ttyreh102mxLZef
name="Billy Whited"
mention_name="Billy"
email="billy.whited@ampf.com"
title="Sr. Mgr. UI Design & Development"
timezone="America/Chicago"
is_admin=true
roles=(admin owner user)

function get_status() {
  curl --header "content-type: application/json" \
       --header "Authorization: Bearer $view_token" \
       --request GET \
       --data '{"name"}' \
       https://api.hipchat.com/v2/user/{"$email"} \
       | python -m json.tool
}

function update_status () {
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
    echo -e "$(tput bold)Fetching user object via HipChat API…$(tput sgr0)"
    get_status
    ;;
  *)
    echo "HipChat Status: $(tput setaf 1)Oops, you didn’t specify a valid status or command.$(tput sgr0)"
    exit 1
    ;;
esac
