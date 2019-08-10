1. download ctags-5.8.tar.gz 


2. decompose   
    tar zxvf ctags-5.8.tar.gz 

3. cd ctags-5.8.tar.gz   
   ./configure --prefix="/home/xyliu/PATH/ctags-5.8"   
   make && make install   

4. cd /home/xyliu/PATH/ctags-5.8/bin 
   ./ctags -R --c++-kinds=+px --filds=+iaS --extra=+q    
   echo "alias ctags='/home/xyliu/PATH/ctags-5.8/bin/ctags'" >> ~/.aliases    

5. in ~/.vimrc 
    ```
    let g:tagbar_ctags_bin="/home/xyliu/PATH/ctags-5.8/bin/ctags"  
    nmap <F9> :TagbarToggle<CR>   
    ```
