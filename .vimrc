set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include PowerLine
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

Plugin 'tpope/vim-fugitive'

" http://sjl.bitbucket.org/gundo.vim/
Plugin 'Gundo'

Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/BufExplorer'
"Plugin 'bling/vim-airline'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'

" https://github.com/jeffkreeftmeijer/vim-numbertoggle
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

"Plugin 'Valloric/YouCompleteMe'
"set runtimepath-=~/.vim/bundle/YouCompleteMe

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:pymode_lint_on_fly = 1
let g:pymode_lint_cwindow = 0
let g:pymode_lint_ignore = "E501"
let g:pymode_rope = 0
" let g:pymode_rope_lookup_project = 0
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 80
let g:pymode_lint_checkers = ['pyflakes', 'pep8']

let NERDSpaceDelims = 1

set autoindent
set number
set expandtab
set tabstop=4
set shiftwidth=4
set smartcase
set incsearch
set modeline
set nowrap
set encoding=utf-8
set fileencoding=utf-8
set directory=~/.vim/swap
set backup
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set timeoutlen=200
set tw=80
set relativenumber

"powerline settings:
"set statusline=2
let g:powerline_loaded = 1
"use 256 colors
set t_Co=256

"I think these may be the default
set ruler
syntax on

"set autochdir
"set hlsearch
"set syntax - DON'T ENABLE - this causes the following prompt on startup:
"Press ENTER or type command to continue
"set list
"remove trailing whitespace
match ErrorMsg '\s\+$'

"remove trailing whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

:set wrap lbr

"These allow the use of CTRL+SHIFT+k/CTRL+SHIFT+j to move lines up/down
"It is a modified version of the script at http://vim.wikia.com/wiki/Moving_lines_up_or_down
:nnoremap <C-S-j> :m .+1<CR>==
:nnoremap <C-S-k> :m .-2<CR>==
:inoremap <C-S-j> <Esc>:m .+1<CR>==gi
:inoremap <C-S-k> <Esc>:m .-2<CR>==gi
:vnoremap <C-S-j> :m '>+1<CR>gv=gv
:vnoremap <C-S-k> :m '<-2<CR>gv=gv

"make vim move cursor up/down 1 displayed line at a time on line wrap
"note: this will change the behavior of commands like dd
:noremap <buffer> <silent> j gj
:noremap <buffer> <silent> k gk
:noremap <buffer> <silent> 0 g0
:noremap <buffer> <silent> $ g$

":nnoremap <C-Space>i<Space><Esc>
:nnoremap <CR> o<Esc>
" the following version will instead break at the current location rather than inserting a line after the end of the current line.
" :nnoremap <CR> i<CR><Esc>

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
nnoremap <F5> :GundoToggle<CR>

"auto-reload .vimrc whenever I save it.
"au! BufWritePost .vimrc source %

" another cool thing I've done - set the V mark at the top of the .vimrc file. Whenever I type `V, it will take me to the top of that file.

"installed plugins:
"BufExplorer - http://www.vim.org/scripts/script.php?script_id=42
"   use \be to open
"cr-bs-del-space-tab - http://www.vim.org/scripts/script.php?script_id=1579 (keys work in normal mode like they do in edit mode)
"NERD_commenter
"CTRLP (not installed but sounds useful)

"ideas:
"   add a command to see which namespace I'm in
"   shortcut to add newline without entering insert mode
"   add a command to print the full path of the file (remap something to
"   :echo expand('%:p')"


"Sources
"blog.mojotech.com/a-veterans-vimrc/
"http://akashagrawal.me/blog/2013/12/17/my-vimrc/
"https://github.com/gmarik/Vundle.vim
"Friends
