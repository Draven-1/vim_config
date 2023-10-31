" 打开文件保持在上次退出时的光标
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let mapleader=';'       "将leader键设置为分号，默认为\

call plug#begin('~/.vim/plugged')

"YCM不能在此更新，更新后需要重新编译
Plug 'Valloric/YouCompleteMe'

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'lfv89/vim-interestingwords'
Plug 'airblade/vim-gitgutter'
Plug 'chun-yang/auto-pairs'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'yggdroot/leaderf'
" Plug 'mhinz/vim-signify'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'shougo/echodoc.vim'
Plug 'dense-analysis/ale'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'leoatchina/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'drmikehenry/vim-fixkey'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" TODO  代码片段
Plug 'honza/vim-snippets'

"主题
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim', { 'branch': 'main'  }
Plug 'KeitaNakamura/neodark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'

"markdown
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'img-paste-devs/img-paste.vim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""""""""""""""主题"""""""""""""
syntax on
set t_Co=256
set termguicolors
set term=xterm-256color

""还行
""let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
"let g:material_terminal_italics = 1    "斜体
""let g:materIal_theme_style = 'ocean-community'
"colorscheme material

"set background=dark " for the dark version
"colorscheme one"

"这个还行
"set background=dark
colorscheme gruvbox
"let g:gruvbox_contrast_light="light"
"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_improved_warnings=1

"neodark
" let g:neodark#background = '#202020'
" let g:neodark#use_256color = 1
" "背景色
" "let g:neodark#terminal_transparent = 1
" "分屏边框实线
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
"colorscheme solarized8_flat

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
" set nu rnu
" set viminfo=
set nu
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
set shiftwidth=4
"set tabstop=4
set ts=4
set softtabstop=4
set expandtab
%retab!
set noundofile
set nobackup
set noswapfile
" 基于缩进进行代码折叠
" set foldmethod=indent
set foldmethod=manual
" 启动 Vim 时关闭折叠
set nofoldenable
nnoremap <F5> :set mouse=<CR>
nnoremap <F6> :set mouse=a<CR>
nnoremap <F7> :set nopaste<CR>
nnoremap <F4> :set paste<CR>
nnoremap <leader>ta :w <bar> %bd <bar> e# <bar> bd# <CR>
imap <ESC> <ESC><ESC>
"set selection=exclusive
set selectmode=mouse,key
set fileencodings=utf-8,gbk,cp936,cp950, "latin1
" set fileencodings=utf-8,gbk
set encoding=utf-8
set showcmd
set ruler
set noshowmode
set scrolloff=3
filetype plugin indent on
set listchars=tab:>-,trail:-
set autoindent
set showmatch
set timeoutlen=1500
set ttimeoutlen=5
set updatetime=100
"language messages zh_CN.utf-8
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o  "在注释行上下插入行不会自动插入注释字符
set cursorline                          "高亮当前行
"set cursorcolumn                        "高亮当前列
" 不要响铃，更不要闪屏
set visualbell t_vb=
nmap <BackSpace> :nohl<cr>
set signcolumn=yes          "强制显示侧边栏
set wildmode=longest:full,full
"set term=xterm=256color
"let g:loaded_matchparen=1

"YCM
let g:ycm_global_ycm_extra_conf = '.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_server_log_level = 'info'
" set completeopt=longest,menu,menuone,popup
set completeopt=longest,menu,popup,
let g:ycm_autoclose_preview_window_after_insertion = 0

" Disable signature help
let g:ycm_disable_signature_help = 1
let g:ycm_add_preview_to_completeopt = 1            "自动弹出函数原型
let g:ycm_complete_in_comments = 1                  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1                   "在字符串输入中也能补全
let g:ycm_confirm_extra_conf=0                      "关闭加载.ycm_extra_conf.py提示
let g:ycm_min_num_of_chars_for_completion=2         "从第2个键入字符就开始罗列匹配项
let g:ycm_seed_identifiers_with_syntax=1            "语法关键字补全
let g:ycm_collect_identifiers_from_tags_files=1     "开启 YCM 基于标签引擎
let g:ycm_auto_trigger=1                            "开启语义补全
let g:ycm_key_list_stop_completion = ['<C-y>']      "设置用于关闭补全列表的快捷键，默认为ctrl+y
let g:ycm_key_invoke_completion = '<C-s>'           "设置强制启用语义补全的快捷键
let g:ycm_filepath_completion_use_working_dir = 0   "设置YCM的文件名补全时，相对路径是按照vim的当前工作目录还是活动缓冲区中的文件所在目录来解释。0是按照文件所在目录
let g:ycm_cache_omnifunc=1                          "某些omni补全引擎引起与YCM缓存不适配，可能不会为给定的前缀产生所有可能的结果，如果关闭该选项则每次都重新查询omni补全引擎生成匹配项 ，默认为1代表开启
let g:ycm_use_ultisnips_completer = 1               "启用ultisnips补全，1代表允许

