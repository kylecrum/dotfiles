Common Dotfiles
---

Don't have your own dotfiles? Don't sweat it. Here's a basic set to get you up and running. Included is support for vim and neovim, with same sane defaults and a set of basic vscode settings. There are also a number of homebrew packages included that should get you up and running on most projects pretty quickly.

You'll probably still need to setup a few things by hand, but this should give you a running start.

## Installing
You'll need your [ssh keys setup](https://help.github.com/articles/connecting-to-github-with-ssh/) and access to github.

`git clone git@github.com:reverbdotcom ~/dev/dotfiles`

Let's install dependencies, get some basic dotfiles in place, and get your editors ready.

`cd ~/dev/dotfiles && make setup`

## Customizing
These are some pretty basic dotfiles, so you may want to customize them more to fit your workflow.

* Want to add something to your shell config? Add it to ~/.bash.local
* Want to add something to vim? Add it to ~/.vim/local.vim
* Want to add a new plugin to vim? Add it to ~/.vim/local-plug.vim
