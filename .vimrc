" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" General set {
    " the vimrc file is automatically loaded after modification
    "autocmd! bufwritepost _vimrc source %   " windows
    autocmd! bufwritepost .vimrc source %   " linux
    "let g:mapleader=";"
    set autowrite                   " auto save file
    set nobackup                    " never backup
    set noswapfile                  " close switch file
    "set t_ti= t_te=                 " exit Vim, the context is dispaly in the terminal

    " set mandatory keyboard use
    set mouse-=a
    map <Left> <Nop>
    map <Right> <Nop>
    map <Up> <Nop>
    map <Down> <Nop>

    " smart way to monv between windows
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l

    inoremap <C-j> <Down>
    inoremap <C-k> <Up>
    inoremap <C-h> <Left>
    inoremap <C-l> <Right>
" }

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well

" Vim-UI set {
    " theme {
        set background=dark
        let g:solarized_termtrans=256
        colorscheme solarized
        "colorscheme molokai
        "set guifont =              " set default font
    " }
    " code fold {method: manual, indent, expr, syntax, diff, marker
        "set foldenable
        set nofoldenable            " close code folding when VIM startup
        set foldmethod=syntax       " based on the syntax folding indentation
        set foldmarker={,}
    " }
    "  search {
        set incsearch               " follow search
        set hlsearch                " highlighting search
        set ignorecase              " ingore case
    "  }

    syntax enable                   " sybtax highlighting
    syntax on                       " syntax highlighting

    set expandtab	                " TAB extension for space
    set tabstop=4	                " set the edit TAB takes up space
    set shiftwidth=4                " set the format TAB takes up space
    "set softtabstop=4              " the continue spaces as a TAB character

    set laststatus=2                " alaways shows status bar
    set ruler                       " show the current line info in the lower right corner
    set number                      " open ling number

    set nowrap                      " no folding current row
    set autoindent                  " the current line format is applied to the next line
    set cursorline                  " highlighting current line
    "set cursorcolumn               " highlighting current column
    set showmatch                   " highlighting the matching brackets

    "set gcr=a:block-blinon0        " ban cursor blink

    "set guioptions-=l              " ban on the scroll bar dispaly
    "set guioptions-=L
    "set guioptions-=r
    "set guioptions-=R

    "set guioptions-=m              " ban on the menu bar dispaly
    "set guioptions-=M
" }

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden	    	" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

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
Plugin 'Tabular'                " automatic alignment
call vundle#end()

filetype indent on              " different file smart indent
filetype plugin on              " load the corrrsponding plug-in for different file types
filetype plugin indent on       " open antomatic completion

" set powerline theme style
"let g:Powerline_colorscheme='solarized256'

" set airling theme stylr
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
set laststatus=2

" set indent guides
let g:indent_guides_enable_on_vim_startup=1	" follow VIM startup
let g:indent_guides_start_level=2	    	" starting from the second visual diapaly the indentation
let g:indent_guides_guide_sizw=1	    	" color piece width
":nmap <silent> <leader>i <Plug>IndentGuidesToggle

" *.c** & *.h, fast switch
nmap <M-t> :FSHere<CR>      " switch *.cpp & *.h

" set Ctags
"set tags=./tags,./*/tags
"map <F7>: !ctags -R <CR><CR>

" set tagbar
map <F8> :TagbarToggle<CR>  " ON/OFF tagbar
let tagbar_left=1           " set the position of the tagbar
let tagbar_width=32         " set the width of the child window tags
let g:tagbar_compact=1      " the window tags not show help info
let g:tagbar_sort=0         "
let g:tagbar_type_cpp = {
        \'kinds' : [
            \ 'c:classes:0:0',
            \ 'd:macros:0:0',
            \ 'e:enumerators:0:0',
            \ 'f:functions:0:0',
            \ 'g:enumeration:0:0',
            \ 'l:local:0:0',
            \ 'm:members:0:0',
            \ 'n:namespaces:0:0',
            \ 'p:functions_prototypes:0:0',
            \ 's:structs:0:0',
            \ 't:typedefs:0:0',
            \ 'u:unions:0:0',
            \ 'v:global:0:0',
            \ 'x:wxternal:0:0'
        \ ],
        \ 'sro'        : '::',
        \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespaces',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
        \ },
        \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
        \ }
    \ }
