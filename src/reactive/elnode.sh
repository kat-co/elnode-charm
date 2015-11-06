#source $(which charms.reactive.sh)
source $CHARM_DIR/bin/charms.reactive.sh

@hook '{install,upgrade-charm}'
function installEmacs() {
    juju-log "In installEmacs()"
    status-set maintenance "Ensuring emacs is installed."
    sudo apt-get -y upgrade emacs24
    status-set active "Ready."
}

reactive_handler_main
