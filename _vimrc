" set vim path
let $VIMFILES=$VIM.'/vimfiles'
let $VIMRC=$VIM.'/_vimrc'
let $VIMHOME=$vim.'/vim73'
let $VUNDLE=$VIMFILES."/bundle"
let $UNDOCACHE=$VIM."/.cache/undodir"
let $BACKUPCACHE=$VIM."/.cache/backup"
let $SWPCACHE=$VIM."/.cache/swp"
let $VIEWCACHE=$VIM."/.cache/view"
let $BROWSERS=$VIM."/.cache/browsers"
let $JSLBIN=$VIMFILES.'/bin/jsl-0.3.0/jsl.exe'
let $AGBIN=$VIMFILES.'/bin/lib/ag.exe'


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

Plugin 'katosun2/jellybeans.vim'
Plugin 'katosun2/imiku'
Plugin 'katosun2/xml.vim'
Plugin 'katosun2/vim-dict'
Plugin 'katosun2/load_template'
Plugin 'katosun2/tern_for_vim'

Plugin 'vim-scripts/DoxygenToolkit.vim'

Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'honza/vim-snippets'

Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'mbbill/fencview'

Plugin 'tpope/vim-surround'

Plugin 'majutsushi/tagbar'

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'

Plugin 'vim-scripts/vimwiki'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'sirver/ultisnips'

filetype plugin indent on


" set color
color jellybeans


" set doc format
set fileformats=unix,dos
set nobomb
set formatoptions=tcrqn


" set view
set ambiwidth=double
set tabstop=4
set smarttab
set autoindent
set shiftwidth=4
set softtabstop=4
set list  
set listchars=tab:\|-
set nu
set numberwidth=5
set title 
set titlestring=%(%F%)\ 
set titlelen=78
set fillchars+=vert:\ ,stl:\ ,stlnc:\
set whichwrap+=<,>,[,]
set iskeyword+=_,$,@,%,#,-
set t_Co=256


" tab for cmd-line commplement
set wildmenu
set scrolloff=5
set cmdheight=5
set showcmd
set noshowmode
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


" set status
set laststatus=2


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


" set view
autocmd! bufenter,bufnewfile,winenter,tabenter * cd %:p:h
autocmd! bufwritepost $VIMRC source $VIMRC
au BufWinLeave _vimrc,*.js,*.html,*.htm,*.less,*.css,*.php,*.wiki mkview
au BufWinEnter _vimrc,*.js,*.html,*.htm,*.less,*.css,*.php,*.wiki silent loadview
if exists('*mkdir') && !isdirectory($VIEWCACHE)
    sil! cal mkdir($VIEWCACHE, 'p')
endif
set viewdir=$VIEWCACHE


" set swp
set noswapfile
if exists('*mkdir') && !isdirectory($SWPCACHE)
    sil! cal mkdir($SWPCACHE, 'p')
endif
set directory=z:/.cache/swp,$SWPCACHE


" set backup
set backup
set writebackup
set history=10240
set backupcopy=auto
if exists('*mkdir') && !isdirectory($BACKUPCACHE)
    sil! cal mkdir($BACKUPCACHE, 'p')
endif
set backupdir=Z:,$BACKUPCACHE


" set undo
set undofile
set undolevels=10000
set undoreload=10000
if exists('*mkdir') && !isdirectory($UNDOCACHE)
    sil! cal mkdir($UNDOCACHE, 'p')
endif
set undodir=$UNDOCACHE


"load my config
source $VIM/vimfiles/conf/conf.vim
source $VIM/vimfiles/conf/plugin.vim
source $VIM/vimfiles/conf/diff.vim


" vim: set et fdm=marker ff=dos sts=4 sw=4 ts=4 tw=78 : 
