
let g:prj_dir="/home/robert/prj"

" Load cscope, tags, and lookup plugin tags
function! LoadIndex()
    let l:_dir=getcwd()
    let l:_ddir=split(_dir, "/")
    "let l:_cdir=get(l:_ddir, len(l:_ddir) - 1)
    let l:_cdir=get(l:_ddir, len(l:_ddir)-1)
    let l:target=g:prj_dir . "/" . l:_cdir . "/" . "cscope.out"
    execute ":normal gg"
    if filereadable(l:target)
        if has("cscope")
            let l:_cmd="cs add " . l:target
            execute l:_cmd
        endif
    endif

    "set tags
    let l:target_tags=g:prj_dir . "/" . l:_cdir . "/" . "tags"
    if filereadable(l:target_tags)
        let l:_t="set tags=" . l:target_tags
        execute l:_t
    endif

    " set file tags for lookup plugin
    let l:target_lookuptags=g:prj_dir . "/" . l:_cdir . "/" . "filetags"
    if filereadable(l:target_lookuptags)
        let g:LookupFile_TagExpr=string(l:target_lookuptags)
       "let _c="let g:LookupFile_TagExpr=" . l:target_lookuptags
       "let _l=split(_c, "=")
       "let _exp=_l[0] . "=" . "\'\"" . _l[1] . "\"\'"
       "execute _exp
       "unlet _exp
       "unlet _l
       "unlet _c
    endif
endfunction

"call LoadIndex()

"map <F7> :call LoadIndex()<cr>
map <leader>l :call LoadIndex()<cr>

map <silent> <leader>wr :call Save_Session()<cr>

function! Save_Session()
    let l:_curdir = getcwd()
    set sessionoptions-=curdir
    set sessionoptions+=sesdir
    let l:_ddir=split(_curdir, "/")
    let l:_cdir=get(l:_ddir, len(l:_ddir) - 1)
    let l:_sessionname="." . l:_cdir . ".session"
    let l:_viminfoname="." . l:_cdir . ".viminfo"
    let l:_cmd="mksession! " . l:_sessionname
    execute l:_cmd
    unlet l:_cmd
    let l:_cmd="wviminfo! " . l:_viminfoname
    execute l:_cmd
    unlet l:_sessionname
    unlet l:_viminfoname
endfunction

map <silent> <leader>rd :call Load_Session()<cr><cr>

function! Load_Session()
    let l:_curdir = getcwd()
    let l:_ddir=split(_curdir, "/")
    let l:_cdir=get(l:_ddir, len(l:_ddir) - 1)
    let l:_sessionname="." . l:_cdir . ".session"
    let l:_viminfoname="." . l:_cdir . ".viminfo"
    if filereadable(l:_sessionname)
        let l:_cmd="source " . l:_sessionname
        execute l:_cmd
        unlet l:_cmd
    endif

    if filereadable(l:_viminfoname)
        let l:_cmd= "rviminfo " . l:_viminfoname
        execute l:_cmd
        unlet l:_cmd
    endif
endfunction

"if filereadable("/home/xiar1/.platypus.vim")
"    source /home/xiar1/.platypus.vim
"endif

"map <silent> <leader>l :call getline(.)<cr>

