#! /usr/bin/env bash
dconf dump / | dconf2nix > home-manager/users/nate/dconf.nix

git add home-manager/users/nate/dconf.nix

git commit -m "nate: gnome: update dconf settings"

#TODO: get current user and make sure
# we're in flake parent dir
