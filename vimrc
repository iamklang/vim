" For mac os X "
filetype plugin indent on
syntax on

set t_Co=256
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
set nu "Set line number
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" Highlight search results
set hlsearch
" Ignore case when searching
set ignorecase
" Incremental search
set incsearch
" When searching try to be smart about cases
set smartcase
" Show matching brackets when text indicator is over them
set showmatch
"Save buffer automatically when changing files
set autowrite
"Always reload buffer when external changes detected
set autoread
" this enables "visual" wrapping
set wrap
" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
" Text wrapping
" set lbr
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" NerdTree
map <C-t> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs and splits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tabs
nnoremap <A-h> :tabprevious<CR>
nnoremap <A-l> :tabnext<CR>
nnoremap <silent> <leader> <A-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <leader> <A-l> :execute 'silent! tabmove ' . tabpagenr()<CR>

"Splits
" easier navigation between split windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"Remove trailing whitespace
nnoremap <silent> <leader>1 :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"Remove leading whitespace
nnoremap <silent> <leader>2 :le<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cool Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Make the 80th column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 100)

" Toggle visibility of naughty characters
" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
exec "set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~"

augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter * set list
    autocmd BufEnter *.txt set nolist
    autocmd BufEnter *.vp* set nolist
    autocmd BufEnter * if !&modifiable
    autocmd BufEnter * set nolist
    autocmd BufEnter * endif
augroup END

