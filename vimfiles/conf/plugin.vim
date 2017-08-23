" open browsers's lnk path
if exists('*mkdir') && !isdirectory($BROWSERS)
    sil! cal mkdir($BROWSERS, 'p')
endif
let $BROWSERS = $BROWSERS


" Load Template
let g:template_path = $VIMFILES.'/bundle/imiku/template/'
map <F8> <ESC>:LoadTemplate<cr>


" modeliner
let g:Modeliner_format = 'et fdm= ff= sts= sw= ts= tw='
map <silent><leader>sm <esc><s-g>o<esc>:Modeliner<cr>

" MRU
if exists('*mkdir') && !isdirectory($MRU)
    sil! cal mkdir($MRU, 'p')
endif
let MRU_File = $MRU . '/_vim_mru_files'
let MRU_Max_Entries = 10
let MRU_Include_Files = '\.vue$\|\.scss$\|\.opf$\|\.js$\|\.java$\|\.jsx$\|\.ejs$\|\.css$\|\.html$\|\.htm$\|\.php$\|\.json$'
let MRU_Window_Height = 10


" Ag search
if !executable("ag")
	let g:agprg=$AG . " --column --smart-case"
else
	let g:agprg="ag --column --smart-case"
endif


" NERDTree
let NERDMenuMode=0
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2 
" set ignore filetype
let NERDTreeIgnore=['Thumbs.db','\~$','.DS_Store','\.svn$','\.git','\.pyc$','\.mp3','\.jpg','\.gif','\.swf','\.rar','\.zip','\.pdf','\.gz','\.bz2','\.dmg','\.doc','\.tar','\.png','\.rtf']
map <silent><leader>uu <ESC>:NERDTree<cr>


" NERD_commenter && authorinfo
let g:vimrc_author='Ryu'   
let g:vimrc_email='ryu@imiku.com'   
let g:vimrc_homepage='http://www.imiku.com' 
map <leader>my <ESC>:AuthorInfoDetect<cr>   
imap <leader>my <ESC>:AuthorInfoDetect<cr>   

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
	\ 'javascript': { 'left': '// ', 'leftAlt': '/* ', 'rightAlt': ' */' },
    \ 'javascript.jquery': { 'left': '// ', 'leftAlt': '/* ', 'rightAlt': ' */' },
    \ 'scss': { 'left': '// ', 'leftAlt': '/* ', 'rightAlt': ' */' },
    \ 'less': { 'left': '/* ', 'right': ' */' },
    \ 'htmldjango': { 'left': '<!-- ', 'right': ' -->', 'leftAlt': '{# ', 'rightAlt': ' #}' },
    \ 'php': { 'left': '// ', 'leftAlt': '/* ', 'rightAlt': ' */' }
	\ }


" fencview
let g:fencview_autodetect=0
map <silent><F3> <ESC>:FencView<cr>


" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir = $VIMFILES."/bundle/imiku/UltiSnips"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
let g:snips_author_email = "neko@imiku.com"
let g:snips_author = "katosun2"


" YouCompleteMe
let g:ycm_global_ycm_extra_conf=$VIM.'/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_confirm_extra_conf=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1 
let g:ycm_cache_omnifunc=1
let g:ycm_complete_in_comments=1
let g:ycm_use_ultisnips_completer=1
set completeopt-=preview
let g:ycm_semantic_triggers={
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" block file format use ycm
let g:ycm_filetype_blacklist={
	\ 'tagbar' : 1,
	\ 'qf' : 1,
	\ 'notes' : 1,
	\ 'markdown' : 1,
	\ 'unite' : 1,
	\ 'text' : 1,
	\ 'vimwiki' : 1,
	\ 'css' : 1,
	\ 'pandoc' : 1,
	\ 'mail' : 1
\}


" doxygenToolkit for vim
let g:DoxygenToolkit_briefTag_pre = "@method "
let g:DoxygenToolkit_paramTag_pre = "@param { }"
let g:DoxygenToolkit_returnTag = "@return { } "
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:doxygenToolkit_authorName = "Ryu"
let g:doxygenToolkit_briefTag_funcName="no"
map <silent><leader>jd <esc>:Dox<cr>
inoremap <silent><leader>jd <esc>:Dox<cr>


" calendar
map <F9> :Calendar<cr>


" CtriP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_window = 'bottom,order:ttb,min:10,max:10,results:10'
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_open_new_file = 'h'
let g:ctrlp_max_files = 5000
let g:ctrlp_root_markers = ['.git','.svn']
if isdirectory("z:/")
    let g:ctrlp_cache_dir = 'z:/.cache/ctrlp'
else
    let g:ctrlp_cache_dir = $VIM.'/.cache/ctrlp'
endif
let g:ctrlp_max_depth = 5
let g:ctrlp_max_history = 0
let g:ctrlp_mruf_max = 250
let g:ctrlp_mruf_include = '\.html$\|\.less$\|\.css$\|\.scss$\|\.vue$\|\.js$\|\.jsx$\|\.ejs$\|\.php$'
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|zip|jpg|git|png)$',
    \ 'link': '',
\ }


" syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
nmap <leader>st <esc>:SyntasticToggleMode<cr>
nmap <leader>lo <esc>:lopen<cr>
nmap <leader>lc <esc>:lclose<cr>
map <silent><leader>jj <esc>:SyntasticCheck<cr>
inoremap <silent><leader>jj <esc>:SyntasticCheck<cr>

let g:syntastic_mode_map = { 
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
\ }

" add jshint checkers
"if !executable('jshint')
	"let g:syntastic_javascript_jshint_exec = $JSHINT
"else
	"let g:syntastic_javascript_jshint_exec = 'jshint'
"endif
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_jshint_args = '--config "' . $VIM . '/.jshintrc"'

" add eslint checkers
if !executable('eslint')
    let g:syntastic_javascript_eslint_exec = $JSHINT
else
    let g:syntastic_javascript_eslint_exec = 'eslint'
endif
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--no-eslintrc --config "' . $VIM . '/.eslintrc"'


" vim-jsx
let g:jsx_ext_required = 0


" AjaxMin comparess css/js 
if executable($AJAXMIN)
	let g:ajaxmin_cmd = $AJAXMIN
endif

let g:ajaxmin_cmd_jsopt = '-clobber:true -term'
let g:ajaxmin_cmd_cssopt = '-clobber:true -term -comments:hacks'

" vim: set noet fdm=manual ff=dos sts=4 sw=4 ts=4 tw=78 : 
