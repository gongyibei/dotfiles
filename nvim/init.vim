" __  __     __     _____ __  __ ____   ____ 
" |  \/  |_   \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | \ \ / / | || |\/| | |_) | |    
" | |  | | |_| |\ V /  | || |  | |  _ <| |___ 
" |_|  |_|\__, | \_/  |___|_|  |_|_| \_\\____|
"        |___/                               

" +========================================================+
" =                         Plugins                        =
" +========================================================+

call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'icymind/NeoSolarized'
Plug 'tomasr/molokai'
Plug 'spf13/vim-colors'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'powerline/fonts'
"Plug 'kien/rainbow_parentheses.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'liuchengxu/space-vim-dark'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'rbgrouleff/bclose.vim'
" Plug 'francoiscabrol/ranger.vim'

"Plug 'w0rp/ale'
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
"Plug 'Valloric/YouCompleteMe '
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-jedi'
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
"Plug 'sillybun/vim-autodoc'
" 会与窗口切换冲突
" Plug 'google/yapf' 
Plug 'timothycrosley/isort'
Plug 'heavenshell/vim-pydocstring'
Plug 'ervandew/supertab'
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Plug 'echuraev/translate-shell.vim' 
Plug 'voldikss/vim-translator'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'iamcco/markdown-preview.nvim',{ 'do': 'cd app & yarn install'  }
" Plug 'benmills/vimux'
" Plug 'suan/vim-instant-markdown'
" Plug 'vim-latex/vim-latex'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug 'vim-python/python-syntax'
Plug 'rizzatti/dash.vim'

call plug#end() 


" +========================================================+
" =                         Setting                        =
" +========================================================+

" Genneral {{{
    syntax on
    " 检测文件类型
    filetype on
    " 针对不同的文件类型采用不同的缩进格式
    filetype indent on
    " 允许插件
    filetype plugin on
    " 启动自动补全
    filetype plugin indent on

    set completeopt=menu
    set clipboard=unnamed

    set number
    set norelativenumber
    set background=dark
    set t_Co=256
    " colorscheme onedark
    colorscheme gruvbox
    " colorscheme space-vim-dark
    " colorscheme pablo
    " colorscheme snazzy
    " colorscheme darcula
    " colorscheme bluewery-light
    let g:gruvbox_contrast_dark='soft'
    let g:lightline = {'colorscheme': 'snazzy', }
    " let g:python_highlight_all=1
    hi Normal     ctermbg=NONE guibg=NONE
    hi LineNr     ctermbg=NONE guibg=NONE
    hi SignColumn ctermbg=NONE guibg=NONE
    " 突出显示当前行
    " set cursorline


    " smart indent
    set smartindent
    set autoindent
    set foldmethod=indent
    set foldlevel=99

    " smart tab
    " 设置Tab键的宽度  
    set tabstop=4
    " 每一次缩进对应的空格数
    set shiftwidth=4
    " 按退格键时可以一次删掉 4 个空格
    set softtabstop=4
    " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
    set smarttab
    " 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
    set expandtab
    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
    set shiftround
    " set clipboard=unnamed
    "au BufWinLeave * silent mkview
    "au BufWinEnter * silent loadview
    
    " let g:python3_host_prog='/usr/local/bin/python3'
    let g:python3_host_prog= '/Users/swdy/anaconda3/bin/python3'
    autocmd BufNewFile,BufRead *.md set filetype=markdown
    autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">
    au BufNewFile,BufRead *.ejs set filetype=html
" }}}
 
