" GUI
if has("gui_running")
    au GUIEnter * simalt ~x " max win
    set guioptions-=m       "  hide menu  
    set guioptions-=T       " hide tools  
    set guioptions-=L       " hide left scroll  
    set guioptions-=r       " hide right scroll  
    set guioptions-=b       " hide bottom scroll  
    "set showtabline=0      " hide Tab  
    
    " load gui lib
    let g:gvim_screen_lib = $VIMFILES.'/bin/lib/gvimfullscreen_x32.dll'

    " full win 
    nmap <F11> <ESC>:call ToggleFullScreen()<CR>   
    " to TOP
    nmap <silent><leader>T <esc>:call SwitchVimTopMostMode()<cr>
    " add alpha
    nmap <silent><leader>A <esc>:call SetAlpha(25)<cr>
    " dec alpha
    nmap <silent><leader>a <esc>:call SetAlpha(-25)<cr>

    " full fun
    function! ToggleFullScreen()
        call libcallnr(g:gvim_screen_lib, 'ToggleFullScreen', 1)
    endfunction

     " alpha
     let g:VimAlpha = 245
     function! SetAlpha(alpha)
         let g:VimAlpha = g:VimAlpha + a:alpha
         if g:VimAlpha < 0
             let g:VimAlpha = 15 
         endif
         if g:VimAlpha > 255
             let g:VimAlpha = 255
         endif
         call libcallnr(g:gvim_screen_lib, 'SetAlpha', g:VimAlpha)
     endfunction

     " set top
     let g:VimTopMost = 0
     function! SwitchVimTopMostMode()
         if g:VimTopMost == 0
             let g:VimTopMost = 1
         else
             let g:VimTopMost = 0
         endif
         call libcallnr(g:gvim_screen_lib, 'EnableTopMost', g:VimTopMost)
     endfunction

    " default alpha
    autocmd GUIEnter * call libcallnr(g:gvim_screen_lib, 'SetAlpha', g:VimAlpha)
 endif

