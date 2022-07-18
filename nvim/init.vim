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

Plug 'mhinz/vim-startify'


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
Plug 'chrisbra/Colorizer'
Plug 'rbgrouleff/bclose.vim'
" Plug 'francoiscabrol/ranger.vim'

" 自动补全括号
" Plug 'jiangmiao/auto-pairs'
"Plug 'sillybun/vim-autodoc'
" 会与窗口切换冲突
Plug 'google/yapf' 
Plug 'timothycrosley/isort'
" Plug 'heavenshell/vim-pydocstring'
" Plug 'ervandew/supertab'
" Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'

" Plug 'iamcco/mathjax-support-for-mkdp'
" Plug 'iamcco/markdown-preview.vim'
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
    let g:python3_host_prog='/usr/bin/python3'
    " let g:python3_host_prog= '/Users/swdy/anaconda3/bin/python3'
    " let g:python3_host_prog= '/home/gyk/anaconda3/bin/python3'
    " let g:python3_host_prog= '/home/gyk/anaconda3/envs/torch/bin/python3'
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
    nnoremap <C-,> :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>

    " qiuck to save
    nnoremap <leader>w :w<cr>
    nnoremap <leader>q :q<cr>
    "nnoremap <leader>z :wq<cr>
    
    " map <LEADER>p <Esc>/<++><CR>:nohlsearch<CR>4s
    " inoremap <C-p> <++>
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
    " noremap <F7> :NERDTreeToggle<CR>
    noremap <C-b> :NERDTreeToggle<CR>
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
    noremap <F8> :TagbarToggle<CR>
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
    " let g:ale_sign_error = '✗'
    " let g:ale_sign_warning = '⚡'
    " let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
    " autocmd FileType python nnoremap <LocalLeader>s :ALEEnable<CR>
    " autocmd FileType python nnoremap <localLeader>c :ALEDisable<CR>
    " let g:ale_lint_on_enter = 0
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
    let g:pydocstring_doq_path = '/home/gyk/anaconda3/bin/doq'
    nmap <silent> <LocalLeader>d <Plug>(pydocstring)
" }}}

" supertab{{{
    " let g:SuperTabDefaultCompletionType = "context"
    " let g:jedi#popup_on_dot = 0
    " let g:SuperTabClosePreviewOnPopupClose = 1
" }}}


" jedi {{{
    " let g:jedi#completions_command = "<C-N>"
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
    " map <F8> :Ranger<CR>
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
    " vmap <leader>bb !boxes -d  tex-box -a c -s 66x3<CR>
    " nmap <leader>bb !!boxes -d tex-box -a c -s 66x3<CR>
    " vmap <leader>bu !boxes -d  tex-box -r -a c -s 66x3<CR>
    " nmap <leader>bu !!boxes -d tex-box -r -a c -s 66x3<CR>
    vmap <leader>bb !box<CR>
    nmap <leader>bb !!box<CR>
    vmap <leader>bu !unbox<CR>
    nmap <leader>bu !!unbox<CR>
" }}}


" python-syntax{{{
    let g:python_highlight_builtins = 1
    let g:python_highlight_operators = 1
" }}}
" coc{{{
    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("nvim-0.5.0") || has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number column into one
        set signcolumn=number
    else
        set signcolumn=yes
    endif

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ CheckBackspace() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
    endfunction
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Run the Code Lens action on the current line.
    nmap <leader>ll  <Plug>(coc-codelens-action)

    " " Map function and class text objects
    " " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    " xmap if <Plug>(coc-funcobj-i)
    " omap if <Plug>(coc-funcobj-i)
    " xmap af <Plug>(coc-funcobj-a)
    " omap af <Plug>(coc-funcobj-a)
    " xmap ic <Plug>(coc-classobj-i)
    " omap ic <Plug>(coc-classobj-i)
    " xmap ac <Plug>(coc-classobj-a)
    " omap ac <Plug>(coc-classobj-a)

    " " Remap <C-f> and <C-b> for scroll float windows/popups.
    " if has('nvim-0.4.0') || has('patch-8.2.0750')
    "     nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    "     nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    "     inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    "     inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    "     vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    "     vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    " endif

    " " Use CTRL-S for selections ranges.
    " " Requires 'textDocument/selectionRange' support of language server.
    " nmap <silent> <C-s> <Plug>(coc-range-select)
    " xmap <silent> <C-s> <Plug>(coc-range-select)

    " " Add `:Format` command to format current buffer.
    " command! -nargs=0 Format :call CocActionAsync('format')

    " " Add `:Fold` command to fold current buffer.
    " command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " " Add `:OR` command for organize imports of the current buffer.
    " command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " " Add (Neo)Vim's native statusline support.
    " " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " " provide custom statusline: lightline.vim, vim-airline.
    " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " " Mappings for CoCList
    " " Show all diagnostics.
    " nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " " Manage extensions.
    nnoremap <silent><nowait> <space>ee  :<C-u>CocList extensions<cr>
    nnoremap <silent><nowait> <space>m  :<C-u>CocList marketplace<cr>
    nnoremap <silent><nowait> <space>p  :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <space>l  :<C-u>CocList <cr>
    " " Show commands.
    " nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " " Find symbol of current document.
    " nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " " Search workspace symbols.
    " nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " " Resume latest coc list.
    " nnoremap <silent><nowait> <space>j  :<C-u>CocListResume<CR>

"" }}}

" if (empty($TMUX))
"   if (has("nvim"))
"     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif
