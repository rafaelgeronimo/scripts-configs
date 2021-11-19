echo Configurando o git e github em ambiente WSL

# Primeiramente, é necessário instalar o NodeJS e o NPM
# Considerando utilização do Ubuntu
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Após instalação, do Node, é configurado o Git com as variáveis globais
# Nome da pessoa usuária
echo "Informe o nome que será configurado no user.name"
echo "Ex.: Rafael Geronimo"
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear

# Email da pessoa usuária
echo "Informe o email que será configurado no user.email"
read git_config_user_email
git config --global user.email git_config_user_email
clear

echo "Gerando chave SSH"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

echo "Copie a chave SSH informada acima e configure a mesma no seu Github"
read

echo "Corrigindo falha que não permite clonar repositórios do Github"
sudo umount /mnt/c
sudo mount -t drvfs C: /mnt/c -o metadata

echo "Ambiente configurado. Pode começar a codar . . . "
read

