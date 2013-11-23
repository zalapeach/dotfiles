" -----------------------------------------------------------------------------
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   jj = <esc>  Very useful for keeping your hands on the home row          |
" |   ,n = toggle NERDTree off and on                                         |
" |   ,N = find current file in  NERDTree                                     |
" |                                                                           |
" |   ,FC = fuzzy find coverage files (or ,f)                                 |
" |   ,FF = fuzzy find files                                                  |
" |   ,FD = fuzzy find directory                                              |
" |   ,FL = fuzzy find in lines                                               |
" |   ,FB = fuzzy find buffers                                                |
" |   ,FR = fuzzy find refresh files                                          |
" |   ,p = go to previous file                                                |
" |   ,t = toogle taglist                                                     |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------


set nocompatible
let mapleader = ","
imap jj <Esc> " Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees

" load plugins on bundle folder ********************************************************
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()

" Indenting *******************************************************************
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent (local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>

" Cursor highlights ***********************************************************
set cursorline
set cursorcolumn

" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase

" Colors **********************************************************************
syntax on " syntax highlighting


" Status Line *****************************************************************
set showcmd
set ruler

" Line Wrapping ***************************************************************
set nowrap
set linebreak


" Directories *****************************************************************
" Setup backup location and enable
set backupdir=~/.vim/tmp/backup

" Set Swap directory
set directory=~/.vim/tmp/swap

" File Stuff ******************************************************************
filetype plugin indent on

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible chars


" Misc settings ***************************************************************
set backspace=indent,eol,start
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how

" History *********************************************************************
set history=1000 " increase history size

map <Leader>p <C-^> " Go to previous file

" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
"map <F5> :!ruby %<CR>
let ruby_fold=1
autocmd FileType ruby normal zR

" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" -----------------------------------------------------------------------------
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------

" NERDTree ********************************************************************
:noremap <Leader>n :NERDTreeToggle<CR>
:noremap <Leader>N :NERDTreeFind<CR>
let NERDTreeHijackNetrw=0 " User instead of Netrw when doing an edit /foobar
let NERDTreeMouseMode=1 " Single click for everything

" NERD Commenter **************************************************************
let NERDCreateDefaultMappings=0 " I turn this off to make it simple

" Toggle commenting on 1 line or all selected lines. Wether to comment or not
" is decided based on the first line; if it's not commented then all lines
" will be commented
:map <Leader>c :call NERDComment(0, "toggle")<CR>

" railsvim *******************************************************************
map <Leader>ra :AS<CR>
map <Leader>rs :RS<CR>

" nginx conf *********************************************************************
au BufRead,BufNewFile nginx.conf* set ft=nginx

" asciidoc conf ******************************************************************
au BufNewFile,BufRead *.txt,README,TODO,CHANGELOG,NOTES,*.asciidoc  setfiletype asciidoc

" json conf ******************************************************************
"
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
" external tool from http://lloyd.github.com/yajl/.
au! BufRead,BufNewFile *.json set equalprg=json_reformat
" external tool from http://github.com/dangerousben/jsonval.
au! BufRead,BufNewFile *.json set makeprg=jsonval\ %
au! BufRead,BufNewFile *.json set errorformat=%E%f:\ %m\ at\ line\ %l,%-G%.%#

" html ***********************************************************************
let g:no_html_toolbar = 'yes'

" 256 colors support for console :) ******************************************
set t_Co=256

colorscheme mustang
autocmd BufWritePre * :%s/\s\+$//e

set relativenumber