let g:ycm_show_diagnostics_ui = 1                   "开启YCM的显示诊断信息的功能，0表示关闭
let g:ycm_enable_diagnostic_signs = 1               "在代码中高亮显示YCM诊断对应的内容，如果关闭，则会关闭错误和警告高亮功能，0表示关闭
let g:ycm_enable_diagnostic_highlighting = 0        "高亮显示代码中与诊断信息有关的文本或代码，0表示关闭
let g:ycm_echo_current_diagnostic = 1               "当光标移到所在行时显示诊断信息
let g:ycm_always_populate_location_list = 0         "每次获取新诊断数据时自动填充位置列表，1表示打开，默认关闭以免干扰可能已放置在位置列表中的其他数据
let g:ycm_key_detailed_diagnostics = '<leader>d'    "设置查看光标停留处的错误诊断详细信息的快捷键,默认为\d
let g:ycm_auto_hover = ''                           "关闭光标静止弹出原型
let g:ycm_max_diagnostics_to_display = 0            "诊断数量无上限
"手动弹出原型
nmap <leader>t <plug>(YCMHover)

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
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
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
            \ "lua":1,
            \}

"nerdcommenter
"快速注释
let g:NERDCreateDefaultMappings = 1             "创建默认的映射
let g:NERDSpaceDelims = 1                       "默认情况下在注释分隔符后添加空格
let g:NERDCompactSexyComs = 1                   "使用紧凑的语法来修饰多行注释
let g:NERDDefaultAlign = 'left'                 "按行对齐的注释分隔符左对齐，而不是按照代码缩进对齐
let g:NERDCommentEmptyLines = 1                 "允许注释和反转空行(在注释区域时很有用)
let g:NERDTrimTrailingWhitespace = 1            "当取消注释时，允许删除尾随空格
let g:NERDToggleCheckAllLines = 1               "启用NERDCommenterToggle来检查所有选中的行是否被注释

"echodoc
set noshowmode
" set cmdheight=2
let g:echodoc_enable_at_startup = 1

"vim-interestingwords   高亮单词
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