" Map {{{
    " set leader 
    let mapleader = "\<Space>"
    let maplocalleader = ","

    " smart way to move between windows
    inoremap <C-h> <C-\><C-N><C-w>h
    inoremap <C-j> <C-\><C-N><C-w>j
    inoremap <C-k> <C-\><C-N><C-w>k
    inoremap <C-l> <C-\><C-N><C-w>l
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-h> <C-W>h
    nnoremap <C-l> <C-W>l
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    
    " smart way to move between tags
    " inoremap <F1> <C-\><C-N>gT
    " inoremap <F2> <C-\><C-N>gt
    " nnoremap <F1> <C-\><C-N>gT
    " nnoremap <F2> <C-\><C-N>gt
    " tnoremap <F1> <C-\><C-N>gT
    " tnoremap <F2> <C-\><C-N>gt
    nnoremap [t <C-\><C-N>gT
    nnoremap ]t <C-\><C-N>gt

    " smart way to move between buffers
    nnoremap [b :bp<CR>
    nnoremap ]b :bn<CR>
    
    
    
    " quick folding
    nnoremap <leader><space> za
    
    " move to next wrap line
    noremap <down> gj
    noremap <up> gk

    " disable Ex moe
    map Q <Nop>

    " change to normal mode 
    inoremap jk <esc>
    " inoremap <esc> <nop>
    
    
    " quick to edit and source your vimrc 
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>

    " qiuck to save
    nnoremap <leader>w :w<cr>
    nnoremap <leader>q :q<cr>
    "nnoremap <leader>z :wq<cr>
    
    map <LEADER>p <Esc>/<++><CR>:nohlsearch<CR>4s
    inoremap <C-p> <++>
" }}}

" Terminal {{{
    noremap <F12> :tabe term://zsh<cr> a
" }}}

" Func {{{
    "一键执行
    map <F5> :call CompileRun()<CR>
    func! CompileRun()
        exec "w" 
        if &filetype == 'python'
            exec '!time cat input.txt|python3 %'
        elseif &filetype == 'haskell'
            exec '!time runghc %'
        elseif &filetype == 'c' 
            exec '!gcc % -o %<'
            exec '!time ./%<'
            exec '!rm ./%<'
        elseif &filetype == 'cpp' 
            exec '!gcc % -o %<'
            exec '!time ./%<'
            exec '!rm ./%<'
        elseif &filetype == 'scheme'
            exec '!time scheme --script %'
    " elseif &filetype == 'cpp'
    "     exec '!g++ % -o %<'
    "     exec '!time ./%<'
        elseif &filetype == 'sh'
            exec '!time bash %'
        elseif &filetype == 'go'
            exec '!go run %'
        elseif &filetype == 'java'
            exec '!javac %'
            exec '!java %<'
            exec '!rm %<.class'
        elseif &filetype == 'm'
            exec '!time octove %'
        endif                                                                              
    endfunc 

    " 定义函数AutoSetFileHead，自动插入文件头
    autocmd BufNewFile *.sh,*.py,*.go exec ":call AutoSetFileHead()"
    function! AutoSetFileHead()
        "如果文件类型为.sh文件
        if &filetype == 'sh'
            call setline(1, "\#!/bin/bash")
        endif

        "如果文件类型为python
        if &filetype == 'python'
            " call setline(1, "\#!/usr/bin/env python")
            " call append(1, "\# encoding: utf-8")
            call setline(1, "\# -*- coding: utf-8 -*-")
        endif

        if &filetype == 'go'
            " call setline(1, "package main")
            " call setline(3, "import (")
            " call setline(4, "    \"fmt\"")
            " call setline(5, ")")
            " call setline(6, "func main() {")
            " call setline(8, "{")
        endif

        normal G
        normal o
        normal o
    endfunc
    "
    
" }}}

" leetcode {{{
    noremap <leader>lr :!leetcode run %<CR>
    noremap <leader>ls :!leetcode submit %<CR>
" }}}


" +========================================================+
" =                     Plugin Setting                     =
" +========================================================+

" nerdtree {{{
    noremap <F7> :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
    let g:nerdtree_tabs_open_on_console_startup=0
    let g:nerdtree_tabs_open_on_gui_startup=0
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }
" }}}

" tagbar {{{
    noremap <F9> :TagbarToggle<CR>
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : '~/Project/github/markdown2ctags/markdown2ctags.py',
        \ 'ctagsargs' : '-f - --sort=yes',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }
" }}}

" airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶ '
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_theme = 'bubblegum'
    " 是否打开tabline
    " let g:airline#extensions#tabline#enabled = 1
" }}}

" rainbow {{{
    let g:rainbow_active = 1 
" }}}

" ale{{{
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚡'
    let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
    autocmd FileType python nnoremap <LocalLeader>s :ALEEnable<CR>
    autocmd FileType python nnoremap <localLeader>c :ALEDisable<CR>
    let g:ale_lint_on_enter = 0
"}}}
"

" deoplete {{{
"    let g:deoplete#enable_at_startup = 1
" }}}

