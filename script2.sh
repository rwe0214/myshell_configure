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
echo "[ -f $HOME/.local/bin/zsh ] && exec $HOME/.local/bin/zsh -l" >> $HOME/.profile
source $HOME/.zshrc

