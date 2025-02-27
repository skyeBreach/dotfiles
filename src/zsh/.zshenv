# For more information see:
#   - https://zsh.sourceforge.io/Doc/zsh_a4.pdf
#   - https://zsh.sourceforge.io/Doc/zsh_a4.pdf#Files
#   - https://github.com/ohmyzsh/ohmyzsh/wiki/Settings

#----------------------------------------------------------------------------------------------------------------------#
# Third-Party Lib Setup

## Rust and Cargo
source "$HOME/.cargo/env"

#----------------------------------------------------------------------------------------------------------------------#
# Windows or C drive paths

## Mount point paths
export DRIVE_C="/mnt/c"
export DRIVE_WIN=$DRIVE_C

#----------------------------------------------------------------------------------------------------------------------#
# Development Drive Paths

## Mount point paths
export DRIVE_E="/mnt/e"
export DRIVE_DEV=$DRIVE_E

## Commonly used directories
export DIR_CONFIG="${DRIVE_DEV}/config"
export DIR_DOCS="${DRIVE_DEV}/docs"
export DIR_LIB="${DRIVE_DEV}/libs"
export DIR_PROJECT="${DRIVE_DEV}/projects"
export DIR_TOOL="${DRIVE_DEV}/tools"

#----------------------------------------------------------------------------------------------------------------------#
