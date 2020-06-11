echo "Instalando o i3"
sudo apt install i3 -y
sudo apt install i3blocks -y

echo "Instalando o curl"
sudo apt install curl -y

echo "Instalando o GIT"
sudo apt install git -y

echo "Qual nome será usado no GIT user.name?"
echo "O meu será \"Rafael Geronimo\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "Qual e-mail será usado no GIT user.email?"
echo "O meu será \"rafaelgeronimo@outlook.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Posso configurar o VIM como editor padrão do GIT? (s/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^s" ;then
	git config --global core.editor vim
else
	echo "Ok, sem problema. Vamos em frente!"
fi

echo "Instalando xclip"
sudo apt-get install xclip -y

echo "Gerando chave SSH"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo "Instalando o VSCODE"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y

echo "Installing ZSH"
sudo apt install zsh -y
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

echo "NÃO SE ESQUEÇA DE INSTALAR A FONTE FURAMONO DO SITE DO GOOGLE FONTS"
