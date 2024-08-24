#!/bin/bash

if [ "$1" == "--linux" ]; then
    wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    tar xzvf nvim-linux64.tar.gz
elif [ "$1" == "--windows" ]; then
    wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-win64.msi
    ./nvim-win64.msi
else
    echo "Please provide the operating system version by specifying --linux or --windows"
fi