# install vim
cp vimrc $HOME/.vimrc
source $HOME/.vimrc

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


