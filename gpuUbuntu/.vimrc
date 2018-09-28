set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
""""""""""""""""""""""VUNDLE PLUGIN""""""""""""""""""""

" 不兼容vi
set nocompatible

" 搜索到文件两端时不重新搜索
set nowrapscan

" 系统和vim剪切板公用
set clipboard=unnamed

" 不检测文件类型
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

"auto-completion stuff
""Plugin 'klen/python-mode'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
"""code folding
Plugin 'tmhedberg/SimpylFold'


Plugin 'kabbamine/vcoolor.vim'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/emmet-vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'walm/jshint.vim'
Plugin 'moll/vim-node'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
if has('python')
"    Plugin 'davidhalter/jedi-vim'
    Plugin 'axiaoxin/vim-json-line-format'
    Plugin 'SirVer/ultisnips'
endif
Plugin 'axiaoxin/favorite-vim-colorscheme'
Plugin 'junegunn/vim-emoji'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

call vundle#end()

" 针对不同的文件类型采用不同的缩进格式
filetype plugin indent on

" 自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默认tab s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处




" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""

" 取消备份
set nobackup
set noswapfile
set noundofile

" 解决consle输出乱码
language messages zh_CN.utf-8

" 状态栏配置
set laststatus=2

" 打开语法高亮
syntax enable

" 开启语法检测
syntax on

" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %

" 文件修改之后自动载入
set autoread

" yy直接复制到系统剪切板（For macvim）
"set clipboard=unnamed

" 高亮搜索命中的文本
set hlsearch

" 随着键入即时搜索
set incsearch

" 搜索时忽略大小写
set ignorecase

" 有一个或以上大写字母时仍大小写敏感
set smartcase

set guifont=Menlo:h14

"colorscheme Tomorrow-Night-Bright
" 使用自带配色
"colorscheme elflord
"set background=dark

" 在状态栏显示正在输入的命令
set showcmd

" 显示括号配对情况
set showmatch

" :next, :make 命令之前自动保存
set autowrite

" 允许使用鼠标
set mouse=a

" 设置行号
set nu

" 退格键可用
set backspace=2

" 退格键一次删掉4个空格
set smarttab

" 缩进
set autoindent
set smartindent

" 保存文件时自动删除行尾空格或Tab
autocmd BufWritePre * :%s/\s\+$//e

" 保存文件时自动删除末尾空行
autocmd BufWritePre * :%s/^$\n\+\%$//ge

" 填充Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" 代码折叠 光标在缩进下方时用za命令折叠或展开
set fdm=indent
" 默认展开
set foldlevel=99

" 突出显示当前行，列
"set cursorline
"set cursorcolumn

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
set t_ti= t_te=

" 打开文件时始终跳转到上次光标所在位置
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif



"""""""""""YouCompleteMe""""""""""""""""


let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
let g:ycm_key_list_previous_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1

"
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=0





"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" 映射切换tab的键位
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" normal模式下Ctrl+c全选并复制到系统剪贴板(linux必须装有vim-gnome)
nmap <C-c> gg"+yG

" visual模式下Ctrl+c复制选中内容到剪贴板
vmap <C-c> "+y

" Ctrl+v原样粘贴剪切板内容
inoremap <C-v> <ESC>"+pa

" w!!写入只读文件
cmap w!! w !sudo tee >/dev/null %

" F2切换行号显示
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" F3打开目录树
nmap <silent> <F3> :NERDTreeToggle<CR>

" F4显示TagList
nmap <silent> <F4> :TagbarToggle<CR>

" F5运行脚本
if exists("$VIRTUAL_ENV")
    autocmd FileType python map <buffer> <F5> :!$VIRTUAL_ENV'/bin/python' %:p<CR>
else
    autocmd FileType python map <buffer> <F5> :!python %:p<CR>
endif

" <F6> 新建标签页
map <F6> <Esc>:tabnew<CR>

" <F7> 拷贝粘贴代码不破坏缩进
set pastetoggle=<F7>

if has("win64") || has("win32")
    " <F8> sort import and auto pep8
    autocmd FileType python map <buffer> <F8> :!autopep8 -i -a --ignore=W690,E501 %:p<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :!yapf -i %:p --style=pep8<CR><CR>
