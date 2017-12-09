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

" turn off highlighting
highlight Special NONE
set number		"show line numbers

" better window switching
nnoremap <c-j> <c-w>j<c-w>_
nnoremap <c-k> <c-w>k<c-w>_
nnoremap <c-h> <c-w>h<c-w><esc>
nnoremap <c-l> <c-w>l<c-w><esc>
set winminheight=0

" show long lines in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" turn off word wrap
set nowrap

" open a file with all folds closed
set foldlevelstart=0
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
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_jshint_exec='/home/jordan/.nvm/v5.5.0/bin/jshint'
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

"shortcut for executing macro on letter d
:nnoremap <leader>f @d

" toggle folds with spacebar
nnoremap <space> za

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
