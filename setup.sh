cd $HOME

DOTFILES_DIR=$HOME/Sites/dotfiles

# Change to the dotfiles directory either way
cd $DOTFILES_DIR

# Install oh-my-zsh first, as the laptop script doesn't install it
ZSH_DIR="$HOME/.oh-my-zsh"
if [[ -d $ZSH_DIR ]]; then
    # Update Zsh if we already have it installed
    cd $ZSH_DIR
    git pull origin master
    cd $HOME
else
    # Install it if don't have a ~/.oh-my-zsh directory
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# sync ohmyzsh settings
cp "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
source "$HOME/.zshrc"

# gitconfig settings
cp "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install node yvm z