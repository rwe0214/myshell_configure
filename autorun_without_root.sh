# install vim
cp vimrc ~/.vimrc
source ~/.vimrc

# install zsh, git
echo "Installing zsh and git..."
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME
make
make install

# switching shell
echo "Switching default shell..."
exec $HOME/bin/zsh -l

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
cp zshrc ~/.zshrc

# apply fonts
FONTS_DIR = "$HOME/.local/share/fonts"
if [ ! -d "$FONTS_DIR" ]; then
    echo "Creating ${FONTS_DIR}..."
    mkdir $FONTS_DIR
fi
echo "Downloading fonts..."
cp fonts/*.ttf $FONTS_DIR

# setting default shell
echo "[ -f $HOME/bin/zsh ] && exec $HOME/bin/zsh -l" >> ~/.profile
