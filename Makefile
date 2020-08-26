.DEFAULT_GOAL := setup
EXCLUDE := README.md Makefile Brewfile vscode-settings.json vscode-keybindings.json config vscode-snippets
FILES := $(shell ls)
SOURCES := $(filter-out $(EXCLUDE),$(FILES))
DOTFILES := $(patsubst %, ${HOME}/.%, $(SOURCES))
VS_CODE_SETTINGS := ${HOME}/Library/Application\ Support/Code/User/settings.json
VS_CODE_KEYBINDINGS := ${HOME}/Library/Application\ Support/Code/User/keybindings.json
VS_CODE_SNIPPETS := ${HOME}/Library/Application\ Support/Code/User/snippets
NVIM_CONFIG := ${HOME}/.config/nvim/init.vim
NVIM_PLUG := ${HOME}/.local/share/nvim/site/autoload/plug.vim
VIM_PLUG := ${HOME}/.vim/autoload/plug.vim

.PHONY: update vim-install nvm-install brew-install brew-bundle uninstall vscode-extensions

install: all
all: $(DOTFILES) $(NVIM_CONFIG) $(VS_CODE_SETTINGS) $(VS_CODE_KEYBINDINGS) $(VS_CODE_SNIPPETS) vscode-extensions vim-install git-user
setup: brew-install brew-bundle nvm-install all
git-user: ${HOME}/.gituser

nvim-config: $(NVIM_CONFIG)

$(NVIM_CONFIG):
	mkdir -p ${HOME}/.config/nvim
	ln -sfn $(PWD)/config/nvim/init.vim $@

$(DOTFILES): $(addprefix ${HOME}/., %) : ${PWD}/%
	ln -sfn $< $@

$(VS_CODE_SETTINGS):
	ln -sfn $(PWD)/vscode-settings.json "$@"

$(VS_CODE_KEYBINDINGS):
	ln -sfn $(PWD)/vscode-keybindings.json "$@"

$(VS_CODE_SNIPPETS):
	ln -sfn $(PWD)/vscode-snippets "$@"

vscode-extensions:
	./vscode_extensions.sh

$(NVIM_PLUG) $(VIM_PLUG):
	@curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

${HOME}/.gituser:
	@read -p "Enter Your Full Name for Git Commits: " name; \
		read -p "Enter Your Email for Git Commits: " email; \
		git config -f ~/.gituser user.name "$$name"; \
		git config -f ~/.gituser user.email "$$email"

nvm-install:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

brew-install:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew-bundle:
	brew bundle

uninstall:
	@echo $(DOTFILES) | xargs -n 1 sh -c 'unlink $$0 || true'

vim-install: $(NVIM_PLUG) $(VIM_PLUG)
	@echo "Installing vim plugins"
	@pip3 install --upgrade neovim
	@nvim +PlugInstall +qa
	@vim +PlugInstall +qa

update: all
	@git pull
