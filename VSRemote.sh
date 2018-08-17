 if [[ $# -eq 0 ]] then
 echo "Parse a file you need to open"
 fi
 ssh -i C:\\Users\\Oleksii_Pasichnyk\\.vagrant.d\\insecure_private_key -R 52698:localhost:52698 vagrant@192.168.1.2
 sudo /usr/local/bin/rmate $1
