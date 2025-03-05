# For more information see:
#   - https://zsh.sourceforge.io/Doc/zsh_a4.pdf
#   - https://zsh.sourceforge.io/Doc/zsh_a4.pdf#Files
#   - https://github.com/ohmyzsh/ohmyzsh/wiki/Settings

#----------------------------------------------------------------------------------------------------------------------#
# Third-Party Lib Setup

## Rust and Cargo
source "$HOME/.cargo/env"

#----------------------------------------------------------------------------------------------------------------------#
# Development Drive Paths

## Mount point paths
export DRIVE_DEV="/mnt/dev"

## Commonly used directories
export DEV_APP="${DRIVE_DEV}/apps"
export DEV_BIN="${DRIVE_DEV}/bin"
export DEV_BOILERPLATE="${DRIVE_DEV}/boilerplates"
export DEV_CONFIG="${DRIVE_DEV}/config"
export DEV_DOCS="${DRIVE_DEV}/docs"
export DEV_EXAMPLE="${DRIVE_DEV}/example"
export DEV_LIB="${DRIVE_DEV}/libs"
export DEV_PROJECT="${DRIVE_DEV}/projects"
export DEV_TOOL="${DRIVE_DEV}/tools"

#----------------------------------------------------------------------------------------------------------------------#
