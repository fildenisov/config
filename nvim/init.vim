call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'SirVer/ultisnips'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" :TSInstall <language_to_install>
Plug 'kdheepak/lazygit.nvim'
Plug 'hashivim/vim-terraform'

call plug#end()

set encoding=UTF-8
let g:onedark_style = 'deep'
colorscheme onedark
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

set number
set termguicolors
set updatetime=100

" [GOLANG] ++++++++++++++++++++++++++++++++++++++++++++++
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_auto_type_info = 1
let g:go_fillstruct_mode = 'fillstruct'
let g:go_debug_windows = {
    \ 'vars':       'rightbelow 60vnew',
    \ 'stack':      'rightbelow 10new',
    \ 'out':     'rightbelow 10new',
\ }

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
" [GOLANG] ---------------------------------------------

" [ALE] ++++++++++++++++++++++++++++++++++++++++++++++++
" Error and warning signs.
let g:ale_sign_error = '‚§´'
let g:ale_sign_warning = '‚ö†'
" [ALE] ------------------------------------------------

" [AIRLINE] ++++++++++++++++++++++++++++++++++++++++++++
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
" Don't forget set the airline theme as well.
let g:airline_theme = "sol"
" [AIRLINE] --------------------------------------------

" [SIGNIFY] ++++++++++++++++++++++++++++++++++++++++++++
" default updatetime 4000ms is not good for async update
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‚Äæ'
let g:signify_sign_change            = '!'
let g:signify_sign_change_delete     = g:signify_sign_change . g:signify_sign_delete_first_line
let g:signify_realtime 		     = 1
" [SIGNIFY] --------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" inoremap <silent><expr> <C-Down>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Down>" :
"       \ coc#refresh()
" inoremap <expr><C-Up> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf :GoFmt<CR>:GoImports<CR>
nmap <silent> gc :GoFillStruct<CR>

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" NERDTree settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

map  <C-]> :tabn<CR>
map  <C-\> :tabp<CR>
map  <S-f> :Rg<CR>

nnoremap ‚àÇ :GoDebugStart<CR>
nnoremap √ü :GoDebugStop<CR>
nnoremap ‚à´ :GoDebugBreakpoint<CR>
nnoremap √ß :GoDebugContinue<CR>
nnoremap Àú :GoDebugNext<CR>
nnoremap ‚âà :GoDebugStep<CR>

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" open file in safari
nnoremap <F5> :!open -a Safari %<CR><CR>

" Find files using Telescope command-line sugar.
:nnoremap <leader>ff <cmd>Telescope find_files<cr>
:nnoremap <leader>fg <cmd>Telescope live_grep<cr>
:nnoremap <leader>fb <cmd>Telescope buffers<cr>
:nnoremap <leader>fh <cmd>Telescope help_tags<cr>
:nnoremap <leader>ft <cmd>Telescope treesitter<cr>

" setup mapping to call :LazyGit
nnoremap <leader>gg :LazyGit<CR>

