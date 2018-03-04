" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('w0rp/ale')
call minpac#add('christoomey/vim-run-interactive')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('christoomey/vim-tmux-runner')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')

call minpac#add('elixir-lang/vim-elixir')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('pangloss/vim-javascript')
call minpac#add('slim-template/vim-slim')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('othree/javascript-libraries-syntax.vim')
call minpac#add('othree/html5.vim')
call minpac#add('hail2u/vim-css3-syntax')
call minpac#add('mxw/vim-jsx')

call minpac#add('janko-m/vim-test')
call minpac#add('pbrisbin/vim-mkdir')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('scrooloose/nerdtree')
call minpac#add('mhinz/vim-startify')
call minpac#add('bling/vim-bufferline')

call minpac#add('ervandew/supertab')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('alvan/vim-closetag')
call minpac#add('mattn/emmet-vim')

call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')

call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
call minpac#add('zchee/deoplete-jedi')

call minpac#add('wincent/loupe')
call minpac#add('wincent/ferret')
call minpac#add('chriskempson/base16-vim')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " ALE linting events
  set updatetime=1000
  let g:ale_lint_on_text_changed = 0
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertEnter * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()

  " When in insert mode, show linear numbers
  " When not in insert mode, show current line number with relative numbers
  " And last of all, only be relative in the buffer we're editing.
  autocmd InsertLeave * set number
  autocmd InsertLeave * set relativenumber
  autocmd InsertLeave * set number
  autocmd InsertEnter * set norelativenumber
  autocmd BufLeave,FocusLost,WinLeave * set norelativenumber
  autocmd BufEnter,FocusGained,WinEnter * set relativenumber
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Prefer `ag` over `rg`.
let g:FerretExecutable='ag,rg'

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map Ctrl+e to end of line in insert mode
inoremap <C-e> <C-o>$

" Map Ctrl+a to beginning of line in insert mode
inoremap <C-a> <C-o>0

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

let g:jsx_ext_required = 0

" Deoplete stuff
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" UltiSnips configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Color schema
colorscheme base16-tomorrow-night
set termguicolors
set cursorline

" NerdCommenter configs
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>rn :call RenameFile()<cr>

" Fzf stuff
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfun

fun! s:change_branch(e)
  let res = system("git checkout " . a:e)
  :e!
  :AirlineRefresh
  echom "Changed branch to" . a:e
endfun

let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

command! Gbranch call fzf#run(
      \ {
      \ 'source': 'git branch',
      \ 'sink': function('<sid>change_branch'),
      \ 'options': '-m',
      \ 'down': '20%'
      \})

" Custom leader key map
nnoremap <Leader>pf :call FzfOmniFiles()<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>ft :NERDTreeToggle<CR>
nnoremap <Leader>ff :BLines<CR>
noremap <Leader>fs :update<CR>
