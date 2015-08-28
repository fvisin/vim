" Hotkeys summary
" ----------------
" <leader>tl       --> opens TaskList (shows every todo)
" <leader>g        --> Gundo popup (diff with last saves)
" <leader>j        --> Goto definition
" <leader>r        --> Rename all occurrencies
" <leader>s        --> Search all occurrencies
" <leader>{pw, pW} --> Show documentation with pydoc plugin
" <K>              --> Show documentation with jedi plugin
" ipdb + <Tab>     --> Sets trace
" Ctrl-l           --> Creates documentation of highlighted 'def' or 'class'
" def + <Tab>      --> Create snippet for new method


" Plugins description
" -------------------
"  * gundo: diff with last saves
"  * jedi-vim: does everything :)
"  * pydoc: shows the documentation of the current command
"  * pydocstring: inserts templates for the documentation
"  * snipmate: allows to insert snippets with <snippet_name> + <Tab>
"  * snippets: snipmate custom snippets directory
"  * supertab: provides autocomplete with TAB
"  * syntastic: syntax check in vim (a syntax checker has to be installed) 
"  * tasklist: lists of every todo in the code
"  * vim-yaml: indentation settings for yaml files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle + plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle (required!)
Plugin 'gmarik/Vundle.vim'

" The bundles you install will be listed here
" After having saved and *closed* the file, reopen vim and run :PluginInstall
Plugin 'sjl/gundo.vim', {'name': 'gundo'}
Plugin 'davidhalter/jedi-vim'
Plugin 'fs111/pydoc.vim', {'name': 'pydoc'}
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/TaskList.vim', {'name': 'tasklist'}
Plugin 'heavenshell/vim-pydocstring', {'name': 'pydocstring'}
Plugin 'tomtom/tlib_vim'  " (snipmate requirement)
Plugin 'MarcWeber/vim-addon-mw-utils'  " (snipmate requirement)
Plugin 'garbas/vim-snipmate', {'name': 'snipmate'}
Plugin 'honza/vim-snippets', {'name': 'snippets'}
Plugin 'avakhov/vim-yaml'
" Plugin 'klen/python-mode'  " Apparently not compatible with jedi-vim

" TODO: C++ 
" http://www.zwiener.org/vimautocomplete.html

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" OLD
" Enable central plugin repository
" source ~/.vim/autoload/pathogen.vim
"if filereadable(expand("/opt/lisa/os/vim/bundle/{}"))
"	call pathogen#infect('/opt/lisa/os/vim/bundle/{}')
"endif
"call pathogen#infect('~/.vim/bundle/{}') " Call it also for the local plugin path
"filetype off
"call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation and tab settings
set autoindent " New line inherits indentation from the previous line
set nosmartindent " Avoid losing indentation when inserting '#'
set cindent " Should be smarter than smartindent. Autoindents after brackets, ..
set tabstop=4 " 1 Tab = 4 spaces
set shiftwidth=4 " 1 Tab = 4 spaces
set expandtab " Substitute tabs with spaces
set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines
set number " Show line numbers
" set smarttab
" set lbr " Set line break
" set tw=500 " Set line break at 500 characters


" Generic stuff
set history=700 " Sets how many lines of history VIM has to remember
set autoread " Set to auto read when a file is changed from the outside
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu " Turn on the WiLd menu (autocomplete :commands)
set ruler " Always show current position
set cmdheight=1 " Height of the command bar
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l " idem
set lazyredraw " Don't redraw while executing macros (good performance config)
set showmatch " Show matching brackets
set mat=2 " How many tenths of a second to blink when matching brackets
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
" set hid " A buffer becomes hidden when it is abandoned
" set magic " For regular expressions turn magic on

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Files, backups and undo
set nobackup 
set nowb
set noswapfile

" Syntax highlight and colors
syntax on " Enable syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Turn on filetype-specific indenting modes and plugins
let python_highlight_all=1 " Extra highlights
set tm=500
" Set extra options when running in GUI mode
" if has("gui_running")
"     set guioptions-=T
"     set guioptions+=e
"     set t_Co=256
"     set guitablabel=%M\ %t
" endif

" Search options
set hlsearch " Highlight results of search
set incsearch " Makes search act like search in modern browsers
set ignorecase " Do case insensitive matching
set smartcase " Search case sensitive only if you type uppercase

" Strip trailing whitespace off all lines every time you save a .py or .pyx file
" so you don't have to worry about removing it manually before you commit.
autocmd BufWritePre *.py,*.pyx :%s/\s\+$//e