" yapf{{{
    autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
" }}}

" isort{{{
    autocmd filetype python nnoremap <localleader>i :!isort %<cr><cr>
" }}}

" vim-pydocstring{{{
    nmap <silent> <LocalLeader>d <Plug>(pydocstring)
" }}}

" supertab{{{
    let g:SuperTabDefaultCompletionType = "context"
    let g:jedi#popup_on_dot = 0
    " let g:SuperTabClosePreviewOnPopupClose = 1
" }}}


" jedi {{{
    let g:jedi#completions_command = "<C-N>"
" }}}

" nerdcommenter {{{
    let g:NERDSpaceDelims = 1
    let g:NERDDefaultAlign = 'left'
" }}}

" tpope/vim-commentary {{{
    autocmd FileType python,shell,coffee set commentstring=#\ %s
    autocmd FileType java,c,cpp set commentstring=//\ %s
    autocmd FileType markdown set commentstring=<!--\ %s\ -->
" }}}

" ranger {{{
    let g:NERDTreeHijackNetrw = 0 
    let g:ranger_replace_netrw = 1 
    map <F8> :Ranger<CR>
" }}}

" easymotion {{{
    map f <Plug>(easymotion-prefix)   
    map f <Plug>(easymotion-s)
" }}}

" ctrlp {{{
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
" }}}

" latex {{{
    autocmd Filetype tex setl updatetime= 3000
    let g:livepreview_previewer = 'open -a Skim'
" }}} 

" markdown-preview {{{
    noremap <F6> :MarkdownPreview<CR>
" }}}

" translate {{{
    " let g:trans_bin = "~/.vim"
    " "inoremap <silent> <leader>te <ESC>:Trans :en<CR>
    " nnoremap <silent> <leader>t :Trans :zh -b<CR>
    " vnoremap <silent> <leader>t :Trans :zh -b<CR>
    " "inoremap <silent> <leader>te <ESC>:Trans :en<CR>
    " nnoremap <silent> <leader>te :Trans :en<CR>
    " vnoremap <silent> <leader>te :Trans :en<CR>
    " "inoremap <silent> <leader>tt <ESC>:Trans :zh<CR>
    " nnoremap <silent> <leader>tz :Trans :zh<CR>
    " vnoremap <silent> <leader>tz :Trans :zh<CR>
    " nnoremap <silent> <leader>td :TransSelectDirection<CR>
    " vnoremap <silent> <leader>td :TransSelectDirection<CR>
" }}}

" vim-translator {{{
    " Echo translation in the cmdline
    nmap <silent> <Leader>t <Plug>Translate
    vmap <silent> <Leader>t <Plug>TranslateV

    " Display translation in a window
    " nmap <silent> <Leader>w <Plug>TranslateW
    " vmap <silent> <Leader>w <Plug>TranslateWV
    
    " Replace the text with translation
    " nmap <silent> <Leader>r <Plug>TranslateR
    " vmap <silent> <Leader>r <Plug>TranslateRV

    " Translate the text in clipboard
    nmap <silent> <Leader>x <Plug>TranslateX

    " nnoremap <silent><expr> <M-f> translator#window#float#has_scroll() ?
    "                         \ translator#window#float#scroll(1) : "\<M-f>"
    " nnoremap <silent><expr> <M-b> translator#window#float#has_scroll() ?
    "                         \ translator#window#float#scroll(0) : "\<M-f>""   

    " Text highlight of translator window
    hi def link TranslatorQuery             Identifier
    hi def link TranslatorDelimiter         Special
    hi def link TranslatorExplain           Statement

    " Background of translator window border
    hi def link Translator                  Normal
    hi def link TranslatorBorder            Normal
    
" }}}

" dash {{{
    nmap <silent> <Leader>h :Dash<CR>
" }}}
"
" boxes {{{
    vmap <leader>mc !boxes -d  ukaii<CR>
    nmap <leader>mc !!boxes -d ukaii<CR>
    vmap <leader>xc !boxes -d  ukaii -r<CR>
    nmap <leader>xc !!boxes -d ukaii -r<CR>
" }}}


" python-syntax{{{
    let g:python_highlight_builtins = 1
    let g:python_highlight_operators = 1
" }}}


" if (empty($TMUX))
"   if (has("nvim"))
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif
