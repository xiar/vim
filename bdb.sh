#!/bin/sh


prj_dir=~/prj
#*****************************************************************************************************************************************
#
#___________________________________FUNCTION
#
#*****************************************************************************************************************************************
create_cscope_db()
{
    if [ -z "$1" ];then
        exit 1
    fi

    src_dir=$1
    db_name=cscope.out

    if [ -z "$src_dir" ];then
        echo "src_dir NULL"
        exit 1
    fi

    target_dir=$prj_dir/`basename $src_dir`
    if [ ! -d $target_dir ];then
        mkdir -p $target_dir
    fi

	find $src_dir -type f \( -name "*.cc" -or -name "*.cpp" -or -name "*.c" -or -name "*.hpp" -or -name "*.h" \) > $target_dir/cscope.files
	cscope -RbqU  -i $target_dir/cscope.files  -f$target_dir/$db_name
}

create_ctags_db()
{
    if [ -z "$1" ];then
        exit 1
    fi

   target_dir=$prj_dir/`basename $1`

   if [ ! -d $target_dir ];then
       mkdir -p $target_dir
   fi

   cscope_file=$target_dir/cscope.files

   if [ ! -e $cscope_file ];then
       echo "$cscope_file does not exist!!!"
       exit 1
   fi

	ctags -R --c++-kinds=+px --fields=+iaS --extra=+q -f $target_dir/tags -L $target_dir/cscope.files
}

create_lookup_tag()
{
    if [ -z "$1" ];then
        exit 1
    fi

    src_dir=$1

    target_dir=$prj_dir/`basename $src_dir`
    if [ ! -d $target_dir ];then
        mkdir -p $target_dir
    fi

    echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > $target_dir/filetags
    find $src_dir -type f \(  -name "*.cc" -or -name "*.cpp" -or -name "*.hpp" -or -name "*.c" -or  -name "*.h"  -or -name "*.xml" \) -printf "%f\t%p\t1\n" | sort -f >> $target_dir/filetags
}

whether_delete_proj_dir()
{
    if [ $# -lt 2 ];then
        exit 1
    fi

    if [ -z "$1" ];then
        exit 1
    fi

    target_dir=$prj_dir/`basename $1`
    prompt=$2

    if [ -z "$target_dir" ];then
        echo "target_dir NULL"
        exit 1
    fi

    yes_or_no="n"

    if $prompt;then
        read -p "Do you want to remove old database? " yes_or_no
    fi

    case $yes_or_no in
        y|Y|yes|YES)
            yes=true
            ;;
        n|N|no|NO)
            yes=false
            ;;
        *)
            echo "Invalid input"
            exit 1
            ;;
    esac

    if $yes;then
        rm -rf $target_dir
    fi
}

create_index()
{
    # Check if you installed cscope and ctags

    if [ ! -e `which cscope` ]; then 
        echo "cscope is not installed. Please install first."
        exit 0
    fi

    if [ ! -e `which ctags` ];then
        echo "ctags is not installed. Please install first."
        exit 0
    fi

    whether_delete_proj_dir $1 false
    create_cscope_db $1
    create_ctags_db $1
    create_lookup_tag $1
}


#///////////////////////////////////////////////////////////////////////////////////////
#
#   entry
#
#//////////////////////////////////////////////////////////////////////////////////////

if [ ! -d $prj_dir ];then
    mkdir -p $prj_dir
fi

create_index $1

exit 0
