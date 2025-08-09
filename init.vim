let mapleader = " "  " set <leader> to space

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim' " Auto Completion
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'm4xshen/hardtime.nvim' " Tells me to improve my bad vim habits
call plug#end()


nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" Telescope key mappings
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <C-j> :belowright split \| terminal<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeShowHidden=1


function! ToggleTerm()
  " If we're in a terminal, close it
  if &buftype ==# 'terminal'
    close
    return
  endif

  " Look for an existing terminal buffer
  for buf in range(1, bufnr('$'))
    if getbufvar(buf, '&buftype') ==# 'terminal'
      execute 'botright sbuffer' buf
      return
    endif
  endfor

  " If no terminal buffer exists, create one at bottom
  botright split | term
endfunction

nnoremap <leader>t :call ToggleTerm()<CR>

lua << EOF
require("hardtime").setup()
EOF

