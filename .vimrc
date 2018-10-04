"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基础设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
packadd termdebug        " 开启Termbug调试
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
highlight CursorLine   cterm=NONE ctermbg=black guibg=NONE guifg=NONE
                         " 高亮显示当前行具体设置
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
                         " 设置状态行显示的信息
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   
                         " 允许光标出现在最后一个字符的后面
set mouse=a              " 开启鼠标支持
set backspace=indent,eol,start 
                         " 允许删除换行符
set wildmenu             " 开启zsh支持
set wildmode=full        " zsh补全菜单
set hidden               " 文件未保存时切换缓冲区由vim保存
set display=lastline     " 避免折行后某一行不见
set fillchars=vert:\ ,stl:\ ,stlnc:\   
                         " 在分割窗口间留出空白
set autochdir            " 移至当前文件所在目录

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "`"      " 定义<leader>键
nnoremap <leader><leader>i :PluginInstall<cr>
                         " 安装插件
nnoremap <leader><leader>u :PlugUpdate<cr>
                         " 更新插件
nnoremap <leader><leader>c :PlugClean<cr>
                         " 删除插件
nnoremap <c-h> <c-w>h  
nnoremap <c-l> <c-w>l  
nnoremap <c-j> <c-w>j  
nnoremap <c-k> <c-w>k
                         " 窗口切换 
inoremap <Up> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Down> <Nop>
                         " 使方向键无效(适应vim)
noremap j gj
noremap gj j
noremap gk k
noremap k gk
                         " 移动对应屏幕行




map <F12> :call Clss()<CR>
func! Clss()
    exec '!clear'
    endfunc              " F12一键清屏
map <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w" 
    exec '!g++ % -o %<'
    exec '!time ./%<'
    endfunc              " F9一键编译运行
map <F8> :call Term()<CR>
func! Term()
    exec 'terminal'
    endfunc              " F8调出终端
map <F11> :call GDB()<CR>
func! GDB()
    exec 'Termdebug %<'
    endfunc              " F11进行调试
map <F10> :NERDTreeToggle<CR>
                         " F10开启目录树nerdtree插件

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    
                         " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码
set history=2000         " 历史ex命令记录上限提高
set scrolloff=6          " 上下可视行数
set showmatch            " 高亮显示匹配括号
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
set nowrapscan          " 搜索到文件两端停止
set incsearch           " 实时搜索

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')

Plugin 'VundleVim/Vundle.vim'                    " 使用Vundle的必须配置
Plugin 'chxuan/vimplus-startify'                 " 启动界面
Plugin 'scrooloose/nerdtree'                     " 目录树
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " 目录树美化
Plugin 'vim-airline/vim-airline'                 " 状态栏美化
Plugin 'vim-airline/vim-airline-themes'          " 状态栏美化主题
Plugin 'tpope/vim-commentary'                    " 快速注释
Plugin 'scrooloose/syntastic'                    " 语法错误提示
Plugin 'Lokaltog/vim-easymotion'                 " 快速跳转
Plugin 'luochen1990/rainbow'                     " 彩虹括号
"Plugin 'Raimondi/delimitMate'                   " 括号补全
Plugin 'yianwillis/vimcdoc'                      " HELP文档中文
Plugin 'sjl/gundo.vim'                           " 撤销树
Plugin 'suan/vim-instant-markdown'               " markdown 实时预览

call vundle#end()            
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline 设置
if filereadable(expand($HOME . '/.vimrc.airline'))
    source $HOME/.vimrc.airline
endif

" prepare-code
let g:prepare_code_plugin_path = expand($HOME . "/.vim/plugged/prepare-code")

" ctags
set tags+=/usr/include/tags
set tags+=~/.vim/systags
set tags+=~/.vim/x86_64-linux-gnu-systags

" tagbar
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>
inoremap <silent> <leader>t <esc> :TagbarToggle<cr>

" echodoc.vim
let g:echodoc_enable_at_startup = 1

" rainbow
let g:rainbow_active = 1

" Gundo
nnoremap <F7> :GundoToggle<CR>

" Nerdtree设置
if filereadable(expand($HOME . '/.vimrc.nerdtree'))
    source $HOME/.vimrc.nerdtree
endif
