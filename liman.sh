if [ $1 == "kur" ] 
then
  #php repoları
  sudo apt install software-properties-common
  sudo add-apt-repository ppa:ondrej/php
  #node.js repoları
  sudo apt install -y ca-certificates curl gnupg gnupg2
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  #postgresql repoları
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  sudo apt install gnupg2 ca-certificates -y
  wget -O- https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor > pgsql.gpg
  #liman repoları ve kurulumu
  sudo mv pgsql.gpg /etc/apt/trusted.gpg.d/pgsql.gpg
  echo "deb [arch=amd64] http://depo.aciklab.org/ focal main" | sudo tee /etc/apt/sources.list.d/acikdepo.list
  sudo wget -qO - http://depo.aciklab.org/public.key | sudo apt-key add -
  sudo apt update
  sudo apt install php nodejs postgresql liman
  
elif [ $1 == "kaldır" ]
then
  sudo apt remove liman && sudo apt autoremove
elif [ $1 == "administrator" ]
then
  sudo limanctl reset administrator@liman.dev
elif [ $1 == "reset" ]
then
  sudo limanctl reset $2
elif [ $1 == "help" ]
then
  #buraya helpi yaz
  echo "./liman.sh kur|kaldır|administrator|reset <mail>|help"
else
  echo "Yanlış girdi! yardım almak için ./liman.sh help yazınız"
fi 
