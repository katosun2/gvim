" open browsers's lnk path
if exists('*mkdir') && !isdirectory($BROWSERS)
    sil! cal mkdir($BROWSERS, 'p')
endif
let $BROWSERS = $BROWSERS


" modeliner
let g:Modeliner_format = 'et fdm= ff= sts= sw= ts= tw='
map <silent><leader>sm <esc><s-g>o<esc>:Modeliner<cr>


" calendar
map <F9> :Calendar<cr>


" html.xml
let g:xml_createdocument = 0


" complie Less
let g:less_complie = 0
let g:less_opt = 2
map <silent><leader>l1 <esc>:let g:less_opt=1<cr>:echo 'Done! now is min && mutline ^_^'<cr>
map <silent><leader>l2 <esc>:let g:less_opt=2<cr>:echo 'Done! now is min && inline ^_^'<cr>
map <silent><leader>l3 <esc>:let g:less_opt=3<cr>:echo 'Done! now is base ^_^'<cr>
map <f6> <esc>:call g:OpenComileLess()<cr>
inoremap <f6> <esc>:call g:OpenComileLess()<cr>


" AjaxMin comparess css/js 
let g:ajaxmin_cmd = $VIMFILES.'/bin/Microsoft-Ajax-Minifier-4/AjaxMin.exe'
let g:ajaxmin_cmd_jsopt = '-clobber:true -term'
let g:ajaxmin_cmd_cssopt = '-clobber:true -term -comments:hacks'


" Load Template
let g:template_path = $VIMFILES.'/bundle/imiku/template/'
map <F8> <ESC>:LoadTemplate<cr>


" NERDTree
let NERDMenuMode=0
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2 
" set ignore filetype
let NERDTreeIgnore=['Thumbs.db','\~$','.DS_Store','\.svn$','\.git','\.pyc$','\.mp3','\.jpg','\.gif','\.swf','\.rar','\.zip','\.pdf','\.gz','\.bz2','\.dmg','\.doc','\.tar','\.png','\.rtf']
map <silent><leader>uu <ESC>:NERDTree<cr>


" NERD_commenter && authorinfo
let g:vimrc_author='奇迹方舟'   
let g:vimrc_email='neko@imiku.com'   
let g:vimrc_homepage='http://www.imiku.com' 
map <leader>my <ESC>:AuthorInfoDetect<cr>   
imap <leader>my <ESC>:AuthorInfoDetect<cr>   


" fencview
let g:fencview_autodetect=0
map <silent><F3> <ESC>:FencView<cr>


" YouCompleteMe
let g:ycm_global_ycm_extra_conf=$VIM.'/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_confirm_extra_conf=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1 
let g:ycm_cache_omnifunc=0
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
	\ 'html' : 1,
	\ 'css' : 1,
	\ 'pandoc' : 1,
	\ 'mail' : 1
\}


" tern for vim
let g:tern_show_argument_hints = "no"
let g:tern_map_keys = 1
nmap <leader>tr <esc>:TernRefs<cr>
nmap <leader>tt <esc>:TernType<cr>
nmap <leader>td <esc>:TernDef<cr>
nmap <leader>tn <esc>:TernRename<cr>


" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir = $VIMFILES."/bundle/imiku/UltiSnips"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"
let g:snips_author_email = "neko@imiku.com"
let g:snips_author = "katosun2"


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
let g:ctrlp_mruf_include = '\.html\|\.less\|\.css|\.js$\|\.php$'
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|zip|jpg|git|png)$',
    \ 'link': '',
\ }


" Tagbar
"let g:tagbar_ctags_bin = $VIMFILES.'/bin/lib/ctags.exe'
"let g:tagbar_type_javascript = {
    "\ 'ctagsbin' : $VIMFILES.'/bin/doctorjs/bin/jsctags.cmd'
"\ }
"imap <F10> <esc>:Tagbar<cr>
"nmap <F10> :Tagbar<cr>

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
" add checkers
let g:syntastic_javascript_jsl_exec = $JSLBIN
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_jshint_conf = "jshint"


" Ag search
if !executable("ag")
	let g:agprg=$AGBIN . " --column --smart-case"
else
	let g:agprg="ag --column --smart-case"
endif


" javascript libs supports
let g:used_javascript_libs = 'jquery,requirejs'


" doxygenToolkit for vim
let g:DoxygenToolkit_briefTag_pre = "@method "
let g:DoxygenToolkit_paramTag_pre = "@param { } "
let g:DoxygenToolkit_returnTag = "@return { } "
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:doxygenToolkit_authorName="katosun2"
let g:doxygenToolkit_briefTag_funcName="no"
map <silent><leader>jd <esc>:Dox<cr>
inoremap <silent><leader>jd <esc>:Dox<cr>


" vimwiki
let g:vimwiki_w32_dir_enc='utf-8'
let g:vimwiki_camel_case = 0
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_menu = ''
let g:vimwiki_folding = 0
let g:vimwiki_CJK_length = 1
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
" map
inoremap <localleader>vt <esc>:VimwikiTable 
nmap <localleader>vt <esc>:VimwikiTable 
nmap <silent><localleader>vl <Plug>VimwikiToggleListItem
nmap <silent><localleader>vh <Plug>Vimwiki2HTML
nmap <silent><localleader>vth <esc>:VimwikiAll2HTML
nmap <silent><localleader>vtb <Plug>Vimwiki2HTMLBrowse
nmap <silent><localleader>vb <Plug>VimwikiGoBackLink
nmap <silent><localleader>vi <esc>:VimwikiGenerateLinks
nmap <silent><localleader>di <Plug>VimwikiDiaryIndex
nmap <silent><localleader>dl <Plug>VimwikiDiaryGenerateLinks
nmap <silent><localleader>dn <Plug>VimwikiDiaryNextDay
nmap <silent><localleader>dp <Plug>VimwikiDiaryPrevDay
au BufRead,BufNewFile,filetype *.vimwiki,VIMWIKI :sy on
