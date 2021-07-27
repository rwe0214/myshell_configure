WORK_DIR=$(pwd)

# install vim
sudo apt-get install vim
cp src/vimrc $HOME/.vimrc
source $HOME/.vimrc

# install zsh
echo "Installing zsh and curses..."
sudo apt-get install libncurses5-dev libncursesw5-dev
wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME/.local
make
make install
cd $WORK_DIR

echo "Installing oh-my-zsh"
# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

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
cp src/zshrc $HOME/.zshrc
cp src/p10k.zsh $HOME/.p10k.zsh

# apply fonts
FONTS_DIR="$HOME/.local/share/fonts"
if [ ! -d "$FONTS_DIR" ]; then
    echo "Creating ${FONTS_DIR}..."
    mkdir $FONTS_DIR
fi
echo "Downloading fonts..."
cp fonts/*.ttf $FONTS_DIR

# setting default shell
echo "[ -f \$HOME/.local/bin/zsh ] && exec \$HOME/.local/bin/zsh -l" >> $HOME/.profile
# switching shell
echo "Switching to zsh..."
exec $HOME/.local/bin/zsh -l
source $HOME/.zshrc
