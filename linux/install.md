# install vim8 and YCM (in no root user) 


1. 安装支持python3 python vim8

```
# no root user
1. 下载vim
官网：https://www.vim.org/
2. 解压
tar -jxvf vim-8.1.tar.bz2
3. execute
./configure -enable-pythoninterp=yes -enable-python3interp=yes --prefix /home/xyliu/PATH/vim8
mkdir -p /home/xyliu/PATH/vim8
make install && make

4. test
/home/xyliu/PATH/vim8/bin/vim --version

5. replace origin vim
    echo "alias vim='/home/xyliu/PATH/vim8/bin/vim' >> ~/.bashrc

```
<br>

配置YCM

```
cd ~/.vim/bundle
git clone git@github.com:ycm-core/YouCompleteMe.git
git submodule update --init --recursive

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

```

<br>
设置 .vimrc
```
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
```
