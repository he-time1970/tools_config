" 下面是vim的配置信息
let mapleader=" "
set nocompatible
set encoding=utf-8

set number
set norelativenumber

set hlsearch
exec "nohlsearch"
set incsearch

set ignorecase
set smartcase

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set backspace=2
set autoindent

set laststatus=2 "可以显示隐藏的状态栏


syntax on

set ruler
set showmode
set showcmd
set cursorline
set wildmenu
set wrap

set ts=4
set expandtab
set tabstop=4
set softtabstop=4
set cindent
set shiftwidth=4
%retab!

colorscheme elflord

map s :<nop>
map S :w<CR>
map Q :q<CR>
map re :source $MYVIMRC<CR>
" 标签叶处理
map tu :tabe<CR>
map tn :tabnext<CR>
map tp :tabprevious<CR>
map tc :tabclose<CR>
" 快速移动
map <c-h> 7h
map <c-j> 5j
map <c-k> 5k
map <c-l> 7l
" 窗口移动
map <leader>h <c-w>h
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>l <c-w>l
map ws :split<CR>
map wv :vsplit<CR>
map wc :close<CR>
map <up> :resize -5<CR>
map <down> :resize +5<CR>
map <left> :vertical resize +5<CR>
map <right> :vertical resize -5<CR>
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" cscope settings
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb

    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out

    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif
let cs_auto_jump = 0
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>:copen<CR>



" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
    " 目录树插件
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " 状态栏插件
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " vim 主题色彩插件
    Plug 'connorholyday/vim-snazzy'

    "Plug 'junegunn/goyo.vim' " distraction free writing mode

    
    Plug 'majutsushi/tagbar'


    " 代码补全插件
    " Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
    " 唉，ycm要求vim的版本必须是8.*
    " 使用snippets代码补全
    Plug 'honza/vim-snippets'
    "Plug 'SirVer/ultisnips'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " 可视化缩进
    Plug 'Yggdroot/indentLine'

    " 注释插件
    Plug 'scrooloose/nerdcommenter'

    " 括号高亮插件
    Plug 'luochen1990/rainbow'

    " markdown实时预览插件
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " 多光标编辑
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}   


" Initialize plugin system
call plug#end()

" 括号高亮插件配置
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" 注释插件配置
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0
 
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
 
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
 
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
 
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
 
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
 
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
 
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" 可视化缩进配置
let g:indent_guides_guide_size=1  " 指定对齐线的尺寸
let g:indent_guides_start_level= 2  " 从第二层开始可视化显示缩进

" 主题vim颜色配置
"let g:SnazzyTransparent = 1
"color snazzy

" 状态栏目的配置
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" goyo 的配置，没怎么用
" ===
" === Goyo
" ===
"map <LEADER>gy :Goyo<CR>

"tagbar
nmap tr :TagbarToggle<CR> 
nmap tq :TagbarClose<CR>
let g:tagbar_ctags_bin = 'ctags'
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

"tb触发，设置宽度为30
let g:tagbar_width = 30
"nmap tb :TagbarToggle<CR>
""开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0


" 下面是nerdtree的配置信息
" 将tt设置为开关NERDTree的快捷键
map tt :NERDTreeToggle<CR>
" 目录数在多个tab间共享，具体看help nerdtree中的说明
map mi :NERDTreeMirror<CR>
" 修改树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾' 
" 窗口位置
let g:NERDTreeWinPos='left'
" 窗口尺寸
let g:NERDTreeSize=30
" 窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
" 不显示隐藏文件
let g:NERDTreeHidden=0
" 打开vim时如果没有文件自动打开NERDTree
" Start NERDTree when Vim is started without file arguments.
autocmd stdinreadpre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" 当NERDTree为剩下的唯一窗口时自动关闭
" Exit Vim if NERDTree is the only window left.
autocmd bufenter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" 打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree
" 这个是和nerdtree-get-plugin插件配合显示git代码仓库的变化情况
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusPorcelainVersion=1
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
"let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

" 下面是插件补全的配置
" Trigger configuration. You need to change this to something other than <tab>
" if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

"markdown键位映射
nmap  m :MarkdownPreview<CR>
nmap  mm :MarkdownPreviewStop<CR>
nmap  mk :MarkdownPreviewToggle<CR>