" let g:tagbar_type_markdown = {
        " \ 'ctagstype' : 'markdown',
        " \ 'sort'      : 0,
        " \ 'kinds'     : [
            " \ 'h:sections'
        " \ ]
    " \ }

" set easymotion
let g:EasyMotion_leader_key='f'

" set indexer
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+c+d+e+f+l+m+n+p+s+t+u+v+x --fields=+iaSl --extra=+q"

" set ctrlsf
let g:ctrlsf_ackprg='ack'              " set default
nnoremap <M-f> :CtrlSF<CR>             " search/find words

" set multiple-sursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_prev_key='<S-p>'
let g:multi_cursor_skip_key='<S-s>'
let g:multi_cursor_quit_key='<ESC>'

" set LeaderF
map <M-s> :Leaderf

" set nerdcommenter
map <M-c> <Leader>cc                   " add comment
map <M-u> <Leader>cu                   " cancel comment
map <M-a> <Leader>ca                   " switch /*  */ & //
let g:NERDSpaceDelims=1                " add Spaceson both sides

" set ShowTrailingWhitespace
let g:ShoeTrailingWhitespace=1         " default ON; 1 on, 0 off
highlight ShowTrailingWhitespace ctermbg=Red guibg=Red

" set ultisnips
"let g:UltiSnipsSnippetDir="~/.vim/bundle/ultisnips"
"let g:UltiSnipsSnippetDirectories=['~/.vim/bundle/ultisnips/UltiSnips']
"let g:UltiSnipsExpandTrigger="<M-f>"
"let g:UltiSnipsJumpForwardTrigger="<M-n>"
"let g:UltiSnipsJumpBackwardTrigger="<M-m>"

" set YouComplete
set runtimepath+=~/.vim/bundle/YouCompleteMe
" ignore some files
let g:ycm_filetype_blacklist = {
    \ 'tagbar'       : 1,
    \ 'qf'           : 1,
    \ 'notes'        : 1,
    \ 'markdown'     : 1,
    \ 'unite'        : 1,
    \ 'text'         : 1,
    \ 'vimwiki'      : 1,
    \ 'gitcommit'    : 1,
\ }
let g:ycm_collect_identifiers_from_tags_files=1             " open YCM tags completion
let g:ycm_complete_in_comments=1
"let g:ycm_complete_in_strings=1
"let g:ycm_collect_identifiers_from_comments_and_strings=1   "
let g:ycm_seed_identfiers_with_syntax=1                     " grammar keyword completion
let g:ycm_confirm_extra_conf=0                              " load file .ycm_extra_conf.py
let g:ycm_key_list_select_completion=['<M-n>', "<Down>"]    " completion the full list shortcut key; default TAB
let g:ycm_key_list_previous_completion=['<M-m>', "<Up>"]    " completion the full list shortcut key; default TAB
"let g:ycm_show_diagnostics_ui=0
let g:ycm_min_num_of_chars_for_completion=2                 " lists the matches frim the second character
let g:ycm_cache_comnifunc=0                                 " cache matching entries are not allowed
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"inoremap <leader>; <C-x><C-o>
"let g:syntastic_ignore_filrs=[".*\.py$"]
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |
"nnoremap <M-=> :YcmCompleter GoToDefinition<CR>             " jump to define
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <M-=> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" set NERDTree
nmap <F9> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1             " set NERDTree book marks default on
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\hg$', '^\.svn$', '\.bzr$']
let NERDTreeWinSize=32                  " set width
let NERDTreeWinPos="right"              " set position
let NERDTreeShoeHidden=1                " show the hidden files
let NERDTreeMinimalUI=1                 " the window tags not show help info
let NERDTreeAutoDeleteBuffer=1          " Automatically deletes files when deletes files buffer

