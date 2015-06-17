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
"  * 

" Enable central plugin repository
source ~/.vim/autoload/pathogen.vim
if filereadable(expand("/opt/lisa/os/vim/bundle/{}"))
	call pathogen#infect('/opt/lisa/os/vim/bundle/{}')
endif
call pathogen#infect('~/.vim/bundle/{}') " Call it also for the local plugin path
filetype off
call pathogen#helptags()

" Default indentation and tab settings
set autoindent " New line inherits indentation from the previous line
set nosmartindent " Avoid losing indentation when inserting '#'
set cindent " Should be smarter than smartindent. Autoindents after brackets, ..
set tabstop=4
set shiftwidth=4
set expandtab

" Syntax highlight
syntax on " Enable syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Enable loading indent file for filetype
filetype plugin indent on " Turn on filetype-specific indenting modes and plugins
let python_highlight_all=1 " Extra highlights
set hlsearch " Highlight results of search

" Search options
set showmatch      " Show matching brackets.
set ignorecase     " Do case insensitive matching
set smartcase      " Do smart case matching (search case sensitive only if you type uppercase)

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
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    #activate_this = os.path.join(project_base_dir,
"    #'bin/activate_this.py')
"    #execfile(activate_this, dict(__file__=activate_this))
"EOF


" Draw a yellow column after 80 lines
"if exists('+colorcolumn')
"    highlight ColorColumn ctermbg=darkyellow
"    "aGrey
"    call matchadd('ColorColumn', '\%81v', 100)
"    "call matchadd('ColorColumn', '\%76v', 100)
"    "let &colorcolumn=join(range(81,999),",")
"    "let &colorcolumn="80,".join(range(120,999),",")
"endif

"-------------------------------------------------------------------------

" *** Gundo *** (navigate through undo list)
map <leader>g :GundoToggle<CR>

" *** Jedi-vim *** 
" (refer to https://github.com/davidhalter/jedi-vim#faq)
let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = "0"
"let g:jedi#popup_select_first = 0

" *** Pydoc ***
" Open docs with <leader>pw or <leader>pW
filetype plugin on
let g:pydoc_highlight=0 " Don't highlight word when open word definition 

" *** Pydocstring ***
let g:pydocstring_templates_dir = $HOME."/.vim/bundle/pydocstring-templates/"

" " *** SUPERTAB ***

" *** Syntastic *** (Syntax check)
let g:syntastic_enable_highlighting=1  "highlight errors and warnings
let g:syntastic_style_error_symbol = ">>" "error symbol
let g:syntastic_warning_symbol = ">>" "warning symbol
"let g:syntastic_auto_loc_list=1  "open list of errors
let g:syntastic_loc_list_height=5  "list length
let g:syntastic_auto_jump=0  "do not jump to errors when detected
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'  "show number of errors and warnings
"set the colour of errors and warnings (respectively)
"highlight link SyntasticError SpellBad    "default
"highlight link SyntasticWarning SpellCap  "default
hi SpellBad ctermfg=darkblue ctermbg=yellow            "errors line
hi error ctermfg=white ctermbg=yellow               "errors sign
hi SyntasticErrorSign ctermfg=white ctermbg=yellow  "style errors sign

" *** Tasklist ***
let mapleader=","
map <leader>tl <Plug>TaskList

" *** Ropevim ***
" Go to definition and rename all occurrencies
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

"" *** Ulti-snips ***
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<Tab>"
""let g:UltiSnipsJumpForwardTrigger="<c-b>"
""let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" *** YCM ***
"" Remap ycm keys to iterate over list, as by default are mapped to tab and
"" s-tab, which breaks ultisnips
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
"let g:ycm_autoclose_preview_window_after_completion=1
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"-------------------------------------------------------------------------

