" set vim path
let $VIMFILES=$VIM.'\vimfiles'
let $VIMRC=$VIM.'\_vimrc'
let $VIMHOME=$vim.'\vim73'
let $VUNDLE=$VIMFILES."/bundle"


" set leader 
let mapleader=","
let g:mapleader=","
let maplocalleader="."
let g:maplocalleader="."


" set encode
if has("multi_byte")
    " A,set encoding
    set encoding=utf-8
    set fileencodings=utf-8,cp936,chinese,cp932
    set tenc=utf-8
    set maxcombine=4
    " open asia support
    set fo+=mBM
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)\|\(jp\)'
        set ambiwidth=double
    endif

    if has("win32") || has("win64")
        "set fenc=chinese
        set fenc=utf-8
        if version>=603
            set helplang=cn
        endif
    else
        set fenc=utf-8
    endif

    let &termencoding=&encoding

    " B,vim tips support
    language messages zh_CN.utf-8
    "set langmenu=zh_CN.utf-8
    "source $VIMFILES/delmenu.vim
    "source $VIMFILES/menu.vim
endif


" set cursor
set cursorline 
set cursorcolumn
set gcr=a:blinkoff0
set selection=inclusive 


" load plugin vundle
set nocompatible
filetype off  
set rtp+=$VIMFILES/bundle/vundle
call vundle#rc($VUNDLE)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'katosun2/imiku'
Plugin 'katosun2/load_template'
Plugin 'katosun2/vim-dict'

Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'mbbill/fencview'

Plugin 'tpope/vim-surround'

"Plugin 'majutsushi/tagbar'


Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'

filetype plugin indent on

let g:ycm_global_ycm_extra_conf=$VIMFILES.'\bundle\YouCompleteMe\cpp\ycm\.ycm_extra_conf.py'

" set color
color jellybeans


" set doc format
set fileformats=unix,dos
set nobomb
set formatoptions=tcrqn


" set view
set ambiwidth=double
set tabstop=4
" change tab to space
set expandtab
set smarttab
set autoindent
set shiftwidth=4
set softtabstop=4
set list  
set listchars=tab:\|-
set nu
set numberwidth=5
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set fillchars+=vert:\ ,stl:\ ,stlnc:\
set whichwrap+=<,>,[,],b,s
set iskeyword+=_,$,@,%,#,-
set t_Co=256
set t_Sb=^[[4%dm
set t_Sf=^[[3%dm


" tab for cmd-line commplement
set wildmenu
set scrolloff=5
set cmdheight=5
set showcmd
set report=0


" set font
set guifont=Consolas:h13:cANSI 
set guifontwide=Fixedsys:h13:cGB2312  
set linebreak 
set nowrap
set backspace=indent,eol,start 


" set search
set hlsearch incsearch
set ignorecase smartcase
set showmatch
set showfulltag
set magic
set gdefault


" set mouse
set mouse=a
set selection=exclusive
set selectmode=mouse,key


" set title
set title 
set titlestring=%(%F%)\ 
set titlelen=80


" set status
set laststatus=2


" set backup
set noswapfile
set backup
set writebackup
set history=10240


" set optimization
set timeout
lcd D:/
nmap Q <Esc>
set hidden
set bsdir=buffer


" set warn
set noerrorbells            
set novb            
set t_vb=""


" set foldmethod
set fen
set foldmethod=manual
set foldlevel=1
set foldcolumn=4
set modeline
hi Folded guibg=#282828 guifg=#CE542E
hi FoldColumn guibg=#282828 guifg=#CE542E


" set global info
set viminfo+=!
set sessionoptions-=curdir


" set autocmd
autocmd! bufenter,bufnewfile,winenter,tabenter * cd %:p:h
autocmd! bufwritepost $VIMRC source $VIMRC
" auto save foldinfo
au BufWinLeave _vimrc,*.js,*.html,*.htm,*.less,*.css,*.php,*.wiki silent mkview
au BufWinEnter _vimrc,*.js,*.html,*.htm,*.less,*.css,*.php,*.wiki silent loadview


" set catch path
if isdirectory($VIM."/swp")
    set directory=z:,$VIM/swp
else
    " 不设置.swp 文件 
    set noswapfile
endif

if isdirectory($VIM."/backup")
    set backupcopy=auto
    set backupdir=Z:,$VIM/backup
    "set patchmode=.orig~
endif

if isdirectory($VIM."/undodir")
    if v:version>='703' 
        set undodir=z:,$VIM/undodir
        set undofile
        set undolevels=10000
        set undoreload=10000
    endif
endif


"load my config
source $VIM/vimfiles/conf/conf.vim
source $VIM/vimfiles/conf/plugin.vim
"source $VIM/vimfiles/conf/neocomplcache.vim
source $VIM/vimfiles/conf/diff.vim


" vim: set et fdm=marker ff=dos sts=4 sw=4 ts=4 tw=78 : 