" rember
augroup vimrcEx 
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"")<=line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" set status
set statusline=
set statusline+=%7*\ %{g:MyMode()}\ 
set statusline+=%1*\ [%f%m%r%h%w]\ 
set statusline+=%4*\ %Y\ 
set statusline+=%3*\ %{&ff},%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}\ 
set statusline+=%5*\ %3p%%/%LL\ 
set statusline+=%6*\ X:%2*%c\ %6*Y:%2*%l\ 
set statusline+=%8*\ %4*%{g:ShowFen()}\ 
set statusline+=\ %r%m%8*%=\ %8*%-16{strftime(\"%Y-%m-%d\ %H:%M\")}\ 
set statusline+=\ %5*©2014\ 


" Omni menu colors
hi Pmenu guifg=#CCCCCC guibg=#333333
hi PmenuSel guifg=#49AF47 guibg=#413C41 gui=bold


" 当前文件中快速查找光标下的单词
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>

"查看缓存文件列表:buffers,buffersN、b,buf,sb,sbuf 、sbufferN 打开缓冲内文件
nmap <silent><leader>ls <ESC>:ls<cr>

"新窗口打开文件,相关可查找:help gf"
map <A-o> <ESC><C-w><C-f>
map <leader>oo <ESC><C-w><C-f>

"将文件改为可写,set value! 可进行切换,?为查询当前状态
map <silent><A-m> <ESC>:set ma!<cr>
map <silent><A-n> <ESC>:set ro!<cr>

"直接复制当前行
vmap <C-Down> <ESC>:move '>+1<cr>gv
imap <A-Down> <ESC>yyp
map <A-Down> <ESC>yyp
vmap <A-Down> <ESC>yyp
imap <A-Up> <ESC>yyP
map <A-Up> <ESC>yyP
vmap <A-Up> <ESC>yyP

"移动当前行
nmap <C-Down> <ESC>:<C-u>move .+1<cr>
nmap <C-Up> <ESC>:<C-u>move .-2<cr>
"imap <C-A-Down> <C-oddd>:<C-u>move .+4<cr>
"imap <C-A-Up> <C-o>:<C-u>move .-1<cr>
imap <C-Down> <ESC>:move '>+1<cr>gv
vmap <C-Down> <ESC>:move '>+1<cr>gv
imap <C-Up> <ESC>:move '<-2<cr>gv
vmap <C-Up> <ESC>:move '<-2<cr>gv

"c-z,a-z转为esc
imap <C-z> <ESC>:w<cr>
map <C-z> <ESC>:w<cr>
vmap <C-z> <ESC>:w<cr>

" 强制保存
"map <silent><leader>ww <ESC>:w!<cr>
"imap <silent><leader>ww <ESC>:w!<cr>
"vmap <silent><leader>ww <ESC>:w!<cr>

"强制退出使用Q"
map <silent><A-q> <ESC>:q!<cr>
map <silent><leader>q <ESC>:bdele!<cr>
map <silent><localleader>ww <ESC>:w!<cr>

"粘贴系统剪贴板
"v模式，输入 "Ny ,N为寄存器地址, *为系统，实现多窗口复制
vmap <A-c> "*y
imap <A-v> <ESC>"*p
map <A-v> "*p

"使窗口平分高宽
"map <leader>wm <ESC><C-w>=

"使当前窗口高度最大化
"map <leader>wh <ESC>:res<cr>

" 切换自动换行
map <silent><leader>wp <esc>:set wrap!<cr>

" 全选
nmap <leader>gg <ESC>ggVG

"光标后面输入日期
nmap <leader>dt <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap <leader>dt <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

"选中内容搜索,<C-r>N N为寄存器地址，可以在命令行中粘贴内容
vmap <leader>l y/<C-r>0<cr>

"使窗口宽度最大化,vertical、vert
map <leader>mw <ESC>:vert res<cr>

"快速切换各种文件类型
nnoremap <leader>1 :set ft=html<CR>
nnoremap <leader>2 :set ft=css syn=css<CR>
nnoremap <leader>3 :set ft=javascript syn=javascript<CR>
nnoremap <leader>4 :set ft=php<CR>
nnoremap <leader>5 :set ft=vim<CR>
nnoremap <leader>6 :set ft=less<CR>
nnoremap <leader>7 :set ft=smarty<CR>

" 调用特殊功能方法
map <F2> <ESC>:call g:SelectFunc()<CR>  

" 快捷切换折叠定义
nmap <silent><leader>nf <esc>:call g:SelectNextFen()<cr>
nmap <silent><leader>pf <esc>:call g:SelectPrevFen()<cr>


" mode show
func! g:MyMode()
    let s:str = ''
    "get cur mode
    let s:cur = mode()
    if s:cur == 'i'
        "let s:str = '编辑模式'
        let s:str = 'o(*￣▽￣*)o '
        hi User7 guifg=#49AF47  guibg=#413C41 gui=bold
    elseif s:cur =='n'
        "let s:str = '一般模式'
        let s:str = 'o(°▽、°o)'
        hi User7 guifg=#4386C7  guibg=#413C41 gui=bold
    elseif s:cur =='V'
        "let s:str = '可视模式'
        let s:str = '（⊙＿⊙）'
        hi User7 guifg=#FF6600  guibg=#413C41 gui=bold
    elseif s:cur =='c'
        "let s:str = '查找模式'
        let s:str = '(￣ c￣)'
        hi User7 guifg=#FF0066  guibg=#413C41 gui=bold
    "编辑下 c-v c-v
    elseif s:cur =='' 
        "let s:str = "块模式"
        let s:str = '（⊙＿⊙）'
        hi User7 guifg=#FF6600  guibg=#413C41 gui=bold
    else
        let s:str = s:cur
    endif

    return s:str
endfunc


" 特别函数处理方式选择
function! g:SelectFunc()
	let dialogtxt = "选择操作:\n1:删除全部空行\n2:将^M转换\n3:复制ctags.cnf\n4:编译当前目录tags\n5:添加Gvim到右键\n6:自动编译Less"
	let fw = inputdialog(dialogtxt)
	if fw != ""
		if fw == 1
			" deleter empty line
			exec ":g/^$/d"
		elseif fw==2
			" change ^M to enter
			call g:ChangMtoCR()
		elseif fw==3
            let file_bat=$VIMFILES.'/bin/ctags/copy.bat'
            let file_bat=substitute(file_bat,'\','/',"g")
            exec ":! ".file_bat
		elseif fw==4
			if has("win32") || has("win64")
				let ctagsdir=$VIMFILES.'/bin/ctags/ctags.exe'
				let tmp_dir=GetPWD()
				let ctagsdir=substitute(ctagsdir,'Program Files','Progra~1',"g")
				"exec  ":!" . ctagsdir . " -R --fields=+lS " . tmp_dir
				let cmd=ctagsdir . " -R --fields=+lS " . tmp_dir
				let cmd_output=system(cmd)
				echo cmd_output
			endif
		elseif fw==5
			call g:SetRightMouse()
		elseif fw==6
			call g:OpenComileLess()
		endif
	endif    
endf

"添加vim到右键
func! g:SetRightMouse()
	if has("win32") || has("win64")
		let l:regs = 'reg add "HKEY_CLASSES_ROOT\*\shell\Edit With Gvim" /f'
		let l:regs = system(l:regs)
		let l:regs = 'reg add "HKEY_CLASSES_ROOT\*\shell\Edit With Gvim\command" /f'
		let l:regs = system(l:regs)
		let l:regs = 'reg add "HKEY_CLASSES_ROOT\*\shell\Edit With Gvim\command" /t "REG_SZ" /d "'.$VIMHOME.'\gvim.exe \"%1\"" /f'
		let l:regs = system(l:regs)
		echo "done! ^_^"
	endif
endfunc

" 打开自动编译less
func! g:OpenComileLess()
	autocmd! BufWritePost,FileWritePost *.less call g:CompileLess()
	echo "Open auto complie less to css succ! ^_^"
endfunc


" ^m替换成CR,这里的“^M”要使用编辑模式下“CTRL-V CTRL-M”生成，而不是直接键入“^M”。
" c:confirm，每次替換前會詢問。 e:不顯示 error。 g:globe，不詢問，整行替換。 i:ignore 不分大小寫。 
function! g:ChangMtoCR()
    exec ":%s/^$//e"   
    exec ":%s/$//e"    
    exec ":%s//\r/e"   
endf    


" 折叠方式选择
function! g:SelectNextFen()
    let l:foldname = &foldmethod

    if l:foldname == 'marker'
        exec ":set foldmethod=manual"
    elseif l:foldname == 'manual'
        exec ":set foldmethod=syntax"
    elseif l:foldname == "syntax"
        exec ":set foldmethod=indent"
    elseif l:foldname == "indent"
        exec ":set foldmethod=diff"
    elseif l:foldname == "diff"
        exec ":set foldmethod=expr"
    else
        exec ":set foldmethod=marker"
    endif
endf
function! g:SelectPrevFen()
    let l:foldname = &foldmethod

    if l:foldname == 'diff'
        exec ":set foldmethod=indent"
    elseif l:foldname == 'manual'
        exec ":set foldmethod=marker"
    elseif l:foldname == "syntax"
        exec ":set foldmethod=manual"
    elseif l:foldname == "indent"
        exec ":set foldmethod=syntax"
    elseif l:foldname == "marker"
        exec ":set foldmethod=expr"
    else
        exec ":set foldmethod=diff"
    endif
endf


" 上次修改
fu! g:FileTime()
    let ext=tolower(expand("%:e"))
    let fname=tolower(expand('%<'))
    let filename=fname . '.' . ext
    let msg=""
    let msg=msg." ".strftime("(Modified %Y/%m/%d %H:%M:%S)",getftime(filename))
    return msg
endf


"获取当前目录
function! g:GetPWD()
    return substitute(getcwd(), "", "", "g")
endfunction


" 中文编码转换 for win 
function! g:TranCoding(str,to,from)
    if has("win32") || has("win64") && exists("iconv") && v:lang == 'zh_CN.utf-8'
        let dialogtxt = iconv(a:str,a:to,a:from)
        return dialogtxt
    endif
    return str;
endf

" 路径处理
function! g:PathProc(file)
    let current_file = substitute(a:file,'Program Files','Progra~1','g')
    return current_file
endfunction

" 显示缩进方式
function! g:ShowFen()
    let l:foldname = &foldmethod
    return toupper(l:foldname)
    "if l:foldname == 'manual'
        "return "手动"
    "elseif l:foldname == 'syntax'
        "return "语法"
    "elseif l:foldname == "expr"
        "return "表达式"
    "else
        "return l:foldname
    "endif
endf
