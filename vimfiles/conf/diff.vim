"=============================================================================
"     FileName: diff.vim
"         Desc: config diff 
"       Creator: Long
"      Version: 1.0.1
"      $Author: katosun2 $
"        $Date:  $
"   LastChange: 2015-06-25 00:09:00
"      History:
"=============================================================================
" set fileType syntax on
"au BufRead,BufNewFile *.vim,*.js,*.html,*.htm,*.less,*.css :sy on

" defined browsers (e.g sg.lnk)
"browsersIMiku.vim
let g:htdoc_f5_open = 0
let g:htdoc_f5 = ["D:\\templates\\","http://127.0.0.1:81/"]
let g:htdocs = ["D:\\templates\\","D:\\work\\","D:\\sinaneko\\5\\","D:\\aawwwroot\\wwwroot\\","D:\\yidmcom\\"]
let g:servurls = ["http://127.0.0.1:1108/","http://127.0.0.1:1105/","http://127.0.0.1:1115/","http://127.0.0.1/","http://127.0.0.1:1015/"]

" 多个维基项目的配置
let g:vimwiki_list = [{'path': '$VIM/vimwiki/default/',
      \ 'path_html': '$VIM/vimwiki/default/_html/',
      \ 'template_ext' : '.tpl',
      \ 'template_path': '$VIMFILES/bundle/imiku/vimwiki_tpl/',
      \ 'template_default': 'default',
	  \ 'syntax': 'default',
	  \ 'ext': '.md',
      \ 'diary_link_count': 5},
      \ {'path': '$VIM/vimwiki/doku/',
	  \ 'syntax': 'doku',
	  \ 'ext': '.md'}]
