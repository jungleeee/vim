# vim 常用插件配置

---
        Author      : Jungle
        Creat Time  : 2017/8/3
        Mail        : yjxxx168@qq.com
        Last Change :

---
###前言
        学习、总结，交流，进步！
        插件与脚本使得VIM强大，毋庸置疑！
全程参考:[所需及所获:像使用IDE一样使用vim](https://github.com/yangyangwithgnu/use_vim_ad_ide)
其余参考在文中将会在相关部分列出。
文中内容如有错误，请指正！
原创，转载请注明出处！

---
###Ready
VIM装请自行搞定。版本7.x + 。
请检查用户目录下是否存在: `.vim/`文件夹和`.vimrc`用户配置文件，可以使用命令 `ls -l ~` 查看。
`.vim/`文件夹用于存放后续所有插件。
`.vimrc`用于配置VIM功能，包括基本语法、插件配置以及部分脚本等。
如果没有请自行创建。

---
###基本配置
可以直接添加到`.vimrc`文件中
```
" General set
    " .vimrc 文件保存后自动生效
    autocmd! bufwritepost .vimrc source %   " linux
    "let g:mapleader=";"            " vim 前缀键设置，默认为: \
    set autowrite                   " auto save file
    set nobackup                    " 不产生临时文件
    set noswapfile                  " 不产生临时文件
    "set t_ti= t_te=                 " 退出VIM时，将当前屏幕内容显示到终端屏幕上

    " 不使用鼠标，方向键。实测插入模式中还是可以使用
    "set mouse-=a
    "map <Left>  <Nop>
    "map <Right> <Nop>
    "map <Up>    <Nop>
    "map <Down>  <Nop>

    " 普通模式时使用ctrl+h/j/k/l 实现多文件编辑时窗口切换
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l

    " 插入模式时使用ctrl+h/j/k/l 实现光标移动
    inoremap <C-j> <Down>
    inoremap <C-k> <Up>
    inoremap <C-h> <Left>
    inoremap <C-l> <Right>
```

---
###插件管理
[Vundle](https://github.com/VundleVim/Vundle.vim)是一个行之有效的插件，接管`.vim/`文件夹，为每一个插件指定唯一目录。更清晰、智能。
[Vundle](https://github.com/VundleVim/Vundle.vim)会接管`.vim/`文件夹下的所有目录，所以先清空。在通过命令安装Vundle:
```
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
然后在`.vimrc`中增加配置:
```
" vundle set
    filetype off
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'tomasr/molokai'
    "Pluglin 'vim-scripts/phd'
    "Plugin 'Lokaltog/vim-powerline'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'derekwyatt/vim-fswitch'
    Plugin 'majutsushi/tagbar'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'vim-scripts/indexer.tar.gz'
    Plugin 'vim-scripts/DfrankUtil'
    Plugin 'vim-scripts/vimprj'
    "Plugin 'mileszs/ack.vim'
    Plugin 'dyng/ctrlsf.vim'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'Yggdroot/LeaderF'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'ShowTrailingWhiteSpace'
    Plugin 'SirVer/ultisnips'
    "Plugin 'honza/vim-snippets'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'scrooloose/nerdtree'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'Tabular'                    " automatic alignment
    Plugin 'plasticboy/vim-markdown'    "
    Plugin 'iamcco/markdown-preview.vim'
    "Plugin 'iamcco/mathjax-support-for-mkdp'
    call vundle#end()

    filetype indent on              " different file smart indent
    filetype plugin on              " load the corrrsponding plug-in for different f
    filetype plugin indent on       " open antomatic completion
```
vundle管理的插件必须位于`call vundle#begin()` 和 `call vundle#end()`之间，其中每项
```
    Plugin 'VundleVim/Vundle.vim'
```
对应一个插件，后续如有新的插件，只需要追加到该列表中。安装新插件时需要在Github上找到插件地址，追加到列表中保
存`.vimrc`文件，然后进入到VIM命令模式，执行:
```
    PluginInstall
```
便可以通过vundle自动安装插件。

需要卸载插件时，需要在`.vimrc`文件中注释该插件或者删除，保存`.vimrc`文件后，在命令模式执行:
```
    PluginClean
```
即可删除该插件。关于插件更新，直接在命令模式下，执行
```
    PluginUpdate
```
即可更新整个插件列表。

关于插件: 多数插件在Github上都有不同的下载源，优先选取该插件的作者的下载源。

---
###UI Theme

界面优化，主题配置:
```
" Vim-UI set {
    " theme {很实用的两款:solarized、molokai
        set background=dark
        let g:solarized_termtrans=256
        colorscheme solarized
        "colorscheme molokai
        "set guifont =              " set default font
    " }
    " code fold {代码折叠的方式，method: manual, indent, expr, syntax, diff, marker
        "set foldenable             " 启动VIM时，折叠
        set nofoldenable            " 启动VIM时，不折叠
        set foldmethod=syntax       " 基于语法进行折叠
        "set foldmarker={,}
    " }
    "  search {搜索
        set incsearch               "
        set hlsearch                " 搜索结果高亮
        set ignorecase              " 忽略大小写
    "  }

    syntax enable                   " 语法高亮
    syntax on                       "

    set expandtab                   " 使用空格键代替TAB键
    set tabstop=4                   " TAB键的宽度
    set shiftwidth=4                " TAB键4个空格键
    "set softtabstop=4              " 把4个空格键自动识别为疑个TAB键

    set laststatus=2                " 总是显示状态栏
    set ruler                       " 打开状态标尺
    set number                      " 显示行号

    set nowrap                      "
    set autoindent                  " 自动缩进
    set cursorline                  " 高亮当前行
    "set cursorcolumn               " 高亮当前列
    set showmatch                   " highlighting the matching brack

    "set gcr=a:block-blinon0        " 禁止光标闪烁

    "set guioptions-=l              " ban on the scroll bar dispaly
    "set guioptions-=L
    "set guioptions-=r
    "set guioptions-=R

    "set guioptions-=m              " ban on the menu bar dispaly
    "set guioptions-=M
" }
```

######主题
通过前面插件列表下载了solarized、molokai两款主题，可以通过注释其中一款而是用另一款。在实际使用中molokai可以直接
使用，而主题solarized使用时，背景配色异常，最后通过以下方式正常使用（安装后能够正常使用的请忽略）。

`
    选取终端菜单栏中`Edit(编辑)`栏，最后一项`Profile Preference`，在弹出界面框中选中`color`项，如下图所示:
`

######代码折叠
文件代码量大时，可能会对分析代码产生干扰，或者通过折叠函数调用与定义之间的代码，可以更加直观的理解函数功能。
VIM自身支持多种折叠：手动折叠(manual)、基于缩进进行折叠(indent)、基于语义进行折叠(syntax)、未更改文本构成折叠等
等。其中indent、syntax较为适合编程。

`
    操作: za: 打开或关闭当前折叠；zM: 关闭多有折叠；zR: 打开多有折叠。
`

