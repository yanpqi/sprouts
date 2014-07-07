" 环境配置
set nocompatible " 关闭 vi 兼容模式
if has("multi_byte")
" UTF-8 编码
set formatoptions+=mM
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
endif

"外观类设定
syntax enable
syntax on "打开语法高亮
set t_Co=256
set background=dark
set guifont=Courier_New:h18:cANSI   " 设置字体
colorscheme codeburn " 设定配色方案
set number " 显示行号
set cursorline " 突出显示当前行
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set ruler " 打开状态栏标尺
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
let cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" 设置在状态行显示的信息
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为
"set foldclose=all " 设置为自动关闭折叠 
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 用空格键来开关折叠
"编辑功能类设定
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行 
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
"操作功能类设定
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set tags=/home/foxfs/projects/sogouchromium/tags


"============================================================
"                    ctags setting
"===========================================================
set autochdir "自动更改目录
set tags=tags; "自动加载tags文件，注意不要省略;

"============================================================
"                    ctag/cscope autoload setting
"===========================================================
map <f12> <esc>:call Go_top()<cr>:call Gen_Tag()<cr><cr>:call Go_curr()<cr><cr>:call LoadCscope()<cr>
imap <f12> <esc>:call Go_top()<cr>:call Gen_Tag()<cr><cr>:call Go_curr()<cr><cr>:call LoadCscope()<cr>

func! Go_top()
   let i = 1
   let g:Curr_dir = getcwd()
   while i<10
       if filereadable("TOP")
	       return
	   else
		   cd ..
		   let i+=1
	   endif
   endwhile
endfunc

func! Go_curr()
    exec 'cd '.g:Curr_dir
endfunc

func! Gen_Tag()
    silent! exec "!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q $PWD"
    silent! exec "!cscope reset"
    silent! exec "!find . -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp'
    \ -o -name 'Makefile' -o -name 'makefile' -o -name 'make*'
    \ -o -name '*.cc' -o -name '*.C'-o -name '*.s'-o -name '*.S'>cscope.files"
    silent! exec "!cscope -Rbkq -i cscope.files"
endfunc

function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
		if (empty(path))
			let path = getcwd()
		endif
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction

au BufEnter /* call LoadCscope()

"============================================================
"                    tagbar setting
"===========================================================
"使用F8来打开和关闭tagbar
nmap <F8> :TagbarToggle<CR> 
"============================================================
"                    nerdtree setting
"===========================================================
nmap <F5> :NERDTree<CR>
"============================================================
"                    cscope setting
"===========================================================
"ff映射到ctrl+]
nmap ff <c-]> 
"ss映射到ctrl+t
nmap ss <c-t> 
"c:查找光标下的函数被调用的地方
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
"i: 查找当前文件名出现过的地方
nmap fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
"g:查找函数、宏、枚举等定义的位置
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>

"============================================================
"                    fuzzyfind setting
"===========================================================
map <C-S-R> :FufFileRecursive<CR>
"============================================================
"                    youdao-translate setting
"===========================================================
nmap tr :ydc<CR>


function Searchwordzx()
let findstring = inputdialog("Search string: ",expand("<cword>"))
if findstring != ""
    execute "vimgrep " findstring "*"
    endif
endfunction
map <f2> :call Searchwordzx()<CR>

"============================================================
"                    SrcExpl setting
"===========================================================
" // The switch of the Source Explorer 
nmap <F4> :SrcExplToggle<CR> 
" // Set the height of Source Explorer window 
let g:SrcExpl_winHeight = 8 
" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 
" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 
" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [ 
\ "__Tag_List__", 
\ "_NERD_tree_" 
\ ] 
" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 
" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" // create/update the tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>" 
" // Set "<F3>" key for displaying the previous definition in the jump list 
"let g:SrcExpl_prevDefKey = "<F3>" 
" // Set "<F4>" key for displaying the next definition in the jump list 
"let g:SrcExpl_nextDefKey = "<F4>" 
