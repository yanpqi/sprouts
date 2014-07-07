#!/bin/bash

# This is a Vim config use vundle.
# vundle is a plugin manager plugin. when installed, all you need is add the plugin
# name in the cfg file and source the .bashrc then excute :BundleInstall in vim.
# The plugin name added in config file must exsist at
# http://vim-scripts.org/vim/scripts.html
# as for github repos, add the whole url path of git as you use git clone.

# vundle commands are below:
# :BundleInstall install the plugins in the .cfg file.
# :BundleSearch  search a plugin.
# :BundleClean   remove the plugins not in the .cfg file.


mkdir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "# bundle is a plugin for vim to manage the plugins." > ~/.bashrc
echo "Tagbar" >> vundle.cfg
echo "Conque-Shell" >> vundle.cfg
echo "source $basename/vundle.cfg" > ~/.bashrc
wget http://downloads.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz
tar -xzf ctags-5.8.tar.gz && cd ctags-5.8
./configure && make && sudo make install && make clean
find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.java" -o -name "*.py" > src.files
ctags -R --c++-kinds=+px --fields=+iaS --extra=+q -L src.files
project_root=`pwd`
echo "au BufEnter $project_root/* setlocal tags+=$project_root/tags" > ~/.vimrc

wget http://downloads.sourceforge.net/project/cscope/cscope/15.8a/cscope-15.8a.tar.gz
cd cscope-15.8a/
./configure && make && make install  #ncurse lib needed.

function Do_CsTag()
    if(executable("cscope") && has("cscope") )
        if(has('win32'))
            silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        else
            silent! execute "!find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" -o -name "*.java" -o -name "*.py" > cscope.files"
        endif
        silent! execute "!cscope -b"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endf

# vim tagbar.vba 
#    :so % 
#    :q 
# nmap <F8> :TagbarToggle<CR>   map for tagbar

# vi conque_term.vba 
# :so % 
# :q 
# Type :ConqueTerm <command> to run your command in vim
# To open ConqueTerm in a new horizontal or vertical buffer use: 

# :ConqueTermSplit <command> 
# :ConqueTermVSplit <command> 
# :ConqueTermTab <command> 

# All text typed in insert mode will be sent to your shell. Use the <F9> key to send a visual selection from any buffer to the shell. 

# For more help type :help ConqueTerm 

# auto insert include
# function InsertIncludeFileI()
#     let sourcefilename=expand(“%:t”)
#     let outfilename=substitute(sourcefilename,‘\(\.[^.]*\)$’,‘.h’,‘g’)
#     call setline(‘.’,‘#include “‘.outfilename.‘”‘)
# endfunction
# imap <c-b><c-h> <ESC>:call InsertIncludeFileI()<CR>
# function InsertIncludeFileN()
#     let sourcefilename=expand(“%:t”)
#     let outfilename=substitute(sourcefilename,‘\(\.[^.]*\)$’,‘.h’,‘g’)
#     call setline(‘.’,‘#include “‘.outfilename.‘”‘)
# endfunction
# nmap ,hh :call InsertIncludeFileN()<CR>
vim_config=~/.vimrc
# set tab to 4 spaces.
echo "set ts=4\nset expandtab\nset autoindent" >> vim_config

