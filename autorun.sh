echo "Updating and upgrading..."
sudo apt-get update
sudo apt-get upgrade

# install vim
echo "Installing vim..."
sudo apt-get install vim
cp vimrc ~/.vimrc
source ~/.vimrc

# install zsh, git
echo "Installing zsh and git..."
sudo apt-get install git
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install powerlevel10k
echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh-autosuggestions
echo "Installing plugin:zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
echo "Installing plugin:zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# apply my zshrc setting
echo "Applying my zshrc setting..."
cp zshrc.zsh-template ~/.zshrc

# apply fonts
FONTS_DIR = "$HOME/.local/share/fonts"
if [ ! -d "$FONTS_DIR" ]; then
    echo "Creating ${FONTS_DIR}..."
    mkdir $FONTS_DIR
fi
echo "Downloading fonts..."
cp fonts/*.ttf $FONTS_DIR

# change default shell to zsh
echo "Changing default shell..."
chsh -s /bin/zsh
