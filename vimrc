let mapleader=";"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8
set termencoding=utf-8
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'nerdcommenter/NERD_commenter.vim'
Plugin 'nerdtree/NERD_tree.vim'
Plugin 'taglist/taglist.vim'
Plugin 'vim-fswitch/fswitch.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hari-rangarajan/CCTree'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'vim-go/go.vim'
"Plugin 'vim-gocode/godoc.vim'
"Plugin 'vim-godef/godef.vim'
call vundle#end()
colorscheme default
"nnoremap <silent> <F4> :Tlist<CR>
"nnoremap <silent> <F4> :TagbarToggle<CR>
"nnoremap <silent> <F5> :NERDTreeToggle<CR>
map <F6> :TagbarToggle<CR>
map <F7> :NERDTreeToggle<CR>
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 定义快捷键到行首和行尾
nmap LB 0
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 将 pathogen 自身也置于独立目录中，需指定其路径
runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
execute pathogen#infect()
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 总是显示状态栏
set laststatus=2
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止折行
set nowrap
"将un文件统一写入
let $VIMFILES = $HOME
set undofile
set undodir=$VIMFILES/.undodir
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'
let Powerline_symbols='compatible'
" 开启语法高亮功能
syntax enable
" " 允许用指定语法高亮配色方案替换默认方案
syntax on
" 自适应不同语言的智能缩进
filetype indent on
" " 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list
nnoremap <Leader>tl :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
            \ 'kinds' : [
            \ 'd:macros:1',
            \ 'g:enums',
            \ 't:typedefs:0:0',
            \ 'e:enumerators:0:0',
            \ 'n:namespaces',
            \ 'c:classes',
            \ 's:structs',
            \ 'u:unions',
            \ 'f:functions',
            \ 'm:members:0:0',
            \ 'v:global:0:0',
            \ 'x:external:0:0',
            \ 'l:local:0:0'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
            \ },
            \ }
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
"set tags+=/usr/include/c++/4.4.6/stdcpp.tags
"set tags+=/usr/include/sys.tags

autocmd BufNewFile *.cpp,*.cc,*.[ch],*.sh,*.java exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: XiaMing")
        call append(line(".")+2, "\# mail: xiaming@baidu.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "* Copyright(c) 2009-2017 Baidu Inc")
        call append(line(".")+1, "* All rights reserved")
        call append(line(".")+2, "*                       ")
        call append(line(".")+3, "* @filename: ".expand("%"))
        call append(line(".")+4, "* @brief: ")
        call append(line(".")+5, "* @version: ")
        call append(line(".")+6, "* @author: XiaMing")
        call append(line(".")+7, "* @date: ".strftime("%c"))
        call append(line(".")+8, " ************************************************************************/")
        call append(line(".")+9, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+10, "#include <iostream>")
        call append(line(".")+11, "using namespace std;")
        call append(line(".")+12, "int main(){")
        call append(line(".")+13, "    return 0;")
        call append(line(".")+14, "}")
        call append(line(".")+15, "")
    endif
    if &filetype == 'c'
        call append(line(".")+10, "#include <stdio.h>")
        call append(line(".")+11, "#include <stdlib.h>")
        call append(line(".")+12, "")
    endif
    if &filetype == 'cc'
        call append(line(".")+10, "#include <iostream>")
        call append(line(".")+11, "using namespace std;")
        call append(line(".")+12, "")
    endif
    autocmd BufNewFile * normal G
endfunc

let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
"set tags+=/usr/include/c++/4.4.4/stdcpp.tags
let NERDTreeMinimalUI=0
let NERDTreeWinPos="right"
let NERDTreeQuitOnOpen=1
"只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
"taglist窗口显示在右侧，缺省为左侧
let Tlist_Use_Right_Window =1
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
let g:ycm_global_ycm_extra_conf = '/home/mysql/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1
set tags=tags;
set autochdir

"cscope设置
set cscopequickfix=s-,c-,d-,i-,t-,e-
if filereadable("cscope.out")
    cs add cscope.out
endif
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
nmap <silent> <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <silent> <Leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <silent> <Leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <silent> <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>


nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30

"在以下文件中开启tagbar
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" 自动补全配置
set completeopt=longest,menu
" "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" "回车即选中当前项
"
" "上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" :\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1   " 开启 YCM
" 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2   "
" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    "
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1  " 语法关键字补全
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>  "force recomile with
" syntastic
nnoremap <leader>lo :lopen<CR>   "open locationlist
nnoremap <leader>lc :lclose<CR>  "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

"每行最长字节个数的竖线
let &colorcolumn="100"
"highlight CursorLine cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLine cterm=NONE ctermbg=DarkGrey ctermfg=NONE guibg=NONE guifg=NONE

"自动化格式所有c/c++代码
au BufWrite *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx :Autoformat

"自动格式化go代码
let g:go_fmt_command = "goimports"

set mouse=
let g:golang_goroot = "/home/mysql/tools/tool_package/go"
autocmd FileType go compiler golang
let g:golang_onwrite = 0
let g:golang_inline_highlight = 0
let g:golang_cwindow = 0


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
