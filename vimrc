" Hotkeys summary (note <leader> == ",")
" ----------------
" <leader> d            Rope goto definition (jedi through rope)
" <Ctrl>-o              Jump back
" K                     Show documentation with jedi plugin

" Ctrl-l                Creates documentation of highlighted 'def' or 'class'
" def + <Tab>           Create snippet for new function
" ipdb + <Tab>          Sets trace
" <leader> ig           Toggle visualization of indent guides
" :Ack foo [{dir}]      Search recursively

" <Ctrl-Space>          Rope autocomplete (jedi through rope)

" <leader> tl           opens TaskList (shows every todo)
" <leader> r            Deletes the word under the cursor and enters insert mode. When insert mode is left, it will rename all the occurrencies
" <leader> n            List of all names which point to the definition of the name under the cursor
" [[                    Jump on previous class or function (normal, visual, operator modes) (jedi through rope)
" ]]                    Jump on next class or function (normal, visual, operator modes)  (jedi through rope)
" [M                    Jump on previous class or method (normal, visual, operator modes) (jedi through rope)
" ]M                    Jump on next class or method (normal, visual, operator modes) (jedi through rope)
" Ctrl-W                Go to next error

" <F2>                  Toggle paste mode
" <F4>                  Navigate through undos (with Gundo)
" <F6>                  Autofix PEP8 errors
" Ctrl-g                Shows the current filename
"
"
" <F8>                  Enable spell-check
" z                     View spelling suggestions for the mispelled word
" zg                    Add the current word to the dictionary
" zug                   Remove the current word from the dictionary
" ]s                    Next mispelled word
" [s                    Prev mispelled word
" gqq                   Autowrap the current line

" Plugins description
" -------------------
"  * ack: search recursively with :Ack [options] {pattern} [{directories}]
"  * autopep8: format code according to PEP8 specifications
"  * gundo: diff with last saves
"  * jedi-vim: does everything :)
"  * pydocstring: inserts templates for the documentation
"  * tomtom/tlib_vim: (snipmate requirement)
"  * solarized: solarized theme for vim
"  * MarcWeber/vim-addon-mw-utils: (snipmate requirement)
"  * snipmate: allows to insert snippets with <snippet_name> + <Tab>
"  * snippets: snipmate custom snippets directory
"  * supertab: provides autocomplete with TAB
"  * syntastic: syntax check in vim (a syntax checker has to be installed) 
"  * tasklist: lists of every todo in the code
"  * unite.vim: search and display information from arbitrary sources like files, buffers, ..
"  * vim-indent-guides: adds indentation guides
"  * vim-easyclip: enhance copy and paste
"  * vim-gitgutter: show git diff in the gutter (sign column)
"  * vim-markdown: syntax highlighting for markdown
"  * vim-pep8-text-width: wraps text at 79 char for code and 72 for comments (PEP8 specifications)
"  * vim-repeat: enhance vim's last command repetition with '.'
"  * vim-yaml: indentation settings for yaml files

" Disabled
"  * pydoc: shows the documentation of the current command
"  * python-mode: apparently not compatible with jedi-vim

" Also, the indent directory contains a script to automatically indent python

" Notes
" * make sure .viminfo is owned by your user
" * to select text with mouse keep shift pressed
" * to have code completion in an environment, set VIRTUAL_ENV=/path/to/the/environment 
" * To add or remove plugins, edit .vimrc, (re)open vim, run :PluginInstall or
"   :PluginClean. See ':h vundle' for more details or Vundle wiki for FAQ

" Vundle + plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " you can also pass a path where Vundle should install plugins

" The installed bundles 
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle (required!)  

Plugin 'mileszs/ack.vim'
Plugin 'hhatto/autopep8'
Plugin 'sjl/gundo.vim', {'name': 'gundo'}
Plugin 'davidhalter/jedi-vim'
Plugin 'heavenshell/vim-pydocstring', {'name': 'pydocstring'}
Plugin 'altercation/vim-colors-solarized', {'name': 'solarized'}
Plugin 'tomtom/tlib_vim'  " (snipmate requirement)
Plugin 'MarcWeber/vim-addon-mw-utils'  " (snipmate requirement)
Plugin 'garbas/vim-snipmate', {'name': 'snipmate'}
Plugin 'fvisin/vim-snippets.git', {'name': 'snipmate-snippets'}  " fork of garbas/vim-snipmate without annoying . snippet
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
" Plugin 'vim-latex/vim-latex'
Plugin 'vim-scripts/TaskList.vim', {'name': 'tasklist'}
Plugin 'Shougo/unite.vim'
Plugin 'svermeulen/vim-easyclip'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'plasticboy/vim-markdown'
Plugin 'jimf/vim-pep8-text-width'
Plugin 'tpope/vim-repeat'
Plugin 'avakhov/vim-yaml'
" Plugin 'fs111/pydoc.vim', {'name': 'pydoc'}
" Plugin 'klen/python-mode'  " Apparently not compatible with jedi-vim

