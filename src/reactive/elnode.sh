#!/bin/bash

# This will be sourced in the hook-context.
source $CHARM_DIR/bin/charms.reactive.sh
PATH=$CHARM_DIR/app:$PATH

@hook '{install,upgrade-charm}'
function install() {
    installEmacs
    install-elnode.el
    status-set active "Ready."
    set_state "elnode.available"
}

function installEmacs() {
    status-set maintenance "Ensuring emacs is installed."
    sudo apt-get -y upgrade emacs24-nox
}

reactive_handler_main