" Jump to the last position when reopening a file
" Note: .viminfo should be owned by your user
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Vim scrolling (!!!) - NOTE: to select text with mouse keep shift pressed
set mouse=a
"set ttymouse=xterm

" Add the virtualenv's site-packages to vim path to have the code completion
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    #activate_this = os.path.join(project_base_dir,
    #'bin/activate_this.py')
    #execfile(activate_this, dict(__file__=activate_this))
EOF

" Draw a yellow column after 80 lines
"if exists('+colorcolumn')
"    highlight ColorColumn ctermbg=darkyellow
"    "aGrey
"    call matchadd('ColorColumn', '\%81v', 100)
"    "call matchadd('ColorColumn', '\%76v', 100)
"    "let &colorcolumn=join(range(81,999),",")
"    "let &colorcolumn="80,".join(range(120,999),",")
"endif


" Map jj to <Esc>
imap jj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gundo (navigate through undo list)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>g :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi-vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (refer to https://github.com/davidhalter/jedi-vim#faq)
let g:jedi#popup_on_dot = 0 "do not trigger autocomplete on dot
let g:jedi#show_call_signatures = 2 "popup with arguments of the current function 
"let g:jedi#popup_select_first = 0 "automatically select the first entry
let g:jedi#auto_close_doc = 1  "automatically close doc window
"let g:jedi#documentation_command = 'K'
let g:jedi#max_doc_height=20  "height of the doc window

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pydoc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open docs with <leader>pw or <leader>pW
filetype plugin on
let g:pydoc_highlight = 0 " Don't highlight word when open word definition 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pydocstring 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydocstring_templates_dir = $HOME."/.vim/bundle/pydocstring-templates/"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes) 
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_doc = 0
" set completeopt=menu " Prevent the docs window from automatically open

"Linting
let g:pymode_lint = 0  " Disable linting: use syntastic
"let g:pymode_lint_checker = "pyflakes,pep8,pep257"
"let g:pymode_lint_write = 1 " Auto check on save (if modified)
"let g:pymode_lint_unmodified = 0 " Check even if unmodified
"let g:pymode_lint_signs = 1 " Place error signs
"let g:pymode_lint_ignore = "C901"
"let g:pymode_lint_cwindow = 1 "Auto open cwindow (quickfix) if any errors have been found

" Automatically fix PEP8 errors in the current buffer:
noremap <F8> :PymodeLintAuto<CR>

" Support virtualenv detection
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_breakpoint_cmd = 'from IPython import embed; embed()'

" Completion
let g:pymode_rope_completion = 1 " Turn on code completion
let g:pymode_rope_complete_on_dot = 0 " Turn off autocomplete on dot
let g:pymode_rope_completion_bind = '<C-Space>' " Ctrl-space to complete
let g:pymode_rope_autoimport = 1 " Autocomplete objects that have not been imported

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Disable rope (refactoring)
let g:pymode_rope = 0 
                                                                                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType python set omnifunc=pythoncomplete#Complete " This breaks Jedi
let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview  # kyle
let g:SuperTabDefaultCompletionType = "<c-x><c-o>" " always use omni completion (i.e. Jedi)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (Syntax check)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers = ['flake8'] "use one of the following checkers: 
                                             " flake8, pyflakes, pylint, python (native checker)
let g:syntastic_enable_highlighting = 1  "highlight errors and warnings
let g:syntastic_style_error_symbol = ">>" "error symbol
let g:syntastic_warning_symbol = ">>" "warning symbol
"let g:syntastic_auto_loc_list=1  "open list of errors
let g:syntastic_loc_list_height = 5  "list length
let g:syntastic_auto_jump = 0  "do not jump to errors when detected
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'  "show number of errors and warnings
"set the colour of errors and warnings (respectively)
"highlight link SyntasticError SpellBad    "default
"highlight link SyntasticWarning SpellCap  "default
hi SpellBad ctermfg=darkblue ctermbg=yellow         " errors line
hi error ctermfg=white ctermbg=yellow               " errors sign
hi SyntasticErrorSign ctermfg=white ctermbg=yellow  " style errors sign

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tasklist 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map <leader>tl <Plug>TaskList

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ropevim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to definition and rename all occurrencies
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Ulti-snips 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<Tab>"
""let g:UltiSnipsJumpForwardTrigger="<c-b>"
""let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remap ycm keys to iterate over list, as by default are mapped to tab and
"" s-tab, which breaks ultisnips
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
"let g:ycm_autoclose_preview_window_after_completion=1
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
