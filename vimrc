"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                  for pathogen.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on

iabbrev pdb import ipdb;ipdb.set_trace()


""""""""""""""""""""""""""""""""""""""""
"
"             paste
"
""""""""""""""""""""""""""""""""""""""""
" for insert mode
set pastetoggle=<f2>


" indent
set autoindent
"set foldmethod=indent
"zi 打开关闭折叠
"zv 查看此行
"zm 关闭折叠
"zM 关闭所有
"zr 打开
"zR 打开所有
"zc 折叠当前行
"zo 打开当前折叠
"zd 删除折叠
"zD 删除所有折叠


""""""""""""""""""""""""""""""""""""""""
"
""       tComment
"
"""""""""""""""""""""""""""""""""""""""""
" Use Ctrl-c to comment and uncomment, cool
map <c-c> gcc


""""""""""""""""""""""""""""""""""""""""
"
""             ack
"
"""""""""""""""""""""""""""""""""""""""""
" sudo apt-get install ack-grep, on ubuntu box
map ,k :Ack <cword><ENTER>
let g:ackprg="ack-grep -H --nocolor --nogroup --column"


""""""""""""""""""""""""""""""""""""""""
"
"             filetype
"
""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin on
filetype indent on
set filetype=py

autocmd FileType help set ma 
autocmd FileType help set noreadonly
autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc
autocmd FileType python setlocal et sta sw=4 sts=4


""""""""""""""""""""""""""""""""""""""""
"
"             buffers
"
""""""""""""""""""""""""""""""""""""""""
" in order to switch between buffers
" with unsaved change 
set hidden
map <Tab> :bn<CR>
map ,b :bp<cr>
map ,d :bd<cr>


""""""""""""""""""""""""""""""""""""""""
"
""             Search
"
"""""""""""""""""""""""""""""""""""""""""
" ic also has effect on dictionary settings
 set ic
"set hlsearch
set incsearch
set smartcase
set ignorecase



""""""""""""""""""""""""""""""""""""""""
"
"             Doxygen
"
""""""""""""""""""""""""""""""""""""""""
" highlight the doxygen comments
" used with DoxygenToolkit.vim
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_authorName="charles, charlesdong199@gmail.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

""""""""""""""""""""""""""""""""""""""""
"
"             NERDtree
"
""""""""""""""""""""""""""""""""""""""""
map ,n :NERDTreeToggle<CR>
let NERDTreeChDirMode=2  "选中root即设置为当前目录
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号


""""""""""""""""""""""""""""""""""""""""
"
"             quit quickly
"
""""""""""""""""""""""""""""""""""""""""
map ,f :q!<CR>


""""""""""""""""""""""""""""""""""""""""
"
"             vimrc editing 
"
""""""""""""""""""""""""""""""""""""""""
" I need a fake ~/.vimrc: runtime vimrc
" http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
map ,e :e ~/.vim/vimrc<CR>
" When vimrc is edited, reload it
" copied from http://amix.dk/vim/vimrc.html
autocmd! bufwritepost vimrc source ~/.vim/vimrc


""""""""""""""""""""""""""""""""""""""""
"
"            quick escape  
"
""""""""""""""""""""""""""""""""""""""""
" set quick escape from insert mode, and now I can go without arrow keys and
" use j and k to move around in insert mode
imap JJ <esc>
imap jj <esc>


""""""""""""""""""""""""""""""""""""""""
"
"             wildmode
"
""""""""""""""""""""""""""""""""""""""""
" use <C-D> with this to get a list
set wildmenu


""""""""""""""""""""""""""""""""""""""""
"
"             tabbing 
"
""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4


""""""""""""""""""""""""""""""""""""""""
"
"             status line
"
""""""""""""""""""""""""""""""""""""""""
set statusline=%F:\ %l
set laststatus=2

""""""""""""""""""""""""""""""""""""""""
"
"             misc
"
""""""""""""""""""""""""""""""""""""""""
"ve nice $ sign when you use `cw`
set cpoptions+=$

" Do not know how to use autocmd yet, so the following line not working
" autocmd FileType text setlocal textwidth=78
set textwidth=78


" get rid of the silly characters in window separators
set fillchars=""

" hello-world is now one world
set isk+=-

" change cwd to current buffer
nmap <silent> ,cd :lcd %:h<CR>


colorscheme github 

autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate


"jedi settings
let g:jedi#show_function_definition = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#autocompletion_command = "<c-n>"


"superTab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


"ctrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rca'
let g:ctrlp_open_multiple_files = 'v'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.svn,.git*,*pyc     " Linux/MacOSX
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git)$',
            \ 'file': '\v\.(log|jpg|png|jpeg)$',
            \ }

let g:snips_author='Charles Dong'
let g:solarized_termcolors=256
