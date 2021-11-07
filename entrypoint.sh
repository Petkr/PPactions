#!/bin/bash

cd $( cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P )

repo_name="$1"
script_name="$2"
shift 2

pacman --noconfirm -Syyy

pacman --noconfirm -S github-cli

for package in $@ # no quotes is intended
do
    pacman --noconfirm -S "$package"
done

gh repo clone "$repo_name" repo/

bash "repo/$script_name"
