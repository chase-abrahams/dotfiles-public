" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Comments
    Plug 'tpope/vim-commentary'
    " Change dates fast
    Plug 'tpope/vim-repeat'
    " Surround
    Plug 'tpope/vim-surround'
    " auto set indent settings
    Plug 'tpope/vim-sleuth'
    " Git integration
    Plug 'tpope/vim-fugitive'
    " Git browser
    Plug 'tpope/vim-rhubarb'
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'kevinhwang91/rnvimr'
    " Snippets
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Better Whitespace
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'moll/vim-bbye'
    " Black
    Plug 'ambv/black'
    " Flake8
    Plug 'nvie/vim-flake8'
    " Vim latex
    Plug 'vim-latex/vim-latex'
    " Powerline status bar
    Plug 'Lokaltog/powerline'
    " Eslint
    Plug 'eslint/eslint'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " PEP 8 style guide
    Plug 'cburroughs/pep8.py'
    Plug 'vim-scripts/pep8'
    " Waka time monitoring
    Plug 'wakatime/vim-wakatime'
    " Pathfinder to give tips
    Plug 'danth/pathfinder.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
