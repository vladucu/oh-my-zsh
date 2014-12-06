# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Shortcuts
alias v="vim"

# List only directories
alias lsd='ls -l | grep "^d"'
alias l='ls -la'

# Speed up NPM (source: http://ilee.co.uk/using-npm-in-europe/)
alias enpm="npm --registry http://registry.npmjs.eu"

# Check for a running process
alias psx="ps auxw | grep $1"

# Source .zshrc file
alias reload!='. ~/.zshrc'

# Supervisor
alias sserver='sudo supervisord -c /etc/supervisor/supervisord.conf'
alias sstatus='sudo supervisorctl -c /etc/supervisor/supervisord.conf status'
alias sstart='sudo supervisorctl -c /etc/supervisor/supervisord.conf start all'
alias sstop='sudo supervisorctl -c /etc/supervisor/supervisord.conf stop all'
alias srestart='sudo supervisorctl -c /etc/supervisor/supervisord.conf restart all'
alias sreload='sudo supervisorctl -c /etc/supervisor/supervisord.conf reload'
alias sshutdown='sudo supervisorctl -c /etc/supervisor/supervisord.conf shutdown'
alias resquerestart='sudo supervisorctl -c /etc/supervisor/supervisord.conf restart resque'

# alias python as python3
alias python=python3
