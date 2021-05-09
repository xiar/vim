set number
set nocp
set nocompatible
set nobackup
set hlsearch
set incsearch
syntax on
" set cursorline
set ignorecase
" Set auto read when a file is changed from the outside
set autoread

set fdm=marker

set autowrite
"set autowritell
set autoread
set iskeyword=a-z,A-Z,48-57,_

"if has('mouse')
"    set mouse=a
"endif

" Set TAB and BLANK
set list
set listchars=tab:\|\ ,
"highlight LeaderTab guifg=#777777
"match LeaderTab /^\t/

"colorscheme anotherdark 
"colorscheme blue
"colorscheme asmanian2
"colorscheme darkblue
" colorscheme slate 
"colorscheme zenburn
"colorscheme solarized
"colorscheme delek
colorscheme molokai
"set background=light
"set cul

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
"set cc=120

filetype off
" auto indent
set autoindent
" smart indent
" set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

" show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" When searching try to be smart about cases
set smartcase

"disable bell
set noerrorbells
set novisualbell
"set t_vb=
set vb t_vb=
set tm=500

" wrap lines
set wrap

set encoding=utf-8
set ffs=unix,dos,mac
" set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.P

" always show current position
set ruler

set noeb
set noswapfile
set nowb

"Use space instead of Tab
set expandtab
" Be smart when using tabs
set smarttab
let mapleader=","
let g:mapleader=","

mapc

"Tag list, need taglist plugin
let Tlist_Auto_Highlight_Tag=1  
let Tlist_Auto_Update=1  
let Tlist_Display_Tag_Scope=1  
"let Tlist_Enable_Dold_Column=1  
"let Tlist_File_Fold_Auto_Close=1  
"let Tlist_Use_SingleClick=1  
let g:Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Use_Right_Window  = 1
" let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
map <silent> <leader>tt :TlistToggle<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Fast saving
" nmap <leader>w :w!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit positon when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"set viminfo^=%

"vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Check spell
map <leader>ss :setlocal spell!<cr>

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" No highlight search
map <silent> <leader><cr> :noh<cr>

set tags=
"if filereadable("/home/xiar1/tags")
"	set tags=/home/xiar1/tags;
"endif

" set path=/home/xiar1/master_platypus/cdi

function! GenerateDB()
    let l:_cdir = getcwd()
    let l:_cmd = "/data/bdb.sh " . l:_cdir
    let l:_resp = system(l:_cmd)
    unlet l:_resp
    unlet l:_cmd
endfunction
map <F6> :call GenerateDB()<cr>

map <silent> <leader>ee :e ~/.vimrc<cr>

call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

