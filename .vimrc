syntax on

set visualbell
set encoding=utf-8
set ruler
set noswapfile
set title
set incsearch
set autoread
set ignorecase
set smartcase
set wrapscan
set nowrap
set number
set cursorline
set wildmenu wildmode=list:full
set clipboard+=unnamed,autoselect
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set whichwrap=b,s,<,>,[,]
set showmatch
set shell=/bin/bash\ -l\ -O\ expand_aliases

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" ==============================================================
" install neobundle plugins 
" ==============================================================

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'ykyk1218/vim-simple-search'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'nelstrom/vim-visual-star-search' " ビジュアルモードで選択した範囲を*で検索できるようにする
NeoBundle 'scrooloose/nerdtree'  " ディレクトリをツリー表示できる
NeoBundle 'Shougo/unite.vim'     " ファイルを開くのが便利になる
NeoBundle 'basyura/unite-rails'  " uniteでrailsプロジェクトのファイル移動
NeoBundle "tsukkee/unite-tag"    " ctgasの内容をunite.vimを使って開く
NeoBundle 'Shougo/neomru.vim'    " unite.vimで最近使ったファイルを開くのに必要
NeoBundle 'Shougo/neoyank.vim'   " unite.vimでヤンク履歴を表示する
NeoBundle 'tpope/vim-endwise'    " Ruby向けにendを自動挿入
NeoBundle 'soramugi/auto-ctags.vim' " ctagsを使ったタグの自動生成
NeoBundle 'mattn/emmet-vim'  " html/cssの入力補助
NeoBundle 'othree/html5.vim' " html5のシンタックスカラーon
NeoBundle 'kchmck/vim-coffee-script' " coffee scriptのシンタックスカラーon
NeoBundle 'osyo-manga/vim-over' " ハイライト一括置換的なやつ
NeoBundle 'slim-template/vim-slim' " slimのシンタックスハイライト
NeoBundle 'taglist.vim' " ctagsのリストが見れる
NeoBundle 'tpope/vim-fugitive' " vimでgitコマンドが使える
NeoBundle 'scrooloose/syntastic.git' " 文法チェック
NeoBundle 'simeji/winresizer'
NeoBundle 'TwitVim'
NeoBundle 'posva/vim-vue'
NeoBundle 'ctrlpvim/ctrlp.vim' " ファイル検索
NeoBundle 'rking/ag.vim' " ファイル検索高速化
NeoBundle 'bronson/vim-trailing-whitespace' "行末スペース
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'NigoroJr/rsense'
NeoBundle 'cohama/lexima.vim'
NeoBundle 'Shougo/neocomplcache-rsense.vim' , {
\ 'autoload' : { 'insert' : 1, 'filetype' : 'ruby', } }
NeoBundleLazy 'OmniSharp/omnisharp-vim', {
\   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
\   'build': {
\     'windows' : 'msbuild server/OmniSharp.sln',
\     'mac': 'xbuild server/OmniSharp.sln',
\     'unix': 'xbuild server/OmniSharp.sln',
\   },
\ }
NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call neobundle#end()
filetype plugin on

" ==============================================================
" setting common
" ==============================================================

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=235


let g:hybrid_use_Xresources = 1
" colorscheme lucius
colorscheme spring-night

" 拡張子別の設定
autocmd FileType php :set dictionary=~/.vim/dict/php.dict
autocmd FileType javascript :set dictionary=~/.vim/dict/js.dict
autocmd BufRead,BufNewFile *.php setfiletype php
autocmd BufRead,BufNewFile *.js setfiletype js
autocmd BufRead,BufNewFile *.cs setfiletype cs
autocmd BufRead,BufNewFile *.tpl setfiletype smarty

" ==============================================================
" setting neocomplete 補完 
" ==============================================================

" 補完ウィンドウの設定
set completeopt=menuone

highlight Pmenu ctermbg=3
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" rsenseでの自動補完機能を有効化
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" auto-ctagsを使ってファイル保存時にtagsファイルを更新
let g:auto_ctags = 1
 
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
 
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
 
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
 
let g:neocomplcache_enable_camel_case_completion  =  1

" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1
 
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
 
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" 補完の設定
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" php用なのでいったん外すディクショナリ定義
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
    \ 'javascript' : $HOME . '/.vim/dict/js.dict',
    \ 'ctp' : $HOME . '/.vim/dict/php.dict'
    \ }
 
if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
 
" スニペットを展開する。スニペットが関係しないところでは行末まで削除
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
 
" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()
 
" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()
 
" 改行で補完ウィンドウを閉じる
" inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
 
"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
 
" <C-h>や<BS>を押したときに確実にポップアップを削除します
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
 
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
" inoremap <expr><C-CR> neocomplcache#close_popup()
 
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 括弧の保管
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" コマンドモードで現在開いているファイルのパスを「%%」で表示
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" 複数行を選択して連続してインデントできるようにする
vnoremap > >gv
vnoremap < <gv

" NERDTreeを開く
nnoremap <C-t> :NERDTreeToggle

nnoremap :re :WinResizerStartResize
let g:winresizer_start_key = '<C-C>'

" 入力モードで行の先頭と最後に移動するショートカット
imap <C-e> <Esc>$a
" inoremap <C-a> <Esc>^a
nmap <C-e> <Esc>$a
" noremap <C-a> <Esc>^a

" VISUALモード
noremap <C-u> <esc>
noremap! <C-u> <esc>

" ヤンクレジスタから貼付け
noremap __ "0p
noremap x "_x

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
nnoremap <C-{> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-}> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap TT :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" バッファ移動
nnoremap <silent>BP :bprevious<CR>
nnoremap <silent>BN :bnext<CR>
nnoremap <silent>BB :b#<CR>

" ==============================================================
" setting omnisharp C# 
" ==============================================================

let g:OmniSharp_selector_ui = 'unite'
autocmd FileType cs nnoremap <C-B> :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
autocmd FileType cs nnoremap <leader>d  :OmniSharpDocumentation<cr>
autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>

" ==============================================================
" setting git command 
" ==============================================================

nnoremap <C-g><C-b> :Gblame
nnoremap <C-g><C-d> :Gdiff
nnoremap <C-g><C-s> :Gstatus

" ==============================================================
" setting unite vim (VIM User Interface) 
" ==============================================================

let g:unite_source_history_yank_enable = 1
noremap <C-U><C-F> :Unite -buffer-name=file file -start-insert<CR>
" 最近使ったフィアル一覧
noremap <C-U><C-R> :Unite file_mru<CR>
noremap <C-U><C-Y> :Unite history/yank<CR>

" ウィンドウを分割して開く
" 横
au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split') 
au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')
" 縦 
au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" unite-tagsの設定
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif

noremap :rc :<C-u>Unite rails/controller<CR>
noremap :rm :<C-u>Unite rails/model<CR>
noremap :rv :<C-u>Unite rails/view<CR>
noremap :rh :<C-u>Unite rails/helper<CR>
noremap :rs :<C-u>Unite rails/stylesheet<CR>
noremap :rj :<C-u>Unite rails/javascript<CR>
noremap :rr :<C-u>Unite rails/route<CR>
noremap :rg :<C-u>Unite rails/gemfile<CR>
noremap :rt :<C-u>Unite rails/spec<CR>
noremap :ss :SimpleSearch 

" ==============================================================
" setting html coding
" ==============================================================

let g:user_emmet_expandabbr_key = '<C-y><C-y>'
let g:user_emmet_settings = {
\  'indentation':'  '
\}

let twitvim_browser_cmd = 'open' " for Mac
let twitvim_force_ssl = 1
let twitvim_count = 40

" ==============================================================
" validatation syntax error
" ==============================================================

" :set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
:set statusline=%{fugitive#statusline()}\ %f%m%r%h%w
" execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [ 'ruby', 'php', 'html', 'twig', 'javascript', 'css', 'scss', 'sass', 'cs', 'objc' ]}
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_php_args = '-l'

" ==============================================================
" find file
" ==============================================================

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
 
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

set runtimepath^=~/.vim/bundle/ag

" ==============================================================
" my vim command
" ==============================================================

noremap <F2> <ESC>:call RUN()<ENTER>
function! RUN()
  :w|! sync_server
endfunction

noremap <F3> <ESC>:call RUN_LOCAL()<ENTER>
function! RUN_LOCAL()
  :w|! sync_server_local
endfunction
