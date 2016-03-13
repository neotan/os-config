export PATH="/usr/local/sbin:$PATH"
alias sn='sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist'
alias kn='sudo nginx -s stop'
alias rn='kn && sn '
alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"
alias php-fpm.restart='php-fpm.stop && php-fpm.start'
alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.restart='mysql.stop && mysql.start'
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias nginx.logs.default.access='tail -250f /usr/local/etc/nginx/logs/default.access.log'
alias nginx.logs.default-ssl.access='tail -250f /usr/local/etc/nginx/logs/default-ssl.access.log'
alias nginx.logs.phpmyadmin.error='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.error.log'
alias nginx.logs.phpmyadmin.access='tail -250f /usr/local/etc/nginx/logs/phpmyadmin.access.log'

alias ll='ls -Fla'
#alias jp.stop='sudo networksetup -setautoproxystate 'Wi-Fi' off'
alias jp.start="sudo networksetup -setautoproxystate 'Wi-Fi' off;sudo networksetup -setautoproxyurl 'Wi-Fi' 'file://Volumes/Mac/home/jproxy.pac;sudo networksetup -setautoproxystate 'Wi-Fi' on"
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
