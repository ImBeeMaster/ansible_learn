 if [[ $# -eq 0 ]]; then
 echo "Parse a file you need to open"
 fi
 ssh -i $HOMEDRIVE\\$HOMEPATH\\.vagrant.d\\insecure_private_key -R 52698:localhost:52698 vagrant@192.168.1.2
 
 if [[ ~/bin/rmate -e ]]; then
 else
 curl -Lo ~/bin/rmate https://raw.githubusercontent.com/textmate/rmate/master/bin/rmate
 chmod a+x ~/bin/rmate
 export PATH="$PATH:$HOME/bin"
 
 fi
 Htemp = `env |grep -oP "(?<="^HOME=").*"`

 sudo ${Htemp}/bin/rmate $1
