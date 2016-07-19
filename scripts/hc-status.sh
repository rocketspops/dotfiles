#!/bin/bash

# Arguments
status="$1"
message="$2"

# Usage
# ~ $ hc-status.sh chat "I'm available to answer questions."

# HipChat API Parameters
api_token=c9kTooyd0EKFdByz3fAStpRFmiJq8glIITbI4DWQ
name="Billy Whited"
mention_name="Billy"
email="billy.whited@ampf.com"
title="Sr. Mgr. UI Design & Development"
timezone="America/Chicago"

function update_status () {
  curl --header "content-type: application/json" \
       --header "Authorization: Bearer $api_token" \
       --request PUT \
       --data '{
                 "name": "'"$name"'",
                 "mention_name": "'"$mention_name"'",
                 "email": "'"$email"'",
                 "roles": ["admin", "owner", "user"],
                 "title": "'"$title"'",
                 "timezone": "'"$timezone"'",
                 "is_group_admin": true,
                 "presence": { "status": "'"$message"'", "show": "'"$status"'" }
               }' \
       https://api.hipchat.com/v2/user/{"$email"}
}

function print_status () {
  if [ -n "$message" ]; then
    echo "HipChat Status:  $status";
    echo "HipChat Message: $message";
  else
    echo "HipChat Status: $status";
  fi
}

case $status in
  chat)
    blink1-tool -q --green
    update_status
    print_status
    ;;
  away)
    blink1-tool -q --rgb=#FF9900
    update_status
    print_status
    ;;
  dnd)
    blink1-tool -q --red
    update_status
    print_status
    ;;
  done)
    blink1-tool -q --off
    ;;
  *)
    echo "Oops, you didn't specify a valid status."
    exit 1
    ;;
esac
