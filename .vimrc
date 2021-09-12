if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

"""""""""""""""""""""""""""""""自定义配置""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=";"       "将leader键设置为分号，默认为\

call plug#begin('~/.vim/plugged')

"YCM不能在此更新，更新后需要重新编译
Plug 'Valloric/YouCompleteMe' 

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'lfv89/vim-interestingwords'
Plug 'airblade/vim-gitgutter'
Plug 'chun-yang/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'yggdroot/leaderf'
Plug 'mhinz/vim-signify'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'shougo/echodoc.vim'
Plug 'dense-analysis/ale'
"Plug 'shougo/defx.nvim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'

"主题
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'KeitaNakamura/neodark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'

call plug#end()

"""""""""""""""主题"""""""""""""
syntax on
set t_Co=256
set termguicolors

""还行
""let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
"let g:material_terminal_italics = 1 	"斜体
""let g:material_theme_style = 'ocean-community'
"colorscheme material

"set background=dark " for the dark version
"colorscheme one"

"这个还行
"set background=dark
"colorscheme gruvbox
"let g:gruvbox_contrast_light="light"
"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_improved_warnings=1

"neodark
" let g:neodark#background = '#202020'
" let g:neodark#use_256color = 1
" "背景色
" "let g:neodark#terminal_transparent = 1  "打开的话高亮看不清
" ""分屏边框实线
" "let g:neodark#solid_vertsplit = 1
" colorscheme neodark

""solarized
"set background=dark
"autocmd vimenter * ++nested colorscheme solarized8
set background=dark
"set background=light
"colorscheme solarized8
"colorscheme solarized8_high
"colorscheme solarized8_low
colorscheme solarized8_flat


"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme= 'onedark'
" let g:airline_theme= 'solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tabline#enabled = 1
set nu rnu
" set nu
set wildmenu
set wrap
set smartindent
set nocompatible
set incsearch
set hlsearch
set noerrorbells
set backspace=indent,eol,start
set laststatus=2
set nowritebackup
set expandtab
nnoremap <F12> :set mouse=<CR>
nnoremap <F11> :set mouse=a<CR>
nnoremap <F10> :set nopaste<CR>
nnoremap <F9> :set paste<CR>
"set selection=exclusive
set selectmode=mouse,key
set tabstop=4
set softtabstop=4
set shiftwidth=4
set fileencodings=utf-8,gbk,cp936,cp950,latin1
set encoding=utf-8
set showcmd
set ruler
set noshowmode
set scrolloff=3
filetype plugin indent on
"set listchars=tab:>-,trail:-
set autoindent
set showmatch
" set autowriteall
"set autoread
set timeoutlen=3000
set updatetime=100
"language messages zh_CN.utf-8
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  "在注释行上下插入行不会自动插入注释字符
set cursorline                          "高亮当前行
"set cursorcolumn                        "高亮当前列
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

"YCM
let g:ycm_global_ycm_extra_conf = '.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_server_log_level = 'info'
set completeopt=longest,menu,menuone,popup
let g:ycm_add_preview_to_completeopt = 1			"自动弹出函数原型
let g:ycm_complete_in_comments = 1 					"在注释输入中也能补全
let g:ycm_complete_in_strings = 1 					"在字符串输入中也能补全
let g:ycm_confirm_extra_conf=0 						"关闭加载.ycm_extra_conf.py提示
let g:ycm_min_num_of_chars_for_completion=2 		"从第2个键入字符就开始罗列匹配项
let g:ycm_seed_identifiers_with_syntax=1 			"语法关键字补全
let g:ycm_collect_identifiers_from_tags_files=1 	"开启 YCM 基于标签引擎
let g:ycm_auto_trigger=1							"开启语义补全
let g:ycm_key_list_stop_completion = ['<C-y>']    	"设置用于关闭补全列表的快捷键，默认为ctrl+y
let g:ycm_key_invoke_completion = '<C-s>'		    "设置强制启用语义补全的快捷键
let g:ycm_filepath_completion_use_working_dir = 0 	"设置YCM的文件名补全时，相对路径是按照vim的当前工作目录还是活动缓冲区中的文件所在目录来解释。0是按照文件所在目录
let g:ycm_cache_omnifunc=1 							"某些omni补全引擎引起与YCM缓存不适配，可能不会为给定的前缀产生所有可能的结果，如果关闭该选项则每次都重新查询omni补全引擎生成匹配项 ，默认为1代表开启
let g:ycm_use_ultisnips_completer = 1				"启用ultisnips补全，1代表允许

let g:ycm_show_diagnostics_ui = 1					"开启YCM的显示诊断信息的功能，0表示关闭
let g:ycm_enable_diagnostic_signs = 1				"在代码中高亮显示YCM诊断对应的内容，如果关闭，则会关闭错误和警告高亮功能，0表示关闭
let g:ycm_enable_diagnostic_highlighting = 0		"高亮显示代码中与诊断信息有关的文本或代码，0表示关闭
let g:ycm_echo_current_diagnostic = 1				"当光标移到所在行时显示诊断信息
let g:ycm_always_populate_location_list = 0		    "每次获取新诊断数据时自动填充位置列表，1表示打开，默认关闭以免干扰可能已放置在位置列表中的其他数据
let g:ycm_key_detailed_diagnostics = '<leader>d'	"设置查看光标停留处的错误诊断详细信息的快捷键,默认为\d
let g:ycm_auto_hover = ''                           "关闭光标静止弹出原型
let g:ycm_max_diagnostics_to_display = 0            "诊断数量无上限
"手动弹出原型
nmap <leader>D <plug>(YCMHover)

"光标下标识符的重命名
nnoremap <leader>rn :YcmCompleter RefactorRename 
"函数列表 关闭ycm自带的打开quickfix，用copen 打开 并将窗口移到左边显示 (ycm自动打开的quikfix在跳转的时候会自动关闭)
"nnoremap <leader>fl :YcmCompleter GoToDocumentOutline<CR> <c-w>w :copen<CR> <c-w>L
"nnoremap <leader>fl :YcmCompleter GoToDocumentOutline<CR>
""跳转到定义或声明
"nnoremap <c-h> :YcmCompleter GoToDefinitionElseDeclaration<CR>
""跳转到实现
nnoremap <c-k> :YcmCompleter GoTo<CR>
"更准确，点性能不如GoTo，python不支持
"nnoremap <c-h> :YcmCompleter GoToImprecise<CR>

"跳转到引用, 关闭ycm自带的打开quickfix，用copen 打开 并将窗口移到上方显示 (ycm自动打开的quikfix在跳转的时候会自动关闭)
"nnoremap <c-q> :YcmCompleter GoToReferences<CR><c-w>w :copen<CR> <c-w>K
nnoremap <c-q> :YcmCompleter GoToReferences<CR>

let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
"语义补全触发条件
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl,shell,sh,py': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

let g:ycm_filetype_whitelist = { 
			\ "c":1,
            \ "cpp":1, 
            \ "objc":1,
			\ "sh":1,
			\ "python":1,
			\ "go":1,
			\ "make":1,
            \}


"弹窗配色
"highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
"highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

"nerdcommenter
"快速注释
let g:NERDCreateDefaultMappings = 1             "创建默认的映射
let g:NERDSpaceDelims = 1                       "默认情况下在注释分隔符后添加空格 
let g:NERDCompactSexyComs = 1                   "使用紧凑的语法来修饰多行注释
let g:NERDDefaultAlign = 'left'                 "按行对齐的注释分隔符左对齐，而不是按照代码缩进对齐
let g:NERDCommentEmptyLines = 1                 "允许注释和反转空行(在注释区域时很有用)
let g:NERDTrimTrailingWhitespace = 1            "当取消注释时，允许删除尾随空格
let g:NERDToggleCheckAllLines = 1               "启用NERDCommenterToggle来检查所有选中的行是否被注释


"vim-interestingwords   高亮单词
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

"gtags
set cscopetag                           "使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'            "使用 gtags-cscope 代替 cscope
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/gtags/share/gtags/gtags.conf'

"gutentags 
"搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
""同时开启 ctags 和 gtags 支持：
"let g:gutentags_modules = []
"if executable('ctags')
"    let g:gutentags_modules += ['ctags']
"endif
"if executable('gtags-cscope') && executable('gtags')
"    let g:gutentags_modules += ['gtags_cscope']
"endif
let g:gutentags_modules = ['gtags_cscope']
"将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

"禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

"gutentags_plus
let g:gutentags_plus_nomap = 0      "使用默认的快捷键，将源码中定义的c键改为g键
"   ;ga 查找此符号的赋值
"   ;gc 查找调用此函数的函数
"   ;gd 查找由该函数调用的函数
"   ;ge 查找egrep模式，相当于egrep功能，但查找速度快多了
"   ;gf 查找光标下的文件
"   ;gg 查看光标下符号的定义
"   ;gi 查找哪些文件 include 了本文件
"   ;gs 查看光标下符号的引用
"   :gt 查找此文本字符串

"leaderf
let g:Lf_HideHelp = 1
let g:Lf_ShortcutF = "<c-p>"
"当前打开的buffer
let g:Lf_ShortcutB = '<c-y>'
"最近打开的文件
noremap <c-h> :LeaderfMru<cr>
"函数搜索
noremap <c-t> :LeaderfFunction!<cr>
" noremap <leader>fh :<C-U><C-R>=printf("LeaderfFunction! %s", "")<CR><CR>
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
"当前项目目录打开文件搜索
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"vim-preview
"滚动预览窗口
noremap <c-m> :PreviewScroll -1<cr>
noremap <c-n> :PreviewScroll +1<cr>
" inoremap <c-m> <c-\><c-o>:PreviewScroll -1<cr>
" inoremap <c-n> <c-\><c-o>:PreviewScroll +1<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
" noremap <F4> :PreviewSignature!<cr>
" inoremap <F4> <c-\><c-o>:PreviewSignature!<cr>

"vim-gitgutter
"let g:gitgutter_map_keys = 0                            "不映射任何键
"nnoremap <F2> :GitGutterLineHighlightsToggle<CR>        "打开/关闭高亮行

"vim-signify
"git 状态栏
set signcolumn=yes          "强制显示侧边栏

""ALE
"Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
" let g:ale_sign_warning = 'Ψ'
" nmap <silent> <C-u> <Plug>(ale_previous_wrap)
" nmap <silent> <C-d> <Plug>(ale_next_wrap)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
"let g:ale_hover_cursor = 0
"Set this if you want to.
"This can be useful if you are combining ALE with
"some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
"Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
"Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
""You can disable this option too
""if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0

let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']

let g:ale_linters = {
\   'python': ['flake8'],
"\   'python': ['pyflakes'],
"\   'python': ['pylint'],
\}

"支持python2语法检测
let g:ale_python_flake8_executable = 'python'
"let g:ale_python_flake8_executable = 'python3'
"let g:ale_python_flake8_options = '-m flake8 --max-line-length=100 ' .
      "\ '--max-complexity=10 --ignore=E111,E114,E121,E125,E126,E127,E128,E129,E131,E133,E201,E202,E203,E211,E221,E222,E241,E251,E261,E303,E402,W503,E302,E305,E501'
let g:ale_python_flake8_options = '-m flake8 --max-complexity=10 --ignore=E501,E302,E305,F401,F841,E301,E731,E306,E722,E265,C901,E231,W391,E261,E262,'










