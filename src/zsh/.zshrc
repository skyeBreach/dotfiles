# For more information see:
#   - https://zsh.sourceforge.io/Doc/zsh_a4.pdf
#   - https://zsh.sourceforge.io/Doc/zsh_a4.pdf#Files
#   - https://github.com/ohmyzsh/ohmyzsh/wiki/Settings

# TODO: Create common directory path variables and export them (e.g. export DEV=/mnt/e/)
# TODO: Check what needs moving to the other Zsh files (.zshenv, .zshprofile, .zshlogin, .zsh logout, etc)
# TODO: Move alot of these custom settings into the `$ZSH_CUSTOM` Folder

#----------------------------------------------------------------------------------------------------------------------#
# Zsh Directory Config

## Add Bash binary paths to the `PATH` variable by default
# // export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

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

# TODO: Comment
# TODO: Decide if we want this
## Defines the list of themes to use, when {@link ZSH_THEME} is set to random.
## @note If set to an empty array, this variable will have no effect.
# // ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

#----------------------------------------------------------------------------------------------------------------------#
# Updating

# TODO: Comment
# TODO: Decide if we want this
# Uncomment one of the following lines to change the auto-update behavior
##
# // zstyle ':omz:update' mode disabled  # disable automatic updates
# // zstyle ':omz:update' mode auto      # update automatically without asking
# // zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line to change how often to auto-update (in days).
##
# // zstyle ':omz:update' frequency 13

#----------------------------------------------------------------------------------------------------------------------#
# Completion 

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line to use case-sensitive completion.
##
# // CASE_SENSITIVE="true"

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
##
# // HYPHEN_INSENSITIVE="true"

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
##
# // COMPLETION_WAITING_DOTS="true"

#----------------------------------------------------------------------------------------------------------------------#
# Automatic Title

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line to disable auto-setting terminal title.
## 
# // DISABLE_AUTO_TITLE=true

#----------------------------------------------------------------------------------------------------------------------#
# Oh My Zsh Libraries 

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line if pasting URLs and other text is messed up.
## 
# // DISABLE_MAGIC_FUNCTIONS="true"

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line to disable colors in ls.
##
# // DISABLE_LS_COLORS="true"

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line to enable command auto-correction.
##
# // ENABLE_CORRECTION="true"

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
## 
# //  DISABLE_UNTRACKED_FILES_DIRTY="true"

# TODO: Comment
# TODO: Decide if we want this
# Uncomment the following line if you want to change the command execution time
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
## 
# // HIST_STAMPS="mm/dd/yyyy"

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
# Manual Pager (`man`) Config

# TODO: Comment
# TODO: Decide if we want this
## 
# // export MANPATH="/usr/local/man:$MANPATH"

#----------------------------------------------------------------------------------------------------------------------#
# Language and Locales
# TODO: Will need to generate the missing locale and reconfigure all locales. See: https://askubuntu.com/questions/162391/how-do-i-fix-my-locale-issue

# TODO: Comment
# TODO: Decide if we want this
# You may need to manually set your language environment
## 
# // export LANG=en_US.UTF-8

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

## ls defaults and aliases
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -A'

# TODO: Comment
# TODO: Decide if we want this
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
