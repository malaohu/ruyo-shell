set nu  
set ai
set nocompatible
" tab相关变更
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set mouse=v

" golang语法高亮
" 需要安装
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://gitee.com/astonishing_the_world/vim-plug/raw/master/plug.vim (国内)
" git clone https://github.com/fatih/vim-go.git --branch v1.20 ~/.vim/plugged/vim-go 
" git clone https://gitee.com/shtml/vim-go.git --branch v1.20 ~/.vim/plugged/vim-go (国内)


" 将下面注释开启
" call plug#begin()
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" call plug#end()
" let g:go_version_warning = 0
" let g:go_fmt_autosave = 0


syntax on
