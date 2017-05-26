""" .vimrc


""" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

""" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugins on a GitHub repo
"Plugin 'tpope/vim-fugitive'

" Tagbar
" class outline viewer
" https://github.com/majutsushi/tagbar
"Plugin 'majutsushi/tagbar'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'micha/vim-colors-solarized'

" fugitive
"Plugin 'tpope/vim-fugitive'

" vim-minimap
Plugin 'severin-lemaignan/vim-minimap'

" jedi-vim
" https://github.com/davidhalter/jedi-vim
Plugin 'davidhalter/jedi-vim'

" ctrlp.vim
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" https://github.com/kien/ctrlp.vim
" NOTE
" setup referencing https://github.com/square/maximum-awesome
Plugin 'kien/ctrlp.vim'

" octave.vim : Syntax highlighting file for GNU Octave language
" http://www.vim.org/scripts/script.php?script_id=3600
" https://github.com/vim-scripts/octave.vim--
Plugin 'vim-scripts/octave.vim--'

" vim-instant-markdown
" Instant Markdown previews from VIm!
" https://github.com/suan/vim-instant-markdown
"Plugin 'suan/vim-instant-markdown'


" plugins from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'CSApprox'


" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" plugin settings
" Tagbar
"nmap <F8> :TagbarToggle<CR>


"" https://raw.github.com/eevee/rc/master/.vimrc
"" set xterm title, and inform vim of screen/tmux's syntax for doing the same
"set titlestring=vim\ %{expand(\"%t\")}
"if &term =~ "^screen"
"    " pretend this is xterm.  it probably is anyway, but if term is left as
"    " `screen`, vim doesn't understand ctrl-arrow.
"    if &term == "screen-256color"
"        set term=xterm-256color
"    else
"        set term=xterm
"    endif
"
"    " gotta set these *last*, since `set term` resets everything
"    set t_ts=k
"    set t_fs=\
"endif
"set title
"

""" syntax highlighting
" syntax on
" syntax on vs enable: https://stackoverflow.com/questions/33380451/
if !exists("g:syntax_on")
    syntax enable
endif

""" show (partial) command in the last line of the screen
set showcmd


""" display line numbers
set number


""" automatically change working directory to the directory of the current file
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * lcd %:p:h


""" whitespace
" wrap, wrapping
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
" enable "visual" wrapping
"set wrap
" Don't split words when wrapping long lines.
set linebreak
set nolist  " list disables linebreak
" http://stackoverflow.com/questions/2280030/how-to-stop-line-breaking-in-vim
" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0
set wrapmargin=0
"set formatoptions+=l
set showtabline=2


""" default indentation
" one indentation level is 4 spaces unless overridden
" http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent


""" Bash-like tab autocomplete
" http://stackoverflow.com/questions/15697498/bash-like-code-completion-in-vim
"set completeopt+=longest


""" command-line completion
" http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
" http://vimdoc.sourceforge.net/htmldoc/options.html#%27wildmode%27
" http://vimdoc.sourceforge.net/htmldoc/options.html#%27wildmenu%27
set wildmode=longest,full
set wildmenu
" case insensitive filename completion
set wildignorecase


" CSApprox
"if &term =~ '^\(xterm\|screen\)$' && $COLORTERM == 'gnome-terminal'
"    set t_Co=256
"endif
" set it unconditionally
" TODO research for a better way
set t_Co=256


""" disable cursor blinking
" http://vim.wikia.com/wiki/Configuring_the_cursor#Disabling_cursor_blinking
set guicursor+=a:blinkon0


""" search
" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only.
set ignorecase
set smartcase
" While typing a search command, show where the pattern, as it was typed
" so far, matches.
set incsearch


""" source code lines should be at most 80 characters wide
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
" http://vim.wikia.com/wiki/Highlight_long_lines
""" set a marker on the 81th text column
set colorcolumn=81
""" set a marker on the 101st text column for Java
"set colorcolumn=101
""" highlight text longer than 80 characters
" disable with :match
" TODO
" use a function and shortcuts to enable and disable it
"match ErrorMsg '\%>80v.\+'


""" folds
" automatic folds based on syntax
" http://stackoverflow.com/questions/4789605/how-do-i-enable-automatic-folds-in-vim
set foldmethod=indent
set foldnestmax=1


