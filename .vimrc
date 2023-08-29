" General settings
set nocompatible          " 使用 Vim，而不是 Vi 的设置
filetype on               " 启用文件类型检测
filetype plugin on        " 启用文件类型插件
filetype indent on        " 启用文件类型缩进
set backspace=indent,eol,start  " 使得在所有情况下都可以退格和删除
set wrap                  " 自动换行
set linebreak             " 按照单词来换行
set showmatch             " 显示匹配的括号
set ignorecase            " 搜索时忽略大小写
set smartcase             " 如果有一个大写字母，则按大小写搜索
set incsearch             " 搜索时实时显示结果
set expandtab             " 使用空格替代制表符
set tabstop=4             " 一个制表符等于4个空格的宽度
set softtabstop=4         " 在编辑模式下按退格键时可以删除4个空格
set shiftwidth=4          " 换行的时候，新行的缩进增加的空格数
set autoindent            " 自动缩进
set smartindent           " 开启新的块区域时自动缩进

" UI settings
set number                " 显示行号
set cursorline            " 高亮当前行
set showcmd               " 在命令行的最后一行显示已输入的命令
set wildmenu              " 使用图形化的命令行补全
set laststatus=2          " 总是显示状态行
set ruler                 " 显示光标位置的行号和列号
syntax on                 " 开启语法高亮
colorscheme desert        " 使用 desert 颜色方案，你可以选择其他的颜色方案

" 键映射
nnoremap <C-h> <C-w>h     " 更容易地在窗口之间切换
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 插件部分可以使用 Vundle, vim-plug, dein.vim 或其他的插件管理器。
" 下面是使用 vim-plug 的示例：

" call plug#begin('~/.vim/plugged')
" Plug 'scrooloose/nerdtree'  " 一个侧边栏文件浏览器插件
" Plug 'tpope/vim-surround'   " 方便地添加、删除、更改文本的包围字符
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " 命令行模糊搜索
" call plug#end()

" 如果你安装了上述的插件，下面是一些额外的配置：

" NERDTree 设置
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" fzf 设置
" let g:fzf_layout = { 'up': '~40%' }
