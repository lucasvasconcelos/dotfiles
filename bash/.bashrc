export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w`git branch 2> /dev/null | grep \* | head -1 |  sed "s/\* //g" | awk "{ print \" (\" \\\$1     \")\" }"`\$ '

export PATH=${PATH}:/usr/local/go/bin

export GOPATH=${HOME}/go

export PATH=${PATH}:${GOPATH}/bin