""" Color schemes

" Tomorrow Themes
"colorscheme Tomorrow
"colorscheme Tomorrow-Night
colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night-Eighties

" Solarized Theme
"set background=light
"set background=dark
"colorscheme solarized


""" vim-minimap
let g:minimap_highlight='vimSearch'

""" EasyMotion
" https://github.com/Lokaltog/vim-easymotion
" faster and better motions
" let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_leader_key = '\'
"let g:EasyMotion_do_shade = 0
"hi link EasyMotionTarget ErrorMsg
"hi link EasyMotionShade Comment
hi link EasyMotionTarget2First EasyMotionTarget
hi link EasyMotionTarget2Second EasyMotionTarget
"hi EasyMotionTarget ctermbg=none ctermfg=red
"hi EasyMotionShade ctermbg=none ctermfg=gray
"hi EasyMotionTarget2First ctermbg=none ctermfg=red
"hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred


" set default encoding to utf-8
set encoding=utf-8


" TODO
" either change to use comma or remove
""" visible whitespace
" http://vimcasts.org/episodes/show-invisibles/
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬


""" filetype specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C
autocmd BufNewFile,BufRead *.h set filetype=c
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" CSS
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" HTML
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Java
autocmd FileType java setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" JavaScript
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" make
" makefiles require tabs for indentation
autocmd FileType make setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Python
" http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
autocmd FileType py setlocal textwidth=79 tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

" SQL
autocmd FileType sql setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" yaml
" yaml files require spaces for indentation
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Treat .rss files as XML
"autocmd BufNewFile,BufRead *.rss setfiletype xml

" currently .asm files are probably MIPS assembly
"autocmd BufNewFile,BufRead *.asm setlocal syntax=mips

" manually set filetype
" see :h new-filetype
"autocmd BufNewFile,BufRead *.blue set filetype=blue
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" strip trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" strip trailing whitespace on save
" NOTE
" order file extensions alphabetically
autocmd BufWritePre *.asm,*.c,*.css,*.h,*.html,*.jade,*.java,*.m,*.md,*.markdown,*.js,*.py,*.sh,*.styl,*.sql,*.txt,*.v :call <SID>StripTrailingWhitespaces()

" map the <SID>StripTrailingWhitespaces function to a shortcut
"nnoremap <silent> ,s :call <SID>StripTrailingWhitespaces()<CR>
nnoremap ,w :call <SID>StripTrailingWhitespaces()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" custom shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open a new tab with t
" note the trailing space in the command
nnoremap t :tabedit 

" toggle spell checking
" http://vim.wikia.com/wiki/Toggle_spellcheck_with_function_keys
nnoremap ,s :setlocal spell!<CR>


""" Greek input and spell checking
" press Ctrl-^ or Ctrl-6 to switch between Greek and the default input mode
function! <SID>GreekInputSpellChecking()
    setlocal keymap=greek_utf-8
    setlocal spell spelllang=en,el
endfunction
function! <SID>EnglishInputSpellChecking()
    setlocal keymap=
    setlocal spell spelllang=en,el
endfunction
"nnoremap ,g :call <SID>GreekInputSpellChecking()<CR>
"nnoremap ,e :call <SID>EnglishInputSpellChecking()<CR>
nnoremap ,g :setlocal keymap=greek_utf-8<CR>:setlocal spell spelllang=en,el<CR>
nnoremap ,e :setlocal keymap=<CR>:setlocal spell spelllang=en,el<CR>
nnoremap ,h :setlocal keymap=greek_utf-8<CR>:setlocal spell spelllang=el<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" create parent directories on save
" http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END


""" use the mouse in gvim
if has("gui_running")
    " click to enter insert mode
    " http://stackoverflow.com/questions/5919187/edit-gvim-mouse-buttons
    nmap <LeftMouse> <LeftMouse>i
    " full desktop shortcuts
    " http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
    "source $VIMRUNTIME/mswin.vim
endif


" NERDTree show hidden files
let NERDTreeShowHidden=1


""" open folds when opening a file
" http://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file/8316817#8316817
au BufRead * normal zR


""" from "Vim as a Python IDE"
" also http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/
" http://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-using-vim/10979533#10979533
set clipboard=unnamedplus
