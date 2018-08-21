 if [[ $# -eq 0 ]]; then
 echo "Parse a file you need to open"
 exit
 fi
echo 'Dont forget to run ^P + ">Remote: Start Server" in your VSCode'
ssh -T -i $HOMEDRIVE\\$HOMEPATH\\.vagrant.d\\insecure_private_key vagrant@192.168.2.2  /bin/bash << EOSSH
echo "export TEMP_VAR=$1" >> ~/.bash_profile

# export TEMP_VAR=$1
# env |grep TEMP_VAR
echo "Hello world"
exit
EOSSH
 
 ssh -T -i $HOMEDRIVE\\$HOMEPATH\\.vagrant.d\\insecure_private_key -R 52698:localhost:52698 vagrant@192.168.2.2  /bin/bash << 'EOSSH'
 source ~/.bash_profile
 env |grep TEMP_VAR
 #check is file and it's directory exists if not, then create
 if [[ ! -f $TEMP_VAR ]]; then
   newdir=$(dirname $TEMP_VAR)
   if [[ ! -d $newdir ]]; then
     mkdir -p $newdir || echo "Directory is not created, may be they're some permissions problems"
   fi
   touch $TEMP_VAR
 fi
 
 # Check environment for ruby and rmate
 if [[ $(yum list installed ruby 2>/dev/null 1>&2 || echo $?) -eq 1 ]]; then sudo yum install ruby;
 fi
 if [[ ! -f ~/bin/rmate ]]
  then
  echo "There's no rmate file in home directory"
  mkdir ~/bin
  curl -Lo ~/bin/rmate https://raw.githubusercontent.com/textmate/rmate/master/bin/rmate
  echo "downloaded rmate file"
  chmod a+x ~/bin/rmate
  echo "added execution flag to file"
  export PATH="$PATH:$HOME/bin"
 fi
 #Htemp=$(env |grep -oP "(?<="^HOME=").*") && echo "Hello ${Htemp}"
 #sudo ${Htemp}/bin/rmate $1
 ~/bin/rmate $TEMP_VAR
 sed -i "/TEMP_VAR/d" ~/.bash_profile
EOSSH