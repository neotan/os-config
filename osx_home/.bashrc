export TERM="xterm-color"

# Customize coloring and 'll' alias
export LOCIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
export PUBIP=`curl -s  http://ip.taobao.com/service/getIpInfo2.php?ip=myip | awk -F"ip" '{print $2}' | awk -F'"' '{print $3}'`
export PS1="\[\033[38;5;11m\]\[\033[48;5;240m\]\u\[\033[38;5;15m\]@\[\033[38;5;14m\]\h[pub:$PUBIP pvt:$LOCIP]:\[$(tput sgr0)\]\[\033[38;5;15m\]\[\033[38;5;11m\] \w\[\033[38;5;15m\] \n\[$(tput sgr0)\]"

 #Modify 'ls' alias
alias ll='ls -laFG' 2>/dev/null
alias sudo=' sudo '

