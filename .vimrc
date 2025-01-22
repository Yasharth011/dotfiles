" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

if has('python')
  map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>
  imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>
elseif has('python')
  map <C-K> :py3f <path-to-this-file>/clang-format.py<cr>
  imap <C-K> <c-o>:py3f <path-to-this-file>/clang-format.py<cr>
endif

call plug#begin()

" List your plugins herePlug 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tomasr/molokai'
Plug 'nordtheme/vim'
call plug#end()

colorscheme molokai 

map <F6> :NERDTree<cr>

let g:indent_guides_enable_on_vim_startup = 1


