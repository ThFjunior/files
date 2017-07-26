"plugins {{{
function! UpdateRemote(arg)
  UpdateRemotePlugins
endfunction
call plug#begin('~/.local/share/nvim/site/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': function('UpdateRemote') }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'gabesoft/vim-ags'
Plug 'dyng/ctrlsf.vim'
Plug 'bcicen/vim-vice'
Plug 'tpope/vim-rsi'
Plug 'w0rp/ale'
Plug 'whatyouhide/vim-gotham'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()
"}}}
" displaying text""{{{
set scr=15
set so=0
set wrap
set lbr
set brk=\ ^I!@*-+;:,./?
set fcs=vert:\|,fold:\ 
set ch=2
" set columns=153
" set lines=83
set window=52
set wd=0
set nolist
" set lcs=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set nu
set nuw=4"
"}}}
" syntax, highlighting & spelling""{{{
set background=dark
syntax enable
set is
set hls
set nocuc
set nospell
"}}}
" multiple windows"{{{
:set statusline=%<%f\ (%{&ft})\ (%{&enc})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
set ea
set ead=both
set nohid
"}}}
" autocommands"{{{
augroup thf
au! thf
au thf winenter * execute "syntax on"
au thf  bufenter *  execute "chdir ".escape(expand("%:p:h"), ' ')
" au thf bufenter * silent! lcd %:p:h
" au thf bufnewfile, bufread *.csv setfiletype csv
au thf bufnewfile, bufread *.php setfiletype php.html | :ultisnipsaddfiletypes php.html | :set fdm=indent
" au thf bufnewfile, bufread #.vim, *.txt set fdm=indent
au thf bufenter *.rb set fdm=syntax
" end autocommands"}}}
" improve rtp "{{{
echo $OSTYPE
if $OSTYPE == "linux-gnu"
set rtp-=/root/.config/nvim
set rtp-=/root/.config/nvim/after
set rtp+=/home/thf/.config/nvim
set rtp+=/home/thf/.config/nvim/UltiSnips
endif"}}}

" Load local config if exists
if filereadable(expand("/home/thf/.config/nvim/local.vim"))
  source /home/thf/.config/nvim/local.vim
endif

if filereadable(expand("/home/thf/.config/nvim/thf.vim"))
  source /home/thf/.config/nvim/thf.vim
  " echom "thf.vim is loaded."
endif

let g:python3_host_prog = '/usr/bin/python'

set clipboard+=unnamedplus
set number
set hidden
set ic
set autowrite
 
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set novisualbell

if $TERM == 'linux'
    colorscheme gotham
else
    colorscheme gotham256
    " colorscheme desert
endif


" mappings {{{
let mapleader = ","
tnoremap <c-g> <c-\><c-n><c-w>w
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>

imap <c-l><c-l> <space>=><space>
imap <c-l> ->
nnoremap <leader><leader> <c-^>
nnoremap ' `
nnoremap ` '

command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

nnoremap : ;
nnoremap ; :
map Y y$
" nmap K :exe 'help '.<CWORD>
inoremap kj <ESC>
" inoremap kj <ESC>
inoremap jj <C-O>a
inoremap kk <C-O>o
" ; (ѕemicolon) instead of : (colon) because the second has been remapped to " the first ;
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" nnoremap <CR> :nohlsearch<CR>
nnoremap <Leader>e :edit ~/.config/nvim/init.vim<CR>
nnoremap <Leader>s :source ~/.config/nvim/init.vim<CR>
" nmap H 5h
" nmap L 5l
" nmap J 5j
" nmap K 5k
" vmap J 5j
" vmap K 5k
" vmap H 5h
" vmap L 5l
"
" make the command mode less annoying
" cnoremap <C-j> <t_kd>
" cnoremap <C-k> <t_ku>
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-d> <Del>

nnoremap <leader>c :copen<cr>
nnoremap <leader>l :lopen<cr>
nnoremap <leader>E :Errors<cr>
nnoremap <leader>C :cclose<cr>

" Borrowed from vimcasts, super useful
" Bubble single lines
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]


" }}}
" mappings "{{{
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <right> <nop>
" nnoremap <left> <nop>

" nnoremap <Leader>e :edit ~/.config/nvim/init.vim<CR>
" nnoremap <Leader>s :source ~/.config/nvim/init.vim<CR>
" nnoremap <leader>y :syntax on<CR>
" nnoremap Q :tabl<CR>

" imap kk <c-o>o
" imap jj <c-o>a
" imap <c-l><c-l> <space>=><space>
" imap <c-l> ->
" nnoremap <leader><leader> <c-^>
" nnoremap ' `
" nnoremap ` '

" command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>


" nnoremap : ;
" nnoremap ; :
" map Y y$
" " nmap K :exe 'help '.<CWORD>
" inoremap jk <ESC>
" inoremap kj <ESC>
" inoremap <C-CR> <C-O>a
" inoremap <S-CR> <C-O>o
" " ; (ѕemicolon) instead of : (colon) because the second has been remapped to
" " the first ;
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set showbreak=↪
" cnoremap <C-j> <t_kd>
" cnoremap <C-k> <t_ku>
" cnoremap <C-b> <Left>
" cnoremap <C-f> <Right>
" cnoremap <C-a> <Home>
" cnoremap <C-e> <End>
" imap <F2> "*y
" nnoremap <CR> :nohlsearch<CR>
" " end of mappings "}}}
"moving around, searching & patterns"{{{
" set autochdir
set ignorecase
set smartcase
" for C++
set define=^\\(#\\s*define\\|[a-z]*\\s*const\\s*[a-z]*\\)
" set include=
" set inex=""}}}


set guifont=Consolas:h11
" set guifont=Menlo\ Regular:h16
set encoding=utf-8

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

set showmatch
set incsearch

set nobackup
set noswapfile
set nowritebackup
set backupdir=P:\vimtmp
set directory=P:\vimtmp
set display=lastline,uhex

filetype plugin indent on

" set shell=/bin/bash
" !export PATH=$PATH:/usr/local/thf

set number
" set relativenumber
" autocmd InsertEnter * :set number | set cul
" autocmd InsertLeave * :set nonumber | set nocul

set foldmethod=marker
set nohidden

" set kp=:help
set grepprg=grep\ -nH\ $*
set vb t_vb=

if exists('guioptions')
set guioptions-=T guioptions-=m guioptions-=L guioptions-=l
guioptions-=e
guioptions-=M guioptions+=rc
endif


" Tue Sep 25 18:31:01 2012
" set digraph
" Fri Mar 15 17:05:06 2013
let g:sql_type_default = 'plsql'
"  status line"{{{
"  Wed Oct  3 16:03:27 2012 
"
" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\%P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from
"   %P percentage through buffer
"   %) end of width specification
"
"
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\%C
"col:\ %c%V\ (%P)%)"}}}

" cnoremap hha colo default<Bar>harcopy<Bar>colo desert
cnoremap <c-k> <up>
cnoremap <c-j> <down>

" change cursor shape in different modes
let &t_SI="\<Esc>[6 q"
let &t_SR="\<Esc>[4 q"
let &t_EI="\<Esc>[2 q"

" abbreviations {{{
iab ab.. <expr> printf("$s", "abcdefghijklmnopqrstuvwxyz")
iab months janv,fév,mars,avr,mai,juin,juill,août,sept,oct,nov,déc
iab <expr> dts substitute(&cms,"%s"," ","").printf("%s","Added by ThF on ").strftime("%Y-%m-%d").printf("%s","\n").printf("%s","\b\b")
cab plu /home/thf/.local/share/nvim/site/plugged
cab skl /home/thf/.config/nvim/skel
cab ult /home/thf/.config/nvim/UltiSnips
" iab <expr> dts strftime("%c")
" cab <expr> cc\ expand("%:r")."_".strftime("%Y%m%d")."_".strftime("%H%M").".".expand("%:e")
" cab DaTe %s/"\(\d\d\d\d\)\(\d\d\)"/"\1-\2-01"/
" iab RuL ----+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8----+----9----+----0
" iab months janv_fév_mars_avr_mai_juin_juil_août_sept_oct_nov_déc 
" iab pg\\ \o \p \pset format aligned \q
" cnorea \\dd %s/,\(\d\d\) \(\d\d\) \(\d\d\d\d\)/,\3-\2-\1/g
"}}}
" autocommands"{{{
augroup thf
au! thf
au thf BufEnter __CtrlSF__ nunmap <CR>
au thf BufEnter /home/thf/.X* set cms=!\ %s
autocmd thf WinEnter KSE22A*.log :normal Gzt
au thf  BufEnter *  execute "chdir ".escape(expand("%:p:h"), ' ')
" au thf BufEnter * silent! lcd %:p:h
au thf BufNewFile, BufRead *.csv setfiletype csv
" au thf BufNewFile, BufRead *.php setfiletype php.html |:UltiSnipsAddFileTypes php.html | :set fdm=indent
au thf BufNewFile, BufRead #.vim, *.txt set fdm=indent
au thf BufEnter *.rb set fdm=syntax
au thf BufLeave *.rb set fdm=marker
au thf FileType help set nu
au thf BufEnter *.txt call Set_nu()
" end autocommands"}}}
" functions "{{{
" function! Browser ()
" let line = getline (".")
" let line = matchstr (line, "http[^   ]*")
" exec "!safari ".line
" endfunction
" end functions "}}}
" Ultisnips"{{{
let g:UltisnipsEnableSnipMate = 0
let g:UltisnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsListSnippets = ""
"}}}
" notes"{{{
let g:notes_directories=['~/notes']
"}}}
" from Ovid, integrating perlcritic and vim {{{
" set errorformat+=%m\ at\ %f\ line\ %l\.
" set errorformat+=%m\ at\ %f\ line\ %l
" noremap ,c :!time perlc --critic %<CR>
"}}}
" from Drew Neil, Oil and Vinegar. "{{{
" http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
" Fri Apr 18 17:03:32 2014
let NERDTreeHijackNetrw=1 "}}}
" vimtex {{{
let g:vimtex_enabled=1
let g:vimtex_view_method="zathura"
" }}}
" deoplete {{{
let g:deoplete#enable_at_startup=1
" }}}
" ale{{{
let g:ale_enabled=0
"}}}
" CtrlSF
let g:ctrsf_ackprg='/usr/bin/ag'

set dictionary=/usr/share/dict/words
set novisualbell
set secure
