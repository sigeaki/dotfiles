"Encode
set fileencodings=ucs-bom,utf-8,sjis,utf-16le,utf-16,default:
set fileencoding=utf-8
set encoding=utf-8
set clipboard+=unnamed

" ------------ 概観
" ステータスライン(2: 常に表示)
set laststatus=2

" カーソル位置を表示
set ruler

" モードを表示
set showmode

" 入力途中の呪文を表示
set showcmd

"行番号の表示
set number

"カーソルラインの表示
set cursorline

" ------------ ファイルタイプ
" ファイルタイプを検出して、それに応じて構文ハイライト
execute pathogen#infect()
execute pathogen#helptags()
syntax enable
filetype plugin indent on

" コマンドラインモードの補完機能をリッチに
set wildmenu

" 不可視文字の可視化
set list listchars=tab:»\ ,eol:¬,trail:∙


" ------------ インデント
" デフォルトで4
" ruby, clojure, markdownなら2
" タブはスペースに展開
set shiftwidth=0 softtabstop=0 tabstop=4 expandtab
augroup vimrc_tab
    autocmd!
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType clojure setlocal tabstop=2
    autocmd FileType markdown setlocal tabstop=2
augroup END
let g:vim_indent_cont=8


" ------------ 検索
" デフォルトはmagicモード
set magic

" デフォルトは大文字小文字を無視
set ignorecase

" 賢く大文字小文字を区別
set smartcase

" インクリメンタルサーチ
set incsearch

" すべてのマッチ箇所をハイライト
set hlsearch

" ファイル端に達しても、一周して検索を続行
set wrapscan

" デフォルトでOFF
set nospell


" ------------ Vimが自動的に作るファイル
" アンドゥ履歴ファイルを作らない
set noundofile
" バックアップファイルを作らない
set nobackup
" Swapファイル(自動保存ファイル)を作らない
set noswapfile

"日付けの挿入
:iabbrev dd <C-R>=strftime("[%F](%a)")<CR><ESC>
:iabbrev dt <C-R>=strftime("%F %H:%M")<CR>
:iabbrev kt <C-R>=strftime("%H時%M分起床")<CR><ESC>

" ファイルをひらいたとき最後にカーソルがあった場所に移動する
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview
" jedi-vimの補完開始
" let g:jedi#completions_command = "<C-n>"
