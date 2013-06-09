"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                  for pathogen.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => General Abbrevs
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ia xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"      Cope
"      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
" can be used with vimgrep or anything in quickfix
map ,cc :botright cope<cr>
map ,cn :cn<cr>
map ,cp :cp<cr>
iabbrev pdb import ipdb;ipdb.set_trace()
imap <c-d> <esc>ddi


""""""""""""""""""""""""""""""""""""""""
"
"             paste
"
""""""""""""""""""""""""""""""""""""""""
" for insert mode
set pastetoggle=<f2>
"set autoindent"
"set foldmethod=indent"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          Spell checking
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map ,ss :setlocal spell!<cr>


""""""""""""""""""""""""""""""""""""""""
"
"             filetype
"
""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin on
" filetype indent on
set filetype=py


""""""""""""""""""""""""""""""""""""""""
"
"             note-taking
"
""""""""""""""""""""""""""""""""""""""""
" with Vim helptags and git, store things 
" $VIMRUNTIME/doc
" NOTE: NO ":" in the following line, stange but works
autocmd FileType help set ma 
autocmd FileType help set noreadonly
autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc
filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4


""""""""""""""""""""""""""""""""""""""""
"
"             brower
"
""""""""""""""""""""""""""""""""""""""""
" NOW Browser() only works for lines containing nothing but the link
" refer to http://vim.wikia.com/wiki/VimTip306 
function! Browser ()
    let line = getline (".")
    "  let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
    exec "!firefox ".line
endfunction
map ,w :call Browser ()<CR>



""""""""""""""""""""""""""""""""""""""""
"
"             buffers
"
""""""""""""""""""""""""""""""""""""""""
" in order to switch between buffers
" with unsaved change 
set hidden
" I just use <Tab> to do buffernext, but need to make sure I am in Normal Mode
" Taglist.vim use <Tab> in nomal mode for jumping among different filename in 
" its own window, but I do not feel uncomfortable about this 
map <Tab> :bn<CR>
map ,b :bp<cr>
map ,d :bd<cr>


""""""""""""""""""""""""""""""""""""""""
"
""             Search
"
"""""""""""""""""""""""""""""""""""""""""
" ic also has effect on dictionary settings
" set ic
set hlsearch
set incsearch
set smartcase
set ignorecase

""""""""""""""""""""""""""""""""""""""""
"
"             taglist
"
""""""""""""""""""""""""""""""""""""""""
map ,l :Tlist<CR>
map ,t :TaskList<CR>
map ,v :vsplit 
map ,o :only<CR>
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 


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
" before I use <S-ZZ> to quit, this has the danger of unexpectedly
" save some garbage editing, so I have a safer way now as below
"map ,, :q<CR>
" force quit
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


""""""""""""""""""""""""""""""""""""""""
"
"             status line
"
""""""""""""""""""""""""""""""""""""""""
"set statusline=%F:\ %l

" tell VIM to always put a status line in, even if there is only one window
" this means I can also see what is the filename I am in, finally!
set laststatus=2

""""""""""""""""""""""""""""""""""""""""
"
"             misc
"
""""""""""""""""""""""""""""""""""""""""
" have nice $ sign when you use `cw`
set cpoptions+=$

" Do not know how to use autocmd yet, so the following line not working
" autocmd FileType text setlocal textwidth=78
set textwidth=78

" input abrevation 
iab frm from 
" set number for doing diffs and folding
"set nu
" Show the current command in the lower right corner
set showcmd
" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
" set scrolloff=8

" Allow the cursor to go in to "invalid" places
" set virtualedit=all

" get rid of the silly characters in window separators
set fillchars=""
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936

" Highlight all instances of the current word under the cursor
" nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>
" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>

""""""""""""""""""""""""""""""""""""""""
"
"             test stuff
"
""""""""""""""""""""""""""""""""""""""""
nnoremap <c-e> ,
vnoremap <c-e> ,
colorscheme github 

let $Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set omnifunc=pythoncomplete#Complete\

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
