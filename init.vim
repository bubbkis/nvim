"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/bubbkis/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/bubbkis/.cache/dein')
  call dein#begin('/home/bubbkis/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/bubbkis/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  if has('nvim')
    call dein#add('Shougo/deoplete.nvim', {'do' : ':UpdateRemotePlugins'})
  else
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/denite.nvim')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('lvht/phpcd.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('thinca/vim-quickrun')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('w0rp/ale')
  call dein#add('Vimjas/vim-python-pep8-indent')
  call dein#add('jsfaint/gen_tags.vim')
  call dein#add('chriskempson/vim-tomorrow-theme')
  call dein#add('Yggdroot/indentLine')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('Shougo/neco-vim')
  call dein#add('Shougo/neco-syntax')
  call dein#add('ujihisa/neco-look')
  call dein#add('rhysd/accelerated-jk')
  call dein#add('osyo-manga/vim-anzu')
  call dein#add('rhysd/clever-f.vim')
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
  call dein#add('uplus/deoplete-solargraph')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

function! s:deinClean()
  if len(dein#check_clean())
    call map(dein#check_clean(), 'delete(v:val, "rf")')
  else
    echo '[ERR] no disabled plugins'
  endif
endfunction
command! DeinClean :call s:deinClean()

"End dein Scripts-------------------------

"let g:python_host_prog = '/home/bubbkis/.anyenv/envs/pyenv/versions/neovim2/bin/python'
"let g:python3_host_prog = '/home/bubbkis/.anyenv/envs/pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'


" リーダー
let mapleader = "\<Space>"

" カラースキーマ
colorscheme Tomorrow-Night
"colorscheme Tomorrow
"colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night-Blue
"colorscheme Tomorrow-Night-Bright
" シンタックスハイライトの最大行数
set synmaxcol=200
" シンタックスハイライト
syntax on
" 全角スペースのハイライト
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

" 表示・設定系 --------------------------
" 挿入モードでTABキーを押した際、対応する数のスペースを入力
set expandtab
" 画面上でタブ文字が占める幅の指定
set tabstop=2
" 自動インデントでずれる幅の指定
set shiftwidth=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅の指定
set softtabstop=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。 行頭以外では 'tabstop' の数だけ空白が挿入される。 オフのときは、<Tab> を打ち込むと常に 'tabstop' の数だけインデントされる。
set smarttab
" インデントをshiftwidthの倍数に丸める
set shiftround
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 一旦ファイルタイプ関連を無効化
filetype off
" 256色対応
set t_Co=256
" エンコード, ファイルエンコード
set encoding=utf-8
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" ビープ音を消す
set belloff=all
" OSのクリップボードを使う
set clipboard=unnamed
" 行番号を表示
set number
" compatibleオプションをオフにする
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 補完の際の大文字小文字の区別しない
set infercase
" 行末1文字までカーソルを移動できるようにする
set virtualedit=onemore
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan
" インクリメンタルサーチを行う
set incsearch
" 文字列置換をインタラクティブに表示する
set inccommand=split
" 検索結果をハイライト表示
set hlsearch
" マウスモード有効
set mouse=a
" コマンドを画面最下部に表示する
set showcmd
" ◆や○文字が崩れる問題を解決"
set ambiwidth=double

"-----------------------------------------------------------------------------
" タブ機能
"-----------------------------------------------------------------------------
set showtabline=2
set tabline=%!MyTabLine()
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i+1) . 'T' 
    let s .= ' ' . (i+1) . (1==getwinvar(i+1,'&modified')?'[+]':'') . ' %{MyTabLabel(' . (i+1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  if tabpagenr('$') > 1 
    let s .= '%=%#TabLine#%999Xclose'
  endif
  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1]) 
endfunction

:let g:load_templates="ask"
" End 表示・設定系 ----------------------


" 操作・入力系 --------------------------
" ファイルのスプリット（と行結合）
nnoremap <silent> <S-j> :split<CR>
nnoremap <silent> <S-l> :vsplit<CR>
nnoremap <Bar> $:let pos = getpos(".")<CR>:join<CR>:call setpos('.', pos)<CR>

" インサートモードでbackspaceを有効に
set backspace=indent,eol,start
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
" ビジュアルモードの選択範囲を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" vを二回で行末まで選択
vnoremap v $h
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 行移動
" 折り返し行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" 20行ずつ移動
nnoremap <C-n> 20j
vnoremap <C-n> 20j
nnoremap <C-p> 20k
vnoremap <C-p> 20k
" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
" End 操作・入力系 ----------------------


