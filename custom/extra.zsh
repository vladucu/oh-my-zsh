PATH+=:$HOME/.rvm/bin
PATH+=:$HOME/local/bin
PATH+=:$HOME/local/node/bin
PATH+=:$HOME/local/npm/bin
PATH+=:$HOME/.composer/vendor/bin
PATH+=:/usr/local/go/bin
PATH+=:/usr/local/sbin

# http://golang.org/doc/code.html#GOPATH
GOPATH=$HOME/dev/go
PATH+=:$GOPATH/bin

export PATH
export GOPATH
