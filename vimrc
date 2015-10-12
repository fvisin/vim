" Hotkeys summary (note <leader> == ",")
" ----------------
" <leader> d            Rope goto definition (jedi through rope)
" <Ctrl>-o              Jump back
" K                     Show documentation with jedi plugin

" Ctrl-l                Creates documentation of highlighted 'def' or 'class'
" def + <Tab>           Create snippet for new function
" ipdb + <Tab>          Sets trace
" <leader> ig           Toggle visualization of indent guides

" <Ctrl-Space>          Rope autocomplete (jedi through rope)

" <leader> tl           opens TaskList (shows every todo)
" <F5>                  Gundo popup (diff with last saves)
" <leader> r            Deletes the word under the cursor and enters insert mode. When insert mode is left, it will rename all the occurrencies
" <leader> n            List of all names which point to the definition of the name under the cursor
" [[                    Jump on previous class or function (normal, visual, operator modes) (jedi through rope)
" ]]                    Jump on next class or function (normal, visual, operator modes)  (jedi through rope)
" [M                    Jump on previous class or method (normal, visual, operator modes) (jedi through rope)
" ]M                    Jump on next class or method (normal, visual, operator modes) (jedi through rope)

"<F5>                   Navigate through undos
"<F8>                   Autofix PEP8 errors

" Plugins description
" -------------------
"  * autopep8: format code according to PEP8 specifications
"  * gundo: diff with last saves
"  * jedi-vim: does everything :)
"  * pydocstring: inserts templates for the documentation
"  * snipmate: allows to insert snippets with <snippet_name> + <Tab>
"  * snippets: snipmate custom snippets directory
"  * supertab: provides autocomplete with TAB
"  * syntastic: syntax check in vim (a syntax checker has to be installed) 
"  * tasklist: lists of every todo in the code
"  * vim-indent-guides: adds indentation guides
"  * vim-pep8-text-width: wraps text at 79 char for code and 72 for comments (PEP8 specifications)
"  * vim-yaml: indentation settings for yaml files

" Disabled
"  * pydoc: shows the documentation of the current command



" Vundle + plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " you can also pass a path where Vundle should install plugins

" The installed bundles 
" To modify: add or remove, close .vimrc, open any file with vim and run :PluginInstall
" see :h vundle for more details or wiki for FAQ
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle (required!)  

Plugin 'hhatto/autopep8'
Plugin 'sjl/gundo.vim', {'name': 'gundo'}
Plugin 'davidhalter/jedi-vim'
Plugin 'heavenshell/vim-pydocstring', {'name': 'pydocstring'}
Plugin 'tomtom/tlib_vim'  " (snipmate requirement)
Plugin 'MarcWeber/vim-addon-mw-utils'  " (snipmate requirement)
Plugin 'garbas/vim-snipmate', {'name': 'snipmate'}
Plugin 'honza/vim-snippets', {'name': 'snippets'}
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/TaskList.vim', {'name': 'tasklist'}
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jimf/vim-pep8-text-width'
Plugin 'avakhov/vim-yaml'
" Plugin 'fs111/pydoc.vim', {'name': 'pydoc'}
" Plugin 'klen/python-mode'  " Apparently not compatible with jedi-vim
" Also, the indent directory contains a script to automatically indent python

" TODO: C++ 
" http://www.zwiener.org/vimautocomplete.html

call vundle#end()            " required
filetype plugin indent on    " required



" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation and tab settings
set autoindent " New line inherits indentation from the previous line
set nosmartindent " Avoid losing indentation when inserting '#'
set cindent " Should be smarter than smartindent. Autoindents after brackets, ..
set tabstop=4 " 1 Tab = 4 spaces
set softtabstop=4 " Number of spaces for tab in insert mode
set shiftwidth=4 " 1 Tab = 4 spaces
set smarttab " interpret Tab depending on where is the cursor
set expandtab " Substitute tabs with spaces
set ai " Auto indent: copy indentation from previous line
set wrap " Wrap lines
" set textwidth=80 " Set line break at 80 characters --> vim-pep8-text-width
" set formatoptions+=t " Enable automatic text wrapping --> vim-pep8-text-width
" set si " Smart indent: automatically insert one extra level in some cases
" set listchars=tab:\|\<Space> " how to highlight tabs
" set number " Show line numbers
" set lbr " Set line break


