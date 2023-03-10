#!/usr/bin/env bash

function exists() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    echo $LIST | tr "$DELIMITER" '\n' | grep -F -q -x "$VALUE"
}

NODES="desktop notebook xps15"

if ! exists "$NODES" " " $1; then
    echo "$1 is not a valid node name, exiting ..."
    exit 1
fi

doas nixos-rebuild switch -I nixos-config=nodes/$1/configuration.nix
