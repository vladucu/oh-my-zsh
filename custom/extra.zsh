PATH+=:$HOME/.rvm/bin
PATH+=:$HOME/local/bin
PATH+=:$HOME/local/node/bin
PATH+=:$HOME/local/npm/bin
PATH+=:$HOME/.composer/vendor/bin
PATH+=:/usr/local/go/bin
PATH+=:/usr/local/sbin
PATH+=:/usr/local/bin

# http://golang.org/doc/code.html#GOPATH
GOPATH=$HOME/dev/go
PATH+=:$GOPATH/bin
GOROOT=/usr/local/opt/go/libexec
PATH+=:$GOROOT/bin

# for direnv to load specific node version using nvm
NODE_VERSIONS=$HOME/.nvm/versions/node
NODE_VERSION_PREFIX="v"

export PATH
export GOPATH
export GOROOT
export NODE_VERSIONS
export NODE_VERSION_PREFIX
