# For more information see:
#   - https://zsh.sourceforge.io/Doc/zsh_a4.pdf
#   - https://zsh.sourceforge.io/Doc/zsh_a4.pdf#Files
#   - https://github.com/ohmyzsh/ohmyzsh/wiki/Settings

# TODO: Create common directory path variables and export them (e.g. export DEV=/mnt/e/)
# TODO: Check what needs moving to the other Zsh files (.zshenv, .zshprofile, .zshlogin, .zsh logout, etc)
# TODO: Move alot of these custom settings into the `$ZSH_CUSTOM` Folder

#----------------------------------------------------------------------------------------------------------------------#
# Zsh Directory Config

## Path to the `Oh My Zsh` installation.
export ZSH="$HOME/.oh-my-zsh"

## Defines the path to the custom folder.
ZSH_CUSTOM=/home/skye/.oh-my-zsh/custom

## Defines the path to the cache folder.
ZSH_CACHE_DIR=/home/skye/.oh-my-zsh/cache

#----------------------------------------------------------------------------------------------------------------------#
# Theming
# For more information see: 
#   - https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

## Name of the theme to use.
ZSH_THEME="robbyrussell"

#----------------------------------------------------------------------------------------------------------------------#
# Completion 

## Force case sensitivity for auto-completion
CASE_SENSITIVE="true"

#----------------------------------------------------------------------------------------------------------------------#
# Oh My Zsh Plugins

# TODO: Comment
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
##
plugins=(git)

## Initialize and Load `Oh My Zsh`
source $ZSH/oh-my-zsh.sh

#----------------------------------------------------------------------------------------------------------------------#
# Editor

# TODO: Comment
# TODO: Define correct editor
# Preferred editor for local and remote sessions
##
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

#----------------------------------------------------------------------------------------------------------------------#
# Command Aliasing

# TODO: Add in useful aliases
# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# TODO: Move these out of here
## ls defaults and aliases
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -A'

# TODO: Comment
# TODO: Decide if we want this
# TODO: Move these out of here
## Config file (.dotfile) path aliases
alias zshrc="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

#----------------------------------------------------------------------------------------------------------------------#
# Compilation flags

# TODO: Comment
# TODO: Decide if we want this
## 
export ARCHFLAGS="-arch $(uname -m)"

#----------------------------------------------------------------------------------------------------------------------#
# Bun.sh

## Path and Dir Variables
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

## Completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

#----------------------------------------------------------------------------------------------------------------------#
# BiomeJS

## Path and Dir Variables
export BIOME_INSTALL="$BIN_DIR"
export PATH="$BIOME_INSTALL:$PATH"

#----------------------------------------------------------------------------------------------------------------------#
