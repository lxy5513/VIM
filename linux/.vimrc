let mapleader = "\<Space>"
set nocompatible 
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe'
Plugin 'gmarik/Vundle.vim'
Plugin 'ervandew/supertab'
"""code folding
Plugin '907th/vim-auto-save'
Plugin 'guns/vim-clojure-highlight'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'Yggdroot/indentLine'
" Plugin 'suan/vim-instant-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'

call vundle#end()
filetype plugin indent on


" """""""""""""""" 一种快速的插件管理 """"""""""
call plug#begin('~/.vim/plugged')
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'skywind3000/asyncrun.vim'
" 参数补全"
Plug 'Shougo/echodoc'
" 语法检查for c++ 
Plug 'dense-analysis/ale'
call plug#end()


""" 语法检查"
" 始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_delay = 500
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡' 




""" 编译运行 Asyrun
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1 
" 定位到文件所属项目的目录 向上递归，直到找到名为 .git, .svn, .hg 或者 .root 文件或者目录，如果递归到根目录还没找到，那么文件所在目录就被当作项目目录
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']

nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" F4：使用 cmake 生成 Makefile
" F6：项目：测试 F5 : 单个文件的编译运行
" F7：项目：编译
" F8：项目：运行
" 设置 F10 打开/关闭 Quickfix 窗口


""" YCM
let g:ycm_use_clang = 0
" show autocomplete from c++ headers file in /usr/include
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
let g:ycm_show_diagnostics_ui = 0 "关闭语法检查器
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>



"######################### jedi ##############################
" autocmd FileType python setlocal completeopt-=preview
" let g:jedi#completions_command = "<C-n>"
autocmd FileType python setlocal completeopt-=preview
let g:jedi#rename_command = "<C-r>r"
let g:jedi#usages_command = '<Leader>u'
" get rid of hotkey K
let g:jedi#documentation_command = "<C-d>"
" get rid of hotkey S
let g:jedi#goto_stubs_command = '<C-s>'


""" F3打开目录树
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=30
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap <F3> :NERDTreeToggle<CR>

""" F9 打开tagbar 必须先安装ctags
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
nmap <F9> :TagbarToggle<CR> 

""" F5运行脚本
if exists("$VIRTUAL_ENV")
    autocmd FileType python map <buffer> <F5> :!$VIRTUAL_ENV'/bin/python' %:p<CR>
else
    autocmd FileType python map <buffer> <F5> :!python %:p<CR>
endif

autocmd Filetype c,cpp nnoremap <F5>  <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>

""" debug F5
autocmd Filetype c,cpp nnoremap <Leader><F5> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>


""" AirLine 
let g:airline_section_y = '%{strftime("%H:%M")}'
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1


""" NerdCommenter comment/uncomment multiple lines <leader>cc / cu
" <leader>cy 先复制，再注释
let g:NERDSpaceDelims=1




""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""
" 取消备份
set nobackup
set noswapfile
set noundofile
" 解决consle输出乱码
language messages zh_CN.utf-8
" 状态栏配置
set laststatus=2
" 开启语法检测
syntax on
" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %
" 文件修改之后自动载入
set autoread
" yy直接复制到系统剪切板（For macvim）
set clipboard=unnamed
" 高亮搜索命中的文本
set hlsearch
" 随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 在状态栏显示正在输入的命令
set showcmd
" 显示括号配对情况
set showmatch
set matchtime=5
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
" 填充Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
" set t_ti= t_te=

" 打开文件时始终跳转到上次光标所在位置
autocmd bufreadpost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" 自动保存·
let g:auto_save = 1  " enable AutoSave on Vim startup
autocmd TextChanged,TextChangedI <buffer> silent write

"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""

" 映射切换tab的键位
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" # copy to system clipboard
vnoremap Y "+y

" 给当前单词添加引号
nnoremap w" viw<esc>a"<esc>hbi"<esc>lel
nnoremap w' viw<esc>a'<esc>hbi'<esc>lel

" 在Normal Mode和Visual/Select Mode下，利用Tab键和Shift-Tab键来缩进文本
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv


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

nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>

" 返回 反向返回
nnoremap { <C-o>
nnoremap } <C-i>

" close buffer
nnoremap <leader>c :bd<CR>

"" 快捷跳转到行首、行尾 （编辑）
nnoremap <Leader>l $
nnoremap <Leader>h ^
nnoremap <Leader>k A
nnoremap <Leader>j I

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

nnoremap <Leader>g G
nnoremap qq :wq<CR>


" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    " 先要执行:arg *.cpp, 可用 :arg 查看当前arg列表
    " 如果要在所有Buffer中搜索，则用:bufdo %s/pattern/replace/ge
    " 如果要在所有Windows中搜索，则用:windo :windo %s/pattern/replace/ge
    " 添加当前文件到arglist, 不使用argadd, 因其不检查重复项
    silent! execute 'argedit %'
    " if using confirm mode, remember to press y/n when word is highlight
    silent! execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction


" 不确认(替换全部)、非整词
nnoremap <leader>r :call Replace(0, 0, input('replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <leader>wr :call Replace(0, 1, input('replace '.expand('<cword>').' with: '))<CR>
" 确认(每次单独确认)、非整词
nnoremap <leader>rc :call Replace(1, 0, input('replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <leader>wrc :call Replace(1, 1, input('replace '.expand('<cword>').' with: '))<CR>


" 自动补全变量名 直接按return键
inoremap <expr> <CR> getline('.')[col('.') - 2] =~ '\a' ? "\<C-P>" : "\<CR>"


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

" 代码折叠自定义快捷键 <leader>zz 折叠所有函数或者类 嵌套
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

nnoremap K :bnext<CR>
nnoremap J :bprev<CR>

nnoremap oo o<esc>
nnoremap oi o

" 查找
nnoremap <Leader>s /<C-R>=expand("<cword>")<CR><Esc>
nnoremap <Leader>nh :nohl<CR>

" 括号补全
function! AutoPair(open, close)
        let line = getline('.')
        if col('.') > strlen(line) || line[col('.') - 1] == ' '
                return a:open.a:close."\<ESC>i"
        else
                return a:open
        endif
endf

function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf

function! SamePair(char)
        let line = getline('.')
        if col('.') > strlen(line) || line[col('.') - 1] == ' '
                return a:char.a:char."\<ESC>i"
        elseif line[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf

inoremap ( <c-r>=AutoPair('(', ')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=AutoPair('{', '}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=AutoPair('[', ']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " <c-r>=SamePair('"')<CR>
inoremap ' <c-r>=SamePair("'")<CR>
inoremap ` <c-r>=SamePair('`')<CR>

