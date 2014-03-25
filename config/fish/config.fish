set -gx ARCHFLAGS -Wno-error=unused-command-line-argument-hard-error-in-future
set -gx RBENV_ROOT /usr/local/var/rbenv

# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme zen

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

. (rbenv init -|psub)
