" open browsers's lnk path
let $BROWSERS = $VIM.'\browsers'


" modeliner
let g:Modeliner_format = 'et fdm= ff= sts= sw= ts= tw='
map <silent><leader>sm <esc><s-g>o<esc>:Modeliner<cr>


" calendar
map <F9> :Calendar<cr>


" AjaxMin comparess css/js 
let g:ajaxmin_cmd = $VIMFILES.'/bin/Microsoft-Ajax-Minifier-4/AjaxMin.exe'
let g:ajaxmin_cmd_jsopt = '-clobber:true -term'
let g:ajaxmin_cmd_cssopt = '-clobber:true -term -comments:hacks'

" Load Template
let g:template_path = $VIMFILES.'\template\'
map <F8> <ESC>:LoadTemplate<cr>


" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory=$VIMFILES.'\neosnippets'


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






















" Tag list (ctags)
let g:tlist_javascript_settings = 'javascript;o:object;f:function;m:member;s:string;a:array'
let Tlist_Ctags_Cmd=$VIMFILES.'/bin/ctags/ctags.exe'  "设定windows系统中ctags程序的位置
let Tlist_Ctags_Cmd = substitute(Tlist_Ctags_Cmd,'Program Files','Progra~1','g')
let Tlist_Ctags_Cmd = g:TranCoding(Tlist_Ctags_Cmd,"utf-8","gbk")
let Tlist_Auto_Open=0                        "关闭自动打开列表
let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=0                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
let Tlist_Enable_Fold_Column=1    "使taglist插件不显示左边的折叠行，
let Tlist_WinWidth=30             "taglist窗口宽度
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Use_SingleClick=1
let Tlist_Close_On_Select=1
"set tags=./tags,./../tags,./**/tags
set tags=$VIM.'/ctags.cnf'
map <F10> <ESC>:TlistToggle<CR>

" lookupfile setting
let g:LookupFile_MinPatLength = 4               "最少输入4个字符才开始查找
let g:LookupFile_PreserveLastPattern = 1        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"if filereadable("./tags")                       "设置tag文件的名字
"    let g:lookupfile_tagexpr = '"./tags"'
"endif
""映射LookupFile为,lk 在Tag文件中查找
nmap <silent><leader>lk <ESC>:LUTags<cr>
""映射LUBufs为,ll 在缓存区查找
nmap <silent><leader>ll <ESC>:LUBufs<cr>
""映射LUWalk为,lw 在目录结构查找
nmap <silent><leader>lw <ESC>:LUWalk<cr>
nmap <silent><leader><F5> <ESC>:LUWalk<cr>
nmap <silent><F5><F5> <ESC>:LUWalk<cr>


"TurboMark
nmap <silent><leader>mm :call g:MarkLine()<CR>
nmap <silent><leader>'' :TurboFind<CR>
nmap <silent><leader>m' :TurboClear<CR>

" Mark
nmap <silent><leader>ms :MarkSave<cr>
nmap <silent><leader>ml :MarkLoad<cr>


" yankring：寄存器可视操作
map <silent><leader>p :YRShow<cr>

"complie Less
"auto open complie less to css 1: auto | 0:manual
let g:less_complie = 0
" 1 min && mutline | 2 min && inline | 3 base
let g:less_opt = 2
map <silent><leader>l1 <esc>:let g:less_opt=1<cr>:echo 'Done! now is min && mutline ^_^'<cr>
map <silent><leader>l2 <esc>:let g:less_opt=2<cr>:echo 'Done! now is min && inline ^_^'<cr>
map <silent><leader>l3 <esc>:let g:less_opt=3<cr>:echo 'Done! now is base ^_^'<cr>
map <f6> <esc>:call g:OpenComileLess()<cr>
inoremap <f6> <esc>:call g:OpenComileLess()<cr>

"jsdoc.vim
let g:jsdoc_input_description = 0
" @function and @name append to JsDoc.
let g:jsdoc_additional_descriptions = 1
map <silent><leader>jd <esc>:JsDoc<cr>
inoremap <silent><leader>jd <esc>:JsDoc<cr>

"CtriP
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ca'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|lnk|gif|bmp|jpg|png)$'
  \ }
