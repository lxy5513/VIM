set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
"Plugin 'klen/python-mode'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin '907th/vim-auto-save'
" Plugin 'Valloric/YouCompleteMe'
"-------------------=== Code/Project navigation ===-------------
Plugin 'scrooloose/nerdtree'                " Project and file navigation
Plugin 'majutsushi/tagbar'                  " Class/module browser
Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files

call vundle#end()

"设置静音模式
set noerrorbells
set novisualbell
set visualbell t_vb=

" 自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口

:set mouse=a

let g:auto_save = 1  " enable AutoSave on Vim startup

" " 批量注释
" " 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1
" <leader>c<space>  加上/解开注释, 智能判断
" <leader>cc -----add comment
" [count]<leader>cn    comment next [count] lines
" <leader>cc   紧贴代码加注释
" <leader>cb   是在代码的最前端加注释
" <leader>cu   解开注释


"vim-airline 这个安装字体后 必须设置此项 显示底端行颜色位置信息"
let g:airline_powerline_fonts = 1
let g:airline_section_y = '%{strftime("%H:%M")}'
let g:airline_left_sep = ''

" 关闭状态显示空白符号计数,这个对我用处不大 配置最下方的颜色 显示"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" 必须 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin indent on
syntax on

set term=xterm-256color "color
set number "显示行号
set cursorline "突出显示当前行
"粘贴时保持格式
"set paste
"
"配置颜色
set t_Co=256
colorscheme molokai
" colorscheme desert
" colorscheme solarized

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch

set fileencoding=utf8
"fix 使用delete键没有反应 problem
set backspace=2

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc


"一旦一行的字符超出80个的话就把那些字符的背景设为红色
"highlight OverLength ctermbg=black ctermfg=white guibg=#592929 
"match OverLength /\%81v.\+/

" help text in chineses"
set helplang=cn

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" --------------------------专门的jedi配置
"展示函数或者模块的定义
"Function: `jedi#show_documentation()`
"Default: <K>     Show pydoc documentation
" don't want the docstring window to popup during completion 
" 光标放在glob.glob（）上并点击<leader>d，jedi-vim将我带入/ usr/lib/python /中glob（）的定义。
autocmd FileType python setlocal completeopt-=preview


let mapleader = "\<Space>"
"---------------------将最常用的操作映射到 Leader 操作
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>[ <C-o>
nnoremap <Leader>] <C-]>

" nmap <Leader>c <Leader>cc
" nmap [count]<Leader>c [count]<leader>cn  

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



"按F5运行python"
if exists("$VIRTUAL_ENV")
    autocmd FileType python map <buffer> <F5> :!$VIRTUAL_ENV'/bin/python' %:p<CR>
else
    autocmd FileType python map <buffer> <F5> :!python3 %:p<CR>
endif


" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"" 快捷跳转到行首、行尾 （编辑）
nnoremap <Leader>l $
nnoremap <Leader>h ^
" nnoremap <Leader>k A
" nnoremap <Leader>j I

" 翻半页 
nnoremap <Leader>k <C-u>
nnoremap <Leader>j <C-d>

nnoremap <Leader>g G

" 替换和查找 都是全局行为
nnoremap <Leader>s /<C-R>=expand("<cword>")<CR><Esc>
nnoremap <Leader>r :%s/\<<C-R>=expand("<cword>")<CR>\>/


" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>sp :sp 

" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :

" 自动补全变量名 直接按return键 
inoremap <expr> <CR> getline('.')[col('.') - 2] =~ '\a' ? "\<C-P>" : "\<CR>"


" 在正常模式下的快速注释-----仅适合python
au FileType python nnoremap <Leader>/ I#<Esc>

"共享剪贴板
set clipboard+=unnamed
nnoremap <CR> G

" 插入匹配括号
" inoremap ( ()<LEFT>
" inoremap [ []<LEFT>
" inoremap { {}<LEFT>

" " 输入一个字符时，如果下一个字符也是括号，则删除它，避免出现重复字符
" function! RemoveNextDoubleChar(char)
	" let l:line = getline(".")
	" let l:next_char = l:line[col(".")] " 取得当前光标后一个字符

	" if a:char == l:next_char
		" execute "normal! l"
	" else
		" execute "normal! i" . a:char . ""
	" end
" endfunction
" inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
" inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
" inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a


			
" 出现错误，但是沉默，不提示。
if has('python3')
  silent! python3 1
endif


"" 打开跳转到上次的位置 
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" 给当前单词添加引号
nnoremap w" viw<esc>a"<esc>hbi"<esc>lel
nnoremap w' viw<esc>a'<esc>hbi'<esc>lel

" 在Normal Mode和Visual/Select Mode下，利用Tab键和Shift-Tab键来缩进文本
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" quicker window resize  
nmap <Leader><Left> <C-W>>
nmap <Leader><Right> <C-W><
nmap <Leader><Enter> <C-W>=
nmap <Leader><Up> <C-W>+
nmap <Leader><Down> <C-W>-

" 移动 切换窗口
nnoremap <Leader>w <C-W><C-W>

set ruler
"-----------------------------------------------------------------注释--------
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
" setlocal buftype=   
"
" 对于map而言，可能有这么几种前缀：
"nore
"表示非递归。
"递归的映射。其实很好理解，也就是如果键a被映射成了b，c又被映射成了a，如果映射是递归的，那么c就被映射成了b。
"n
"表示在普通模式下生效
"v
"表示在可视模式下生效
"i
"表示在插入模式下生效
"c
"表示在命令行模式下生效
"
"未完成：
"	快速替换
"       代替缩进
"9. 查找和替换文本"
"============="
""nmap ;s :%s/\<<C-R>=expand("<cword>")<CR>\>/