";;;;;;;;;;;;;;;;;;;;;;;;;;;new add here;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
"preview
set previewheight=20
nmap <A-]> :ptag <C-R>=expand("<cword>")<CR><CR>
nmap <A-[> :pclose<cr>

let Grep_Default_Filelist = '*.[ch]'

let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

"set cscopequickfix=s-,c-,d-,i-,t-,e-

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line
"map <C-n> :cnext<cr>
"map <C-p> :cprev<cr>

set wildmode=list:full
set wildmenu

" // The switch of the Source Explorer
"nmap <F8> :SrcExplToggle<CR>

" // Set the height of Source Explorer window
"let g:SrcExpl_winHeight = 8
"
" // Set 100 ms for refreshing the Source Explorer
"let g:SrcExpl_refreshTime = 100
"
" // Set "Enter" key to jump into the exact definition context
"let g:SrcExpl_jumpKey = "<ENTER>"
"
" // Set "Space" key for back from the definition context
"let g:SrcExpl_gobackKey = "<SPACE>"
"
" // In order to avoid conflicts, the Source Explorer should know what plugins "
" // except itself are using buffers. And you need add their buffer names into "
" // below listaccording to the command ":buffers!"
"
"let g:SrcExpl_pluginList = [
"      \ "__Tag_List__",
"      \ "_NERD_tree_"
"  \ ]
" // Enable/Disable the local definition searching, and note that this is not  "
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. "
" // It only searches for a match with the keyword according to command 'gd'
"let g:SrcExpl_searchLocalDef = 1
"
" // Do not let the Source Explorer update the tags file when opening
"let g:SrcExpl_isUpdateTags = 0
"
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to "
" //  create/update a tags file
"  let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
"
" // Set "<F12>" key for updating the tags file artificially
" let g:SrcExpl_updateTagsKey = "<F12>"
"
" // Set "<F3>" key for displaying the previous definition in the jump list
"let g:SrcExpl_prevDefKey = "<F3>"
"
" // Set "<F4>" key for displaying the next definition in the jump list
"let g:SrcExpl_nextDefKey = "<F4>" 

"map <F1> :call ToggleSketch()<CR>
";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

""""""""""""""""""""""""""""""
" lookupfile setting
" """"""""""""""""""""""""""""""
" need lookupfile plugin
let g:LookupFile_MinPatLength = 1       
let g:LookupFile_PreserveLastPattern = 0 
let g:LookupFile_PreservePatternHistory = 1 
let g:LookupFile_AlwaysAcceptFirst = 1 
let g:LookupFile_AllowNewFiles = 0    
let g:LookupFile_FileFilter = '\.class$\|\.o$\|\.obj$\|\.exe$\|\.jar$\|\.zip$\|\.war$\|\.ear$\|\.ko$\|\.order$'
nmap <silent> <leader>lk :LUTags<cr>
nmap <silent> <leader>ll :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>

"nmap <silent> <leader>l :ls<cr>

" require to install cscope
if has("cscope")
	set cscopetag
	if $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

    set cst
    set csto=0
    set nocsverb
    set cspc=3

	map <leader>s :scs find s <C-R>=expand("<cword>")<cr><cr>
	map <leader>g :scs find g <C-R>=expand("<cword>")<cr><cr>
	map <leader>c :scs find c <C-R>=expand("<cword>")<cr><cr>
	map <leader>t :scs find t <C-R>=expand("<cword>")<cr><cr>
	map <leader>e :scs find e <C-R>=expand("<cword>")<cr><cr>
	map <leader>f :scs find f <C-R>=expand("<cfile>")<cr><cr>
	map <leader>i :scs find i ^<C-R>=expand("<cfile>")<cr>$<cr>
	map <leader>d :scs find d <C-R>=expand("<cword>")<cr><cr>
endif

" Load workspace
if filereadable("/root/workspace.vim")
    "source /root/.workspace.vim
    source ${HOME}/workspace.vim
endif

"vmap <silent> q <ESC>
"map <silent> <leader>3 #
"map <silent> <leader>8 * 


"How to add same character to the head of multi-line
" 1. <C-v> selects multi-line
" 2. <Shift-i> enters into insert mode
" 3. Pressing 'ESC' to exit insert mode

" Reference sample @
" http://amix.dk/vim/vimrc.html

"map <silent> <leader>m :make -j24<cr>

"let g:acp_enableAtStartup = 0
" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplcache#smart_close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplcache_force_omni_patterns')
"  let g:neocomplcache_force_omni_patterns = {}
"endif
"let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
"set nocompatible              " be iMproved, required
"filetype off                  " required


  
filetype plugin on  
autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType javascr.pt set omnifunc=javascriptcomplete#CompleteJS  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP  
autocmd FileType c set omnifunc=ccomplete#Complete  
   
let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'  
let g:vim_markdown_folding_disabled=1

" let g:ConqueTerm_CloseOnEnd=1
" let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
map <leader>t :terminal<cr>

" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_prompt_expr =
"\ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
"let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
"map <leader>o :VimShell<cr>
"map <leader>c :VimShellClose<cr>

hi Comment ctermfg=lightblue

set t_Co=256
let g:go_version_warning = 0
let g:go_disable_autoinstall = 0

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


autocmd FileType javascript,html,css,xml,yml,yaml set ai
autocmd FileType javascript,html,css,xml,yml,yaml set sw=2
autocmd FileType javascript,html,css,xml,yml,yaml set ts=2
autocmd FileType javascript,html,css,xml,yml,yaml set sts=2

" YouCompleteMe plugin configuration
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" vim-fugitive configuration
map <silent> <leader>gl :G log --graph<cr>
map <silent> <leader>gs :G status<cr>
map <silent> <leader>gd :G diff<cr>

" shortcut for switching windows
noremap <c-j> <down>
noremap <c-j> <down>
noremap <c-k> <up>
noremap <c-l> <right>
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" setup nerdtree

" <Nerdtree>-------------------{
    ">> Basic settings

        map <C-f> :NERDTreeToggle<CR>
        let g:NERDTreeChDirMode = 2  "Change current folder as root
        autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |cd %:p:h |endif
    ">> UI settings
        " let NERDTreeQuitOnOpen=1   " Close NERDtree when files was opened
        let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)
        let NERDTreeDirArrows=1    " Display arrows instead of ascii art in NERDTree
        let NERDTreeChDirMode=2    " Change current working directory based on root directory in NERDTree
        let g:NERDTreeHidden=1     " Don't show hidden files
        let NERDTreeWinSize=30     " Initial NERDTree width
        let NERDTreeAutoDeleteBuffer = 1  " Auto delete buffer deleted with NerdTree
        "let NERDTreeShowBookmarks=0   " Show NERDTree bookmarks
        let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__']   " Hide temp files in NERDTree
        "let g:NERDTreeShowLineNumbers=1  " Show Line Number
    " Open Nerdtree when there's no file opened
        "autocmd vimenter * if !argc()|NERDTree|endif
    " Or, auto-open Nerdtree
        "autocmd vimenter * NERDTree
    " Close NERDTree when there's no other windows
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " Customize icons on Nerdtree
        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
 
    ">> NERDTREE-GIT
        " Special characters
    let g:NERDTreeIndicatorMapCustom = { 
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
    \ }
 
    ">> NERDTree-Tabs
        "let g:nerdtree_tabs_open_on_console_startup=1 "Auto-open Nerdtree-tabs on VIM enter
    ">> Nerdtree-devicons
        "set guifont=DroidSansMono_Nerd_Font:h11
    ">> Nerdtree-syntax-highlighting
        "let g:NERDTreeDisableFileExtensionHighlight = 1
        "let g:NERDTreeDisableExactMatchHighlight = 1
        "let g:NERDTreeDisablePatternMatchHighlight = 1
        "let g:NERDTreeFileExtensionHighlightFullName = 1
        "let g:NERDTreeExactMatchHighlightFullName = 1
        "let g:NERDTreePatternMatchHighlightFullName = 1
        "let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
        "let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
        "let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" }