"gtags
""" let g:gutentags_define_advanced_commands = 1
set cscopetag                           "使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'            "使用 gtags-cscope 代替 cscope
" let $GTAGSLABEL='native'
" let g:gutentags_define_advanced_commands = 1
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/gtags/share/gtags/gtags.conf'

"gutentags
"搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
""同时开启 ctags 和 gtags 支持：
" let g:gutentags_modules = []
" if executable('ctags')
"    let g:gutentags_modules += ['ctags']
" endif
" if executable('gtags-cscope') && executable('gtags')
"    let g:gutentags_modules += ['gtags_cscope']
" endif
let g:gutentags_modules = ['gtags_cscope']
"将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

"禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

"gutentags_plus
" let g:gutentags_plus_switch = 1
let g:gutentags_plus_nomap = 1      "使用默认的快捷键，将源码中定义的c键改为g键
"   ;ga 查找此符号的赋值
"   ;gc 查找调用此函数的函数
"   ;gd 查找由该函数调用的函数
"   ;ge 查找egrep模式，相当于egrep功能，但查找速度快多了
"   ;gf 查找光标下的文件
"   ;gg 查看光标下符号的定义
"   ;gi 查找哪些文件 include 了本文件
"   ;gs 查看光标下符号的引用
"   :gt 查找此文本字符串
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>
" nmap <silent> <leader>ck :GscopeKill<cr>

" coc
" nmap <silent> <c-k> <Plug>(coc-definition)
" nmap <silent> <c-k> <Plug>(coc-type-definition)
" nmap <silent> <c-k> <Plug>(coc-implementation)
" nmap <silent> <c-q> <Plug>(coc-references)
" netrw
" let g:netrw_keepdir = 0
" let g:netrw_winsize = 30
" let g:netrw_banner = 0
nnoremap <F9> :Vexplore<CR><C-W>w<cr>
"设置是否显示横幅
let g:netrw_banner = 1

"设置目录列表的样式：树形
let g:netrw_liststyle = 3

"在之前的窗口编辑文件，类似按下大写 P
" let g:netrw_browse_split = 4

"水平分割时，文件浏览器始终显示在左边
" let g:netrw_altv = 1

"设置文件浏览器窗口宽度为 25%
let g:netrw_winsize = 16

"自动打开文件浏览器 netrw
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

hi! link netrwMarkFile Search

"leaderf
let g:Lf_WindowPosition = 'popup'

let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_CacheDirectory = expand('~/.vim/cache')

let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1

let g:Lf_ShortcutF = '<c-p>'
"当前打开的buffer
let g:Lf_ShortcutB = '<c-y>'
"最近打开的文件
noremap <c-h> :LeaderfMru<cr>
"函数搜索
noremap <a-t> :LeaderfFunction!<cr>
noremap <a-r> :LeaderfBufTag!<cr>
" let g:Lf_WindowHeight = 0.30
let g:Lf_WindowBreadth = 0.30

" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" If needs
" set ambiwidth=double

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>

" let g:Lf_PopupPalette = {
"     \  'light': {
"     \      'Lf_hl_match': {
"     \                'gui': 'NONE',
"     \                'font': 'NONE',
"     \                'guifg': 'NONE',
"     \                'guibg': '#303136',
"     \                'cterm': 'NONE',
"     \                'ctermfg': 'NONE',
"     \                'ctermbg': '236'
"     \              },
"     \      'Lf_hl_cursorline': {
"     \                'gui': 'NONE',
"     \                'font': 'NONE',
"     \                'guifg': 'NONE',
"     \                'guibg': '#303136',
"     \                'cterm': 'NONE',
"     \                'ctermfg': 'NONE',
"     \                'ctermbg': '236'
"     \              },
"     \      },
"     \  'dark': {
"     \      }
"     \  }

"vim-preview
" noremap <leader>m :PreviewScroll -1 <cr>
" noremap <leader>n :PreviewScroll +1 <cr>
noremap <a-x> :PreviewScroll -1 <cr>
noremap <a-c> :PreviewScroll +1 <cr>
" inoremap <c-m> <c-\><c-o>:PreviewScroll -1<cr>
" inoremap <c-n> <c-\><c-o>:PreviewScroll +1<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

"vim-gitgutter
"let g:gitgutter_map_keys = 0                            "不映射任何键
"nnoremap <F2> :GitGutterLineHighlightsToggle<CR>        "打开/关闭高亮行
au VimEnter * :GitGutterDisable
" let g:gitgutter_signs = 0
" let g:gitgutter_sign_allow_clobber = 0
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_sign_added = '▎'
" let g:gitgutter_sign_modified = '░'
" let g:gitgutter_sign_removed = '▏'
" let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_modified_removed = '▒'

"vim-signify
"git 状态栏

""ALE
"Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 1
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'
let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚠'
let g:ale_sign_warning = 'Ψ'
" nmap <silent> <C-u> <Plug>(ale_previous_wrap)
" nmap <silent> <C-d> <Plug>(ale_next_wrap)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
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

let g:ale_linters = { 'python': ['flake8'] }

"支持python2语法检测
let g:ale_python_flake8_executable = 'python'
"let g:ale_python_flake8_executable = 'python3'
" let g:ale_python_flake8_options = '-m flake8 --max-line-length=100 ' .
      " \ '--max-complexity=10 --ignore=E111,E114,E121,E125,E126,E127,E128,E129,E131,E133,E201,E202,E203,E211,E221,E222,E241,E251,E261,E303,E402,W503,E302,E305,E501'
let g:ale_python_flake8_options = '-m flake8 --max-complexity=10 --ignore=E501,E302,E305,F401,F841,E301,E731,E306,E722,E265,C901,E231,W391,E261,E262,E226,E303,E711,E701,E251'


" vim-markdown'
" 支持Latex数学公式
" set conceallevel=2
" let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter=1
let g:markdown_fenced_languages =['c', 'cpp', 'python', 'sh', 'shell']

" vim-markdown-toc'
let g:vmt_cycle_list_item_markers = 1
" 取消储存时自动更新目录
" let g:vmt_auto_update_on_save = 0

" let g:vmt_dont_insert_fence = 1

" markdown-preview.nvim'
" 指定预览主题，默认Github
let g:mkdp_markdown_css=''
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
" let g:mkdp_theme = 'dark'

" img-paste.vim
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'
"
autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'
