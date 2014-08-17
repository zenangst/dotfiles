set -gx ARCHFLAGS -Wno-error=unused-command-line-argument-hard-error-in-future
set -gx RBENV_ROOT /usr/local/var/rbenv
set -gx GIT_EDITOR /usr/bin/vim
set -gx VISUAL /usr/bin/vim
set -gx EDITOR /usr/bin/vim
set -gx PATH /usr/local/bin /usr/bin /bin /usr/libexec /usr/sbin /sbin
set -gx PKG_CONFIG_PATH = "/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"
set -gx CODA_TERMINAL "-rp"

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