else
    " <F8> sort import and auto pep8
    autocmd FileType python map <buffer> <F8> :!autopep8 -i -a --ignore=W690,E501 %:p;isort %:p;<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :!yapf -i %:p --style=pep8;isort %:p;<CR><CR>
endif

" 给当前单词添加引号
nnoremap w" viw<esc>a"<esc>hbi"<esc>lel
nnoremap w' viw<esc>a'<esc>hbi'<esc>lel

" 在Normal Mode和Visual/Select Mode下，利用Tab键和Shift-Tab键来缩进文本
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" 左右分割窗口Ctrl+w +v
" 上下分割窗口Ctrl+w +s
" 关闭窗口Ctrl+w  +q

" quicker window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quicker window resize
nnoremap <C-Enter> <C-w>=
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" emoji
imap <C-e> <C-X><C-U>


""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'



" NerdCommenter
let g:NERDSpaceDelims=1

" NERDTREE
" 不显示的文件
let NERDTreeIgnore=['\.pyc$', '\~$']
" show nerdtree when starts up
"autocmd vimenter * NERDTree
" 退出最后一个buff时也退出nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_cmd = 'CtrlPMixed'

"Ctrl-X Ctrl-U emoji补全
set completefunc=emoji#complete

" instant-markdown
let g:instant_markdown_slow = 1

" airline
let g:airline_section_y = '%{strftime("%H:%M")}'
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1

" jedi
"autocmd FileType python setlocal completeopt-=preview
"let g:jedi#completions_command = "<C-n>"

""""""""""jedi-vim第三方库的补全"""""""""
Bundle 'davidhalter/jedi-vim'




" flake8
"let g:flake8_show_in_file = 1
"let g:flake8_show_in_gutter = 1
"autocmd! BufRead,BufWritePost *.py call Flake8()

" gitgutter
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" jshint
autocmd! BufRead,BufWritePost *.js :JSHint

" vim-table-mode: markdown
let g:table_mode_corner="|"

" rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" vim-clojure-static
let g:clojure_syntax_keywords = {
    \ 'clojureMacro': ["defproject", "defcustom"],
    \ 'clojureFunc': ["string/join", "string/replace"]
    \ }

" vim-clojure-highlight
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" vCoolor.vim
let g:vcoolor_map = '<leader>cp'
let g:vcool_ins_rgb_map = '<leader>cpr'       " Insert rgb color.
let g:vcool_ins_hsl_map = '<leader>cph'       " Insert hsl color.
let g:vcool_ins_rgba_map = '<leader>cpra'      " Insert rgba color.





"python-mode
""开启警告
let g:pymode_warnings = 0
"保存文件时自动删除无用空格
"let g:pymode_trim_whitespaces = 1
"let g:pymode_options = 1
""显示允许的最大长度的列
let g:pymode_options_colorcolumn = 1
"设置QuickFix窗口的最大，最小高度
"let g:pymode_quickfix_minheight = 3
"let g:pymode_quickfix_maxheight = 10
""使用python3
let g:pymode_python = 'python3'
"使用PEP8风格的缩进
"let g:pymode_indent = 1
""取消代码折叠
let g:pymode_folding = 0
"开启python-mode定义的移动方式
"let g:pymode_motion = 1
""启用python-mode内置的python文档，使用K进行查找
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
"自动检测并启用virtualenv
let g:pymode_virtualenv = 1
""不使用python-mode运行python代码
"let g:pymode_run = 0
"let g:pymode_run_bind = '<Leader>r'
""不使用python-mode设置断点
let g:pymode_breakpoint = 0
"let g:pymode_breakpoint_bind = '<leader>b'
""启用python语法检查
let g:pymode_lint = 1
"修改后保存时进行检查
let g:pymode_lint_on_write = 0
""编辑时进行检查
let g:pymode_lint_on_fly = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"发现错误时不自动打开QuickFix窗口
"let g:pymode_lint_cwindow = 0
""侧边栏不显示python-mode相关的标志
let g:pymode_lint_signs = 0
"let g:pymode_lint_todo_symbol = 'WW'
""let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
""let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
""let g:pymode_lint_pyflakes_symbol = 'FF'
"启用重构
"let g:pymode_rope = 1
""不在父目录下查找.ropeproject，能提升响应速度
let g:pymode_rope_lookup_project = 0
"光标下单词查阅文档
"let g:pymode_rope_show_doc_bind = '<C-c>d'
""项目修改后重新生成缓存
let g:pymode_rope_regenerate_on_write = 1
"开启补全，并设置<C-Tab>为默认快捷键
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_completion_bind = '<C-Tab>'
""<C-c>g跳转到定义处，同时新建竖直窗口打开
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
"重命名光标下的函数，方法，变量及类名
"let g:pymode_rope_rename_bind = '<C-c>rr'
""重命名光标下的模块或包
let g:pymode_rope_rename_module_bind = '<C-c>r1r'
"开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
""高亮缩进错误
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
"
"
" ----------------------------------------------------------------------------------  MAC 设置迁移过来的