" TODO: C++ 
" http://www.zwiener.org/vimautocomplete.html

call vundle#end()            " required
filetype plugin indent on    " required



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700 

" Set to auto read when a file is changed from the outside
set autoread 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent 
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8 

" Use Unix as the standard file type
set ffs=unix,dos,mac 
let mapleader=","

" Timeout after leader key
set tm=500 

" Prevent ctrl-z from closing vim 
map <C-Z> <Nop> 

" Set F2 to paste mode toggle
set pastetoggle=<F2>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scroll to keep the cursor n lines above/under the end/top of the page
set so=7 

" Turn on the WiLd menu (autocomplete :commands)
set wildmenu 
set wildmode=longest:list,full

" Show matching brackets
set showmatch 

" Show incomplete commands
set showcmd 

" How many tenths of a second to blink when matching brackets
set mat=3 

" Enable syntax highlighting for .bash_aliases
au BufNewFile,BufRead .bashrc*,bashrc,bash.bashrc,.bash_aliases,.bash_profile*,.bash_logout*,*.bash,*.ebuild set filetype=sh
au BufNewFile,BufRead *.txt set filetype=rest
"call SetFileTypeSH("bash")
"set laststatus=2 --> status is very useful, but wastes one line
"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L" " Show filename in status bar
" set hid " A buffer becomes hidden when it is abandoned
" set magic " For regular expressions turn magic on

" Always show current position
set ruler 

" show line and percentage (default)
set rulerformat=%l,%c%V%=%P 

" Height of the command bar
set cmdheight=1 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight results of search
set hlsearch 

" Makes search act like search in modern browsers
set incsearch 

" Do case insensitive matching
set ignorecase 

" Search case sensitive only if you type uppercase
set smartcase 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Errors and warnings notifications
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlight and colors
syntax on " Enable syntax highlighting
filetype on " Try to detect filetypes
filetype plugin indent on " Turn on filetype-specific indenting modes and plugins
let python_highlight_all=1 " Extra highlights
" Colors
" set term=xterm
set t_Co=256 " Force VIM to use 256 colors even if terminal doesn't
colo solarized " use the solarized color scheme
set background=dark " use the dark background scheme
" Highlight text that is longer than 80 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=0 
  autocmd BufEnter * match OverLength /\%80v.*/
augroup END
"if exists('+colorcolumn') " Draw a yellow column after 80 lines and after 120 
"    let &colorcolumn="80,".join(range(120,999),",") 
"    hi ColorColumn ctermfg=yellow ctermbg=232 guibg=#2c2d27
"endif

" Error and warning highlight colors 
hi Search ctermfg=237 ctermbg=178 " Colors for search

" *** No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup 
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Personalized key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Redefine W and Q because c'mon, they are not even a command!
command WQ wq
command Wq wq
command W w
command Q q
" Move between windows with alt+arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" Map jj to <Esc>
imap jj <Esc>
" Map ctrl-W to next error
nmap <C-W> :lnext<CR>
" When in normal mode, press Space followed by the character that you want to insert.
:nnoremap <Space> i_<Esc>r
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Acrivate spell check
noremap <F8> :set spell spelllang=en_us <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hacks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip trailing whitespace off all lines every time you save a .py or .pyx file
autocmd BufWritePre *.py,*.pyx,*.tex :%s/\s\+$//e

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Jump to the last position when reopening a file (NB: .viminfo should be owned by your user)
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Vim scrolling 
set mouse=a
"set ttymouse=xterm
" Code completition in virtual environments
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








" => Autopep8 (autofix pep8 errors)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F6> :!autopep8 --in-place --aggressive --aggressive %


" => Gundo (navigate through undo list)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F4> :GundoToggle<CR>


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
let g:syntastic_check_on_open = 1
let g:syntastic_always_populate_loc_list = 1 "populate error list so that we can cycle through them
"let g:syntastic_auto_loc_list=1  "open list of errors
let g:syntastic_loc_list_height = 5  "list length
let g:syntastic_auto_jump = 0  "do not jump to errors when detected
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'  "show number of errors and warnings
"set the colour of errors and warnings 
hi SpellBad ctermfg=235 ctermbg=166                       " errors line 
" hi error ctermfg=237 ctermbg=178                        " errors sign
hi SyntasticErrorSign ctermfg=166 cterm=bold              " style errors sign 
" hi error ctermfg=darkblue ctermbg=yellow                " errors sign
" hi SyntasticErrorSign ctermfg=darkblue ctermbg=yellow   " style errors sign


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













" AUTORELOAD BUFFERS WHEN FILES ARE CHANGED EXTERNALLY
" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})
" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  let @"=reg_saved
endfunction

" Options
let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)
