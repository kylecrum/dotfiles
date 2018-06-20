call plug#begin()

" General
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'

" NeoVIM
if has('nvim')
  " Autocomplete for TS and Go
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'mhartington/nvim-typescript', { 'branch': 'python' }
  Plug 'zchee/deoplete-go', {'do': 'make', 'for': 'go'}
endif

" Frontend
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'HerringtonDarkholme/yats.vim'

" Go
Plug 'fatih/vim-go', {'for': 'go'}

" Ruby
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

source ~/.vim-config/local-plug.vim

call plug#end()