" ウィンドウサイズの変更 ---------------
" Macの場合に必要
"set macmeta
" サイズ変更
nnoremap <M-+> <C-w>-
nnoremap <M--> <C-w>+
nnoremap <M->> <C-w>>
nnoremap <M-<> <C-w><
" alt + = でリセット
nnoremap <M-=> <C-w>=
" alt + a で最大化
nnoremap <M-a> <C-w>_<C-w><Bar>
" End ウィンドウサイズの変更 -----------


"-----------------------------------------------------------------------------
" マップ定義
"-----------------------------------------------------------------------------
" バッファ移動用キーマップ
" F2: 前のバッファ
" F3: 次のバッファ
" F4: バッファ削除
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <F4> <ESC>:bw<CR>
" 表示行単位で行移動する
nnoremap j gj
nnoremap k gk
" フレームサイズを怠惰に変更する
map <kPlus> <C-W>+
map <kMinus> <C-W>-
" オムニ補完
imap <C-Space> <C-X><C-O>
" 画面水平分割
map <F6> <ESC>:sp<CR>
" 画面垂直分割
map <F7> <ESC>:vsp<CR>
" エクスプローラー
"map <C-e> <ESC>:Explore<CR>
" tab navigation
nmap <C-g> :tabprevious<cr>
nmap <C-f> :tabnext<cr>
map <C-g> :tabprevious<cr>
map <C-f> :tabnext<cr>
imap <C-g> <ESC>:tabprevious<cr>i
imap <C-f> <ESC>:tabnext<cr>i
map <C-w> :tabclose<cr>
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>
" 構文チェック
map <C-x> <ESC>:make -c %<CR>
" 次のエラー行にジャンプ
map <C-b> <ESC>:cn<CR>
" 前のエラー行にジャンプ
map <C-n> <ESC>:cN<CR>
" エンコード変換
map <C-u> <ESC>:e ++enc=UTF-8<CR>

" (),[],{},<>,"",'',入力+()の中にカーソル戻す
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
imap “ “<Left>


" denite.vim -----------------------------
nnoremap [denite] <Nop>
nmap <C-d> [denite]

" grep
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <silent> [denite]<C-g> :<C-u>Denite grep -mode=normal<CR>
nnoremap <silent> [denite]<C-r> :<C-u>Denite -resume<CR>
nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>

" ノーマルモードで起動、jjでノーマルへ
call denite#custom#option('default', {'mode': 'normal'})
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')

" ファイル一覧
noremap [denite] :Denite file_rec -mode=insert
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ ['.git/', '__pycache__/', '*.o', '*.make', '*.min.*'])

" ディレクトリ一覧
noremap [denite]<C-d> :<C-u>Denite directory_rec<CR>
noremap [denite]<C-c> :<C-u>Denite directory_rec -default-action=cd<CR>

" 移動
call denite#custom#map('normal', 'j', '<denite:nop>', 'noremap')
call denite#custom#map('normal', 'k', '<denite:nop>', 'noremap')
call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('normal', '<C-u>', '<denite:move_up_path>', 'noremap')
call denite#custom#map('insert', '<C-u>', '<denite:move_up_path>', 'noremap')

" ウィンドウを分割して開く
call denite#custom#map('normal', '<C-j>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', '<C-l>', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('insert', '<C-l>', '<denite:do_action:vsplit>', 'noremap')
" End denite.vim -------------------------


" NERDTree -------------------------------
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
" 表示幅
let g:NERDTreeWinSize=50
" ブックマークを表示
let g:NERDTreeShowBookmarks=1
" 親ディレクトリへ移動
let g:NERDTreeMapUpdir=''
" ファイルの開き方
let g:NERDTreeMapOpenSplit='<C-j>'
let g:NERDTreeMapOpenVSplit='<C-l>'
" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1
" 隠しファイルを表示
let g:NERDTreeShowHidden=1
" 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']
" NERDTreeを同時に閉じる
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
" End NERDTree ---------------------------


" deoplete.nvim --------------------------
" .vueシンタックスハイライト
autocmd BufNewFile,BufRead *.vue set filetype=html
autocmd BufRead *.ts setlocal filetype=typescript
autocmd BufRead *.rs setlocal filetype=rust
autocmd BufRead *.rb setlocal filetype=ruby

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
" 一つ目の候補を選択状態にする
set completeopt+=noinsert

