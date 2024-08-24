#!/bin/bash

if [ "$1" == "--linux" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
elif [ "$1" == "--windows" ]; then
    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
else
    echo "Please provide the operating system version by specifying --linux or --windows"
fi