" Generic stuff
set history=700 " Sets how many lines of history VIM has to remember
set autoread " Set to auto read when a file is changed from the outside
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu " Turn on the WiLd menu (autocomplete :commands)
set ruler " Always show current position
set cmdheight=2 " Height of the command bar
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l " idem
set lazyredraw " Don't redraw while executing macros (good performance config)
set showmatch " Show matching brackets
set mat=2 " How many tenths of a second to blink when matching brackets
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
let mapleader=","
set tm=500 " Timeout after leader key
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

" Move between windows with alt+arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Syntax highlight and colors
syntax on " Enable syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Turn on filetype-specific indenting modes and plugins
let python_highlight_all=1 " Extra highlights

" Colors --> not working well, it's a mess.
"set t_Co=256 " Force VIM to use 256 colors even if terminal doesn't
"colo fra  " use my color scheme

" Highlight text that is longer than 80 characters
"if exists('+colorcolumn') " Draw a yellow column after 80 lines and after 120 
"    let &colorcolumn="80,".join(range(120,999),",") 
"    hi ColorColumn ctermfg=yellow ctermbg=232 guibg=#2c2d27
"endif
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%80v.*/
augroup END

" Error and warning highlight colors 
"hi Search ctermfg=237 ctermbg=178 " Colors for search

" Search options
set hlsearch " Highlight results of search
set incsearch " Makes search act like search in modern browsers
set ignorecase " Do case insensitive matching
set smartcase " Search case sensitive only if you type uppercase

" Strip trailing whitespace off all lines every time you save a .py or .pyx file
autocmd BufWritePre *.py,*.pyx :%s/\s\+$//e

" Jump to the last position when reopening a file (NB: .viminfo should be owned by your user)
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

" Map jj to <Esc>
imap jj <Esc>



" => Autopep8 (autofix pep8 errors)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F8> :!autopep8 --in-place --aggressive --aggressive %


" => Gundo (navigate through undo list)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>