" # 设置光标的形状
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


let mapleader = "\<Space>"
"---------------------将最常用的操作映射到 Leader 操作
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
" nnoremap <Leader>w :w<CR>


nnoremap <Leader>[ <C-o>
nnoremap <Leader>] <C-]>

" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>z :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun


" -----------------------------------------------------------set <F?> key
" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set pastetoggle=<F7>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
"去空行
nnoremap <F9> :g/^\s*$/d<CR>


map <F2> :tabnew<CR>
"列出当前目录文件
map <F3> :tabnew .<CR>
"打开树状文件目录


" normal 切换buffer窗口
noremap <leader>1 :b 1<CR>
noremap <leader>2 :b 2<CR>
noremap <leader>3 :b 3<CR>
noremap <leader>4 :b 4<CR>
noremap <leader>5 :b 5<CR>
noremap <leader>6 :b 6<CR>
noremap <leader>7 :b 7<CR>
noremap <leader>8 :b 8<CR>
noremap <leader>9 :b 9<CR>
" move among buffers with CTRL Buffer 窗口
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>


"" 快捷跳转到行首、行尾 （编辑）
nnoremap <Leader>l $
nnoremap <Leader>h ^
nnoremap <Leader>k A
nnoremap <Leader>j I

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" 在正常模式下的快速注释-----仅适合python
au FileType python nnoremap <Leader>/ I#<Esc>

nnoremap <Leader>k <C-u>
nnoremap <Leader>j <C-d>

nnoremap <Leader>g G

" 替换和查找 都是全局行为
nnoremap <Leader>s /<C-R>=expand("<cword>")<CR><Esc>
nnoremap <Leader>r :%s/\<<C-R>=expand("<cword>")<CR>\>/

" 自动补全变量名 直接按return键
inoremap <expr> <CR> getline('.')[col('.') - 2] =~ '\a' ? "\<C-P>" : "\<CR>"


" 分屏窗口移动, Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
nnoremap <Leader>w <C-W><C-W>

" 代码折叠
set foldenable
set foldmethod=indent
set foldnestmax=2
set nofoldenable
set foldlevel=1
" 代码折叠自定义快捷键 <leader>za 折叠所有函数或者类 非嵌套
let g:FoldMethod = 0
map <leader>z :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
	" 嵌套的为zM
        exe "normal! zm"
        let g:FoldMethod = 1
    else
        exe "normal! zr"
        let g:FoldMethod = 0
    endif
endfunction

" 代码折叠自定义快捷键 <leader>za 折叠所有函数或者类 嵌套
let g:FoldMethodA = 0
nnoremap za :call ToggleFoldA()<cr>
fun! ToggleFoldA()
    if g:FoldMethodA == 0
	" 嵌套的为zM
        exe "normal! zM"
        let g:FoldMethodA = 1
    else
        exe "normal! zR"
        let g:FoldMethodA = 0
    endif
endfunction

" # 折叠/打开当前函数
nnoremap zz za


" 自动保存·
let g:auto_save = 1  " enable AutoSave on Vim startup
autocmd TextChanged,TextChangedI <buffer> silent write

