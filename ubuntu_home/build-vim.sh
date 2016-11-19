#!/bin/bash

sudo apt-get install -y lua5.2 liblua5.2 python python-dev ruby ruby-dev

cd ~/workspace

git clone --recursive https://github.com/vim/vim.git

cd ~/workspace/vim

./configure --with-features=huge --disable-darwin --enable-gui=no --without-x --enable-multibyte --enable-luainterp --enable-pythoninterp --enable-rubyinterp LUA_PREFIX=/usr --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/  --with-compiledby="Neo Tan <neotan.github.io>" --prefix=/usr

make && sudo make install

vim --version