" set minibuffexploer
"map <F7>  :MBEToggle<CR>
map <M-q> :bn<CR>                       " switch window
map <M-w> :bp<CR>                       " switch window
"let g:miniBufExplMapWindowNavVim=1      " use <C-h,j,k,l> switch window
"let g:miniBufExplMapWindowMavArrows=1   " use <C-<Down,Up,Left,Right>> switch window
"let g:miniBufExplMapCTabSwitchBufs=1    " use <C-Tab> switch window
"let g:miniBufExplModSelTarget=1
let g:miniBufExplModThanOne=0

" alt key mapping
set ttimeout ttimeoutlen=100    " set keypad code to judfe time
" set *.cpp & *.h switch
exec "set <M-t>=\et"
inoremap <M-t> <esc>ta
" set CtrlSF find
exec "set <M-f>=\ef"
inoremap <M-f> <esc>fa
" set LeaderF search
exec "set <M-s>=\es"
inoremap <M-s> <esc>sa
" set /*  */
exec "set <M-c>=\ec"
inoremap <M-c> <esc>ca
" set cancel /*  */
exec "set <M-u>=\eu"
inoremap <M-u> <esc>ua
" ser switch /*  */ & //
exec "set <M-a>=\ea"
inoremap <M-a> <esc>aa
" set YCM Down
exec "set <M-n>=\en"
inoremap <M-n> <esc>na
" set YCM Up
exec "set <M-m>=\em"
inoremap <M-m> <esc>ma
" set YCM enter definition
exec "set <M-=>=\e="
inoremap <M-=> <esc>=a
" set miniBufExpl switch windoe
exec "set <M-q>=\eq"
inoremap <M-q> <esc>qa
exec "set <M-w>=\ew"
inoremap <M-w> <esc>wa

