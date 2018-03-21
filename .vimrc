execute pathogen#infect()
" Basic Settings ------------------------- {{{

syntax enable
filetype plugin indent on 
set tabstop=2 shiftwidth=2 expandtab
set autoindent

"change <Leader> from \ to ,
let mapleader=","
let maplocalleader = "\\"

" set colorscheme
colorscheme railscasts
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" turn off highlighting
highlight Special NONE
set number		"show line numbers

" better window switching
" add a _ after last <c-w> to make windows minimize on switch
nnoremap <c-j> <c-w>j<c-w>_
nnoremap <c-k> <c-w>k<c-w>_
nnoremap <c-h> <c-w>h<c-w><esc>
nnoremap <c-l> <c-w>l<c-w><esc>
"set winheight=10
set winminheight=0

" show long lines in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" turn off word wrap
set nowrap

" open a file with all folds closed
let foldlevelstart=0

" set search highlighting options
set hlsearch incsearch
" }}}
" Makefile Settings {{{
augroup filetype_make
  autocmd!
  autocmd FileType make setlocal noexpandtab
augroup end
"  }}}
" Syntastic Plugin Settings {{{

" i came across a problem getting syntastic to work
" on a javascript file, i removed syntax enable then
" added it back and it worked
"let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_checkers=['jshint']
"let g:syntastic_javascript_eslint_exec='/home/jordan/.nvm/versions/node/v12.3.0/bin/eslint'
let g:syntastic_javascript_jshint_exec='/home/jordan/.nvm/versions/node/v9.3.0/bin/jshint'
"let g:syntastic_javascript_eslint_exec='$(npm bin)/eslint'
let g:syntastic_css_checkers=['csslint']
let g:syntastic_css_csslint_exec='/home/jordan/.nvm/versions/node/v9.3.0/bin/csslint'


"add include paths in .syntastic_c_config file
"let g:syntastic_c_check_header = 1
"let g:syntastic_coffee_checkers=['coffeelint']
"let g:syntastic_javascript_jshint_exec='home/jordan/.nvm/v5.5.0/bin/coffeelint'

" add bootstrap file in sass load path
let g:syntastic_scss_sass_args="--load-path /var/lib/gems/2.1.0/gems/bootstrap-sass-3.2.0.0/assets"
"}}}
" Mappings {{{

" uppercase word in insert mode
inoremap <c-u> <esc>viwU<esc>ea

" run gulp with :G
command! G Dispatch! gulp 

" shortcut for editing .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>

" shortcut for sourcing .vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" shortcut for NERDTree
:nnoremap <leader>t :NERDTreeToggle<cr>

" shortcut for erb brackets
:inoremap <leader>e <%=  %><esc>hhi

" shortcut for end of line in insert mode
:inoremap <c-e> <esc>$a

" shortcut to move forward one char in insert mode
:inoremap <c-f> <esc>la

" shortcut to move backward one char in insert mode
:inoremap <c-b> <esc>i

"shortcut for executing macro on letter d
:nnoremap <leader>f @d

" toggle folds with spacebar
nnoremap <space> za

"open previous buffer to the right of current
nnoremap <leader>rr :execute "rightbelow vsplit ". bufname("#") <cr>

" automatically insert the \v whenever you begin a search
nnoremap / /\v

" map <c-l> to redraw the screen
nnoremap <s-l> :redraw! <cr>

" map Y to yank to system clipboard
vmap <s-y> "+y

" map P to paste from system clipboard
nnoremap <s-p> "+p

"}}}
" Closetag Plugin Settings {{{

let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

" }}}

" run make silently with :M
command! M Dispatch make

" run rake test with :R
command! R Dispatch bundle exec rake test
" development environment for advanced-metronome debug tool
"autocmd BufWrite * Dispatch exec ruby %
"nnoremap <enter> :ccl<cr>
"
" Vimscript file settings ------------------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup end
"}}}

let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'
