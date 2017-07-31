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

" let mapleader=";"

" sybtax highlighting
syntax enable
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
set background=dark
"set t_Co=256
"colorscheme solarized
colorscheme molokai
"colorscheme phd

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
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
"set hidden		" Hide buffers when they are abandoned
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
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
call vundle#end()

" set theme style
"let g:Powerline_colorscheme='solarized256'

" set indent guides
let g:indent_guides_enable_on_vim_startup=1	" follow VIM startup
let g:indent_guides_start_level=2	    	" starting from the second visual diapaly the indentation
let g:indent_guides_guide_sizw=1	    	" color piece width
":nmap <silent> <leader>i <Plug>IndentGuidesToggle

" *.c** & *.h, fast switch
":nmap <silent> <Leader>sw :FSHere<cr>

" set Ctags
"set tags=./tags,./*/tags
"map <F7>: !ctags -R <CR><CR>

" set tagbar
map <F8> :TagbarToggle<CR>
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

" set indexer 
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+c+d+e+f+l+m+n+p+s+t+u+v+x --fields=+iaSl --extra=+q"

" set ultisnips
"let g:UltiSnipsSnippetDir="~/.vim/bundle/ultisnips"
"let g:UltiSnipsSnippetDirectories=['~/.vim/bundle/ultisnips/UltiSnips']
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" set YouComplete
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files=1             " open YCM tags completion 
let g:ycm_complete_in_comments=1
"let g:ycm_complete_in_strings=1
"let g:ycm_collect_identifiers_from_comments_and_strings=1   " 
let g:ycm_seed_identfiers_with_syntax=1                     " grammar keyword completion  
let g:ycm_confirm_extra_conf=0                              " load file .ycm_extra_conf.py  
let g:ycm_key_list_select_completion=['<c-n>', '<Down>']    " completion the full list shortcut key; default TAB  
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>']    " completion the full list shortcut key; default TAB 
"let g:ycm_show_diagnostics_ui=0
let g:ycm_min_num_of_chars_for_completion=2                 " lists the matches frim the second character 
let g:ycm_cache_comnifunc=0                                 " cache matching entries are not allowed
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"inoremap <leader>; <C-x><C-o>
"let g:syntastic_ignore_filrs=[".*\.py$"]
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR> |

" set NERDTree
nmap <F9> :NERDTreeToggle<CR>
let NERDTreeWinSize=32              " set width 
let NERDTreeWinPos="right"          " set position 
let NERDTreeShoeHidden=1            " show the hidden files 
let NERDTreeMinimalUI=1             " the window tags not show help info 
let NERDTreeAutoDeleteBuffer=1      " Automatically deletes files when deletes files buffer 


" ban cursor blink
"set gcr=a:block-blinon0

" ban on the scroll bar dispaly
"set guioptions-=l
"set guioptions-=L
"set guioptions-=r
"set guioptions-=R

" ban on the menu bar dispalay
"set guioptions-=m
"set guioptions-=M

" alaways shows status bar
set laststatus=2

" show the current cursor position
set ruler

" open line number
set number

" code indentation
filetype indent on              " different file smart indent
filetype plugin on              " load the corrrsponding plug-in for different file types
filetype plugin indent on       " open antomatic completion
set expandtab	                " TAB extension for space
set tabstop=4	                " set the edit TAB takes up space
set shiftwidth=4                " set the format TAB takes up space
"set softtabstop=4              " the continue spaces as a TAB character

" highlighting the current line/column
set cursorline
"set cursorcolumn

" highlighting the search result
"set hlsearch

" code folding
"set foldmethod=indent  "based on the code folding indentation
set foldmethod=syntax   "based on the syntax folding indentation
set nofoldenable        "close code folding when VIM startup
 