" new creat *.c,*.h,*.sh & .. , automatically insert the comment module
" function {
    autocmd BufNewFile *.md exec ":call Setmd()"
    func! Setmd()
        call setline(1, "data: ".strftime("%Y-%m-%d %T"))
        call append(line("."), "tags: ")
        call append(line(".")+1, "---")
        call append(line(".")+2, "")
    endfunc
    autocmd BufNewFile *.c,*.cpp,*.h,*.sh,*.py exec ":call SetTitle()"
    func! SetTitle()         " define function SetTitle, auto insert file header
        if &filetype=='python'
            call setline(1, "#-*- encoding: UTF-8 -*-")
            call append(line("."), "#-------------------------------------import-------------------------------------")
            call append(line(".")+1, "#--------------------------------------------------------------------------------#")
            call append(line(".")+2, "##################################################################################")
        endif
        if &filetype=='sh'
            call setline(1, "\##################################################################################")
            call append(line("."),   "\# File Name    : ".expand("%"))
            call append(line(".")+1, "\# Author       : Jungle")
            call append(line(".")+2, "\# Mail         : ")
            call append(line(".")+3, "\# Created Time : ".strftime("%c"))
            call append(line(".")+4, "\# Last Changed : TIMESTAMP")
            call append(line(".")+5, "\##################################################################################")
            call append(line(".")+6, "\#!/bim/bash".expand("%"))
            call append(line(".")+7, "")
        endif
        if &filetype=='c'
            call setline(1, "/**")
            call append(line("."),   "  ********************************************************************************")
            call append(line(".")+1, "  * @File Name    : ".expand("%"))
            call append(line(".")+2, "  * @Author       : Jungle")
            call append(line(".")+3, "  * @Mail         : ")
            call append(line(".")+4, "  * @Created Time : ".strftime("%c"))
            call append(line(".")+5, "  * @Version      : V1.0")
            call append(line(".")+6, "  * @Last Changed : TIMESTAMP")
            call append(line(".")+7, "  * @Brief        : ")
            call append(line(".")+8, "  ********************************************************************************")
            call append(line(".")+9, "  */")
            call append(line(".")+10, "")
            call append(line(".")+11, "/* Inlcude ---------------------------------------------------------------------*/")
            call append(line(".")+12, "")
            call append(line(".")+13, "/** @addtogroup Template_Project")
            call append(line(".")+14, "  * @{")
            call append(line(".")+15, "  */")
            call append(line(".")+16, "")
            call append(line(".")+17, "/* Private typedef -------------------------------------------------------------*/")
            call append(line(".")+18, "/* Private define --------------------------------------------------------------*/")
            call append(line(".")+19, "/* Private macro define --------------------------------------------------------*/")
            call append(line(".")+20, "/* Private variables -----------------------------------------------------------*/")
            call append(line(".")+21, "/* Private function declaration ------------------------------------------------*/")
            call append(line(".")+22, "/* Private functions -----------------------------------------------------------*/")
            call append(line(".")+23, "/**")
            call append(line(".")+24, "  * @brief  ")
            call append(line(".")+25, "  * @param  ")
            call append(line(".")+26, "  * @retval ")
            call append(line(".")+27, "  */")
            call append(line(".")+28, "void function(void)")
            call append(line(".")+29, "{")
            call append(line(".")+30, "")
            call append(line(".")+31, "}")
            call append(line(".")+32, "")
            call append(line(".")+33, "/**")
            call append(line(".")+34, "  * @}")
            call append(line(".")+35, "  */")
            call append(line(".")+36, "")
            call append(line(".")+37, "/************************** Coopyright (C) Company YEAR *******END OF FILE*******/")
        endif
        if expand("%:e")=='h'
            call setline(1, "/**")
            call append(line("."),   "  ********************************************************************************")
            call append(line(".")+1, "  * @File Name    : ".expand("%"))
            call append(line(".")+2, "  * @Author       : Jungle")
            call append(line(".")+3, "  * @Mail         : ")
            call append(line(".")+4, "  * @Created Time : ".strftime("%c"))
            call append(line(".")+5, "  * @Version      : V1.0")
            call append(line(".")+6, "  * @Last Changed : TIMESTAMP")
            call append(line(".")+7, "  * @Brief        : ")
            call append(line(".")+8, "  ********************************************************************************")
            call append(line(".")+9, "  */")
            call append(line(".")+10, "")
            call append(line(".")+11, "/* Define to prevent recursive inclusion ---------------------------------------*/")
            call append(line(".")+12, "#ifndef __HEADER_H_")
            call append(line(".")+13, "#define __HEADER_H_")
            call append(line(".")+14, "")
            call append(line(".")+15, "/* Inlcude ---------------------------------------------------------------------*/")
            call append(line(".")+16, "")
            call append(line(".")+17, "/* Exported typedef -------------_----------------------------------------------*/")
            call append(line(".")+18, "/* Exported define -------------------------------------------------------------*/")
            call append(line(".")+19, "/* Exported macro define -------------------------------------------------------*/")
            call append(line(".")+20, "/* Exported variables ----------------------------------------------------------*/")
            call append(line(".")+21, "/* Exported functions ----------------------------------------------------------*/")
            call append(line(".")+22, "")
            call append(line(".")+23, "#endif /* __HEADER_H _ */")
            call append(line(".")+24, "")
            call append(line(".")+25, "/************************** Coopyright (C) Company YEAR *******END OF FILE*******/")
        endif
    endfunc
    autocmd BufNewFile * normal G   " end of the new file

    autocmd BufWritePre,FileWritePre *.c,*.h,*.sh,*.py ks|call LastChanged()|'s
    func! LastChanged()     " auto add last changed data
        if line ("$") > 15
            let l = 15
        else
            let l = line("$")
        endif
        exe "1,".l."g/Last Changed : /s/Last Changed : .*/Last Changed : ".strftime("%c")
    endfunc

    " strip all trailing whitespace in the current file
    "autocmd BufWritePre *.c,*.cpp,*.h,*.sh,*.py :%s/\s\+$//<CR>:let @/=''<CR>
    autocmd BufWritePre * :%s/\s\+$//e
" }
