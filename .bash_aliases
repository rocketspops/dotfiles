# Show/Hide hidden files
alias shf="defaults write com.apple.Finder AppleShowAllFiles YES; killall Finder"
alias hhf="defaults write com.apple.Finder AppleShowAllFiles NO; killall Finder"

# Update Blink lights
alias chat="blink1-tool --rgb=0,255,0 --nogamma"
alias away="blink1-tool --rgb=255,100,0 --nogamma"
alias dnd="blink1-tool --rgb=255,0,0 --nogamma"
alias quiet="blink1-tool --off --quiet"

# HC Status
alias status="cd ~/Code/hc-status; bash hc-status.sh"

# ADEL
alias adel="cd ~/Code/uidd-adel/"
alias fractal="cd ~/Code/uidd-adel/; npm run fractal:start"
alias staging="cd ~/Code/uidd-adel/; npm run deploy:staging master"
alias prod="cd ~/Code/uidd-adel/; npm run deploy:production master"