" => Jedi-vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" (refer to https://github.com/davidhalter/jedi-vim#faq)
let g:jedi#completions_command='<C-Space>'  "(def:<C-N>)
let g:jedi#popup_on_dot = 0  "(def:1)
let g:jedi#show_call_signatures = 2  " 0=disabled, 1=popup in the buffer (fucks up undos), 2=popup in command line (def: 1)
let g:jedi#smart_auto_mappings=0  "fancy things like automatically add 'import' after from something (def:1)
" let g:jedi#auto_close_doc  "autoclose doc when insert mode is left(def:1)
" let g:jedi#documentation_command  "(def:K)
" let g:jedi#completions_enabled  "(def:1)
" let g:jedi#force_py_version  "Force python2 or python3 (def:auto)
" let g:jedi#goto_command  "try to find the original definition of the command under the cursor (def:<leader>d)
" let g:jedi#max_doc_height  "(def:20)
" let g:jedi#popup_select_first = 0  "automatically select the first entry of the completion menu
" let g:jedi#rename_command  "deletes the word currently under the cursor and puts Vim in insert mode. Upon leaving insert mode, jedi-vim then renames all occurences of the old variable (def:<leader>r)
" let g:jedi#usages_command  "list of all names which point to the definition of the name under the cursor (def:<leader>n) 
" let g:jedi#use_tabs_not_buffers  "use tabs to go to a definition, etc (def: 0)
" let g:jedi#use_splits_not_buffers  "use a split window instead of a buffer (def: 1, other: left, right, top, bottom, winwidth)


" => Pydocstring 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pydocstring_templates_dir = $HOME."/.vim/pydocstring-templates/"


" => Supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType python set omnifunc=pythoncomplete#Complete " This breaks Jedi
let g:SuperTabDefaultCompletionType = "context"
" set completeopt=menuone,longest,preview  # kyle
let g:SuperTabDefaultCompletionType = "<c-x><c-o>" " always use omni completion (i.e. Jedi)


" => Syntastic (Syntax check)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You can run checkers explicitly by calling :SyntasticCheck <checker
let g:syntastic_python_checkers = ['flake8'] "use one of the following checkers: 
                                             " flake8, pyflakes, pylint, python (native checker)
let g:syntastic_enable_highlighting = 1  "highlight errors and warnings
let g:syntastic_style_error_symbol = ">>" "error symbol
let g:syntastic_warning_symbol = ">>" "warning symbol
"let g:syntastic_auto_loc_list=1  "open list of errors
let g:syntastic_loc_list_height = 5  "list length
let g:syntastic_auto_jump = 0  "do not jump to errors when detected
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'  "show number of errors and warnings
"set the colour of errors and warnings 
"hi SpellBad ctermfg=237  ctermbg=178
"hi error ctermfg=237 ctermbg=178                       " errors sign
"hi SyntasticErrorSign ctermfg=237 ctermbg=178          " style errors sign
hi SpellBad ctermfg=darkblue ctermbg=yellow             " errors line
hi error ctermfg=darkblue ctermbg=yellow                " errors sign
hi SyntasticErrorSign ctermfg=darkblue ctermbg=yellow   " style errors sign


" => Tasklist 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>tl <Plug>TaskList


" => Vim indent guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggled with <Leader> ig
let g:indent_guides_auto_colors = 0 " set colors manually
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_start_level=2 " start showing indentation from the 2 level
let g:indent_guides_guide_size=1 " dimension of the guide
let g:indent_guides_enable_on_vim_startup=0 "autostart














" DISABLED



" => Pydoc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open docs with <leader>pw or <leader>pW
" let g:pydoc_highlight = 0 " Don't highlight word when open word definition 


" => Python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'
"let g:pymode_doc = 0
" set completeopt=menu " Prevent the docs window from automatically open

"Linting
"let g:pymode_lint = 0  " Disable linting: use syntastic
""let g:pymode_lint_checker = "pyflakes,pep8,pep257"
""let g:pymode_lint_write = 1 " Auto check on save (if modified)
""let g:pymode_lint_unmodified = 0 " Check even if unmodified
""let g:pymode_lint_signs = 1 " Place error signs
""let g:pymode_lint_ignore = "C901"
""let g:pymode_lint_cwindow = 1 "Auto open cwindow (quickfix) if any errors have been found
"
"" Automatically fix PEP8 errors in the current buffer:
"noremap <F8> :PymodeLintAuto<CR>
"
"" Support virtualenv detection
"let g:pymode_virtualenv = 1
"
"" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_key = '<leader>b'
"let g:pymode_breakpoint_cmd = 'from IPython import embed; embed()'
"
"" Completion
"let g:pymode_rope_completion = 1 " Turn on code completion
"let g:pymode_rope_complete_on_dot = 0 " Turn off autocomplete on dot
"let g:pymode_rope_completion_bind = '<C-Space>' " Ctrl-space to complete
"let g:pymode_rope_autoimport = 1 " Autocomplete objects that have not been imported
"
"" Syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
"" Don't autofold code
"let g:pymode_folding = 0
"
"" Disable rope (refactoring)
"let g:pymode_rope = 0 
                                                                                

" => Ropevim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to definition and rename all occurrencies
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>


" => Ulti-snips 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<Tab>"
""let g:UltiSnipsJumpForwardTrigger="<c-b>"
""let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remap ycm keys to iterate over list, as by default are mapped to tab and
"" s-tab, which breaks ultisnips
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
"let g:ycm_autoclose_preview_window_after_completion=1
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
