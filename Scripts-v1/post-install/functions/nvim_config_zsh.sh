#!/usr/bin/zsh

function _log {
	local color=$1;
	local message=$2;
	if ! [[ $color =~ '^[0-9]$' ]] ; then
		case $(echo -e $color | tr '[:upper:]' '[:lower:]') in
			# black
			header) color=0 ;;
			# red
			error) color=1 ;;
			# green
			success) color=2 ;;
			# yellow
			welcome) color=3 ;;
			# blue
			title) color=4 ;;
			# purple
			info) color=5 ;;
			# cyan
			question) color=6 ;;
			# orange
			warning) color=202 ;;
			# white
			*) color=7 ;;
		esac
	fi
	tput bold;
	tput setaf $color;
	echo '-- '$message;
	tput sgr0;
}

#
#   ${1} - Root directory
#       - Docker: /root
#       - Server/Desktop: $HOME
#        - Default: $HOME
#
#
function configure_nvim {
    ROOT_DIR=${1:-$HOME}

    INIT_LUA="https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/init.lua"

    LUA_USER=(
        "https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/lua/user/autopairs.lua"
        "https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/lua/user/colorscheme.lua"
        "https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/lua/user/keymappings.lua"
        "https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/lua/user/null-ls.lua"
        "https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/lua/user/nvim-tree.lua"
        "https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/lua/user/options.lua"
        "https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/lua/user/plugins.lua"
        "https://raw.githubusercontent.com/paulschick/vps-configuration/master/dotfiles/nvim/lua/user/treesitter.lua"
    )

    _log title "Running 'configure_nvim' Function"
    _log warning "This function expects to be run with Zsh"

    _log info "g++ at least must be installed for TreeSitter"
    check_install_apt_package g++

    _log info "Creating and moving to '$HOME/.config/nvim'"

    CONF_ROOT=$ROOT_DIR/.config/nvim
    CONF=$CONF_ROOT/lua/user
    cd $CONF_ROOT || mkdir -p $CONF; cd $CONF_ROOT

    _log info "Pulling file $INIT_LUA"
    wget $INIT_LUA

    cd $CONF || mkdir -p $CONF; cd $CONF
    for FILE in "${LUA_USER[@]}"
    do
        _log info "Pulling file $FILE"
        wget $FILE
    done
}
