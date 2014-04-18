"=============================================================================
"     FileName: diff.vim
"         Desc: config diff 
"       Creator: Long
"      Version: 1.0
"      $Author: katosun2 $
"        $Date:  $
"   LastChange: 2013-10-11 23:13:43
"      History:
"=============================================================================
" set fileType syntax on
au BufRead,BufNewFile *.vim,*.js,*.html,*.htm,*.less,*.css :sy on

" defined browsers (e.g sg.lnk)
"browsersIMiku.vim
let g:htdoc_f5_open = 0
let g:htdoc_f5 = ["D:\\templates\\","http://127.0.0.1:81/"]
let g:htdocs = ["D:\\templates\\","D:\\work\\","D:\\sinaneko\\5\\","D:\\aawwwroot\\wwwroot\\","D:\\yidmcom\\"]
let g:servurls = ["http://127.0.0.1:1108/","http://127.0.0.1:1105/","http://127.0.0.1:1115/","http://127.0.0.1/","http://127.0.0.1:1015/"]

" 多个维基项目的配置
let g:vimwiki_list = [{'path': 'E:/360Yun/vimwiki/',
      \ 'path_html': '$VIM/vimwiki_html/',
      \ 'template_ext' : '.htm',
      \ 'template_path': '$VIMFILES/vimwiki_template/',
      \ 'template_default': 'default_template',
      \ 'diary_link_count': 5},
      \ {'path': 'Z:\'}]
