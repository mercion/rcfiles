execute pathogen#infect()
:set nu

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

syntax on

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set hlsearch


" pylint studd
" autocmd FileType python compiler pylint

" Set the virtical colum marker
set cc=80

" Spelling
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


" Highlight Current line
set cul                                         
" hi CursorLine term=none cterm=none ctermbg=3     

" Execute pyfile
nmap <C-X> :w<CR>:silent !python\ %: > foo.op <CR>:vsplit foo.op<CR>

" tee ~/.vim/output<CR>:split ~/.vim/output<CR>:redraw!<CR>
   
filetype plugin indent off
:set nu
set tabstop=4
set shiftwidth=4
set expandtab
set title

autocmd BufWritePre *.py :%s/\s\+$//e



" Run flake8
autocmd FileType python map <C-K> :call Flake8()<CR>

execute pathogen#infect()
