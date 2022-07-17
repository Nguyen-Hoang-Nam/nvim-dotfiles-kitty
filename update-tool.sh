#!/bin/bash

npm i -g bash-language-server \
    vscode-langservers-extracted \
    emmet-ls \
    @tailwindcss/language-server \
    dockerfile-language-server-nodejs \
    typescript-language-server \
    typescript \
    svelte-language-server \
    yaml-language-server

pip install cmake-language-server \
    pyright

curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer

chmod +x ~/.local/bin/rust-analyzer
