#!/bin/bash

# Visual Studio Code :: Package list
pkglist=(
bungcip.better-toml
castwide.solargraph
CoenraadS.bracket-pair-colorizer-2
DavidAnson.vscode-markdownlint
dbaeumer.vscode-eslint
dracula-theme.theme-dracula
eamodio.gitlens
geddski.macros
gerane.Theme-Solarized-dark
golang.go
groksrc.ruby
karunamurti.haml
mikestead.dotenv
mjmcloug.vscode-elixir
ms-azuretools.vscode-docker
ms-vscode.cpptools
ms-vsliveshare.vsliveshare
nobuhito.printcode
octref.vetur
Prisma.vscode-graphql
rebornix.ruby
redhat.vscode-yaml
vscodevim.vim
wingrunr21.vscode-ruby
yzhang.markdown-all-in-one
zxh404.vscode-proto3
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done