"let g:LanguageClient_devel = 1
"let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
"let g:LanguageClient_loggingLevel = 'INFO'
"let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
"let g:LanguageClient_selectionUI = 'location-list'
"set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" Not supported by neovim in debian
" set signcolumn=yes

"function! HandleWindowProgress(params) abort
"    echomsg json_encode(a:params)
"endfunction

call deoplete#custom#var('omni', 'input_patterns', {
    \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
\})
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" End deoplete.nvim ----------------------


" jedi-vim / deoplete-jedi ---------------
let g:deoplete#sources#jedi#server_timeout=100
let g:deoplete#sources#jedi#statement_length=100
" jedi本体の補完は切る（deoplete-jediで非同期処理をしてくれるため）
" 勝手にキーバインド設定やら自動補完などをやるので潰しておく
"let g:jedi#auto_initialization = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0
" コード参照のキーバインドを登録
"let g:jedi#goto_command = "<Leader>d"
" End jedi-vim / deoplete-jedi -----------


" phpcd.vim ------------------------------
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
" End phpcd.vim --------------------------


" vim-airline ----------------------------
" モードの表示名を定義(デフォルトだと長くて横幅を圧迫するので略称にしている)
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

" パワーラインでかっこよく
let g:airline_powerline_fonts = 1
" カラーテーマ指定してかっこよく
let g:airline_theme = 'badwolf'
" タブバーをかっこよく
let g:airline#extensions#tabline#enabled = 1
" 選択行列の表示をカスタム(デフォルトだと長くて横幅を圧迫するので最小限に)
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
" virtulenvを認識しているか確認用に、現在activateされているvirtualenvを表示(vim-virtualenvの拡張)
let g:airline#extensions#virtualenv#enabled = 1
" gitのHEADから変更した行の+-を非表示(vim-gitgutterの拡張)
let g:airline#extensions#hunks#enabled = 0
" Lintツールによるエラー、警告を表示(ALEの拡張)
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'
" End vim-airline ------------------------


" vim-fugitive ---------------------------
nmap [figitive] <Nop>
map <Leader>g [figitive]
nmap <silent> [figitive]s :<C-u>Gstatus<CR>
nmap <silent> [figitive]d :<C-u>Gdiff<CR>
nmap <silent> [figitive]b :<C-u>Gblame<CR>
nmap <silent> [figitive]l :<C-u>Glog<CR>
" End vim-fugitive -----------------------


" vim-quickrun ---------------------------
" vimprocで非同期実行
" 成功時にバッファ、失敗時にQuickFixで表示
" 結果表示のサイズ調整など
let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 40,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : ':botright 8sp',
    \ }
\}

" 実行時に前回の表示内容をクローズ&保存してから実行
let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
" End vim-quickrun -----------------------


" ALE ------------------------------------
" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" エラー表示の列を常時表示
let g:ale_sign_column_always = 1
" ファイルを開いたときにlint実行
let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
let g:ale_lint_on_save = 1
" 編集中のlintはしない
let g:ale_lint_on_text_changed = 'never'

" lint結果をロケーションリストとQuickFixには表示しない
" 出てると結構うざいしQuickFixを書き換えられるのは困る
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" 有効にするlinter
let g:ale_linters = {
\   'python': ['flake8'],
\}

" ALE用プレフィックス
nmap [ale] <Nop>
map <C-k> [ale]
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)
" End ALE --------------------------------


" gen_tags.vim ---------------------------
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1
" End gen_tags.vim -----------------------

" accelerated-jk -------------------------
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" End accelerated-jk ---------------------

" vim-anzu -------------------------------
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nmap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)
" End vim-anzu ---------------------------


" denite.vim -----------------------------
" End denite.vim -------------------------


"-----------------------------------------------------------------------------
" ファイル先頭に#!/usr/bin/hoge ファイルへ実行権限を自動付与
"-----------------------------------------------------------------------------
autocmd BufWritePost * :call AddExecmod()
function AddExecmod()
    let line = getline(1)
    if strpart(line, 0, 2) == "#!"
        call system("chmod +x ". expand("%"))
    endif
endfunction

"-----------------------------------------------------------------------------
" 行末の不要なスペース削除
"-----------------------------------------------------------------------------
function! RTrim()
    let s:cursor = getpos(".")
    %s/\s\+$//e
    call setpos(".", s:cursor)
endfunction

autocmd BufWritePre *.php,*.rb,*.py,*.js,*.bat call RTrim()

"-----------------------------------------------------------------------------
" 貼り付け時にペーストバッファが上書きされないようにする
"-----------------------------------------------------------------------------
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
