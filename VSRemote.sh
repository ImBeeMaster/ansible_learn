 if [[ $# -eq 0 ]]; then
 echo "Parse a file you need to open"
 exit
 else echo "Hello World"
 fi
 ssh -i $HOMEDRIVE\\$HOMEPATH\\.vagrant.d\\insecure_private_key -R 52698:localhost:52698 vagrant@192.168.1.2  /bin/bash << EOSSH
 
 if [[ -f ~/bin/rmate ]]
  then echo "Hello World 1"
  else echo "Hello World 2"
  mkdir ~/bin
  curl -Lo ~/bin/rmate https://raw.githubusercontent.com/textmate/rmate/master/bin/rmate
  echo "Hello World 3"
  chmod a+x ~/bin/rmate
  echo "Hello World 4"
  export PATH="$PATH:$HOME/bin"
 fi
 #Htemp=$(env |grep -oP "(?<="^HOME=").*") && echo "Hello ${Htemp}"
 #sudo ${Htemp}/bin/rmate $1
 sudo ~/bin/rmate $1
EOSSH