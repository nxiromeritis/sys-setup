### .bash_aliases


### ls
# list directory contents
# -A : list entries starting with . (dot), except implied . and ..
# TODO
# add explanations for all options
aliased_la() {
    clear
    if [[ $1 == "" ]]; then
        ls -Ahl --color=auto --group-directories-first --sort=extension --time-style=long-iso
    #elif [[ $1 == "-Ahl" ]]; then
    #    ls -Ahl --color=always --group-directories-first --sort=extension --time-style=long-iso | less -FRX
    else
        # iterate over function arguments
        # http://stackoverflow.com/questions/255898/how-to-iterate-over-arguments-in-bash-script
        for arg in "$@"; do
        # or
        #for arg; do
            ls -Ahl --color=auto --group-directories-first --sort=extension --time-style=long-iso "$arg"
        done
    fi
}
alias la='aliased_la'

aliased_lla() {
    clear
    ls -Ahl --color=always --group-directories-first --sort=extension --time-style=long-iso | less -FRX
}
# TODO
# verify that the output has colors
# http://stackoverflow.com/questions/6592077/bash-prompt-and-echoing-colors-inside-a-function
# http://serverfault.com/questions/26509/colors-in-bash-after-piping-through-less
alias lla='aliased_lla'


### less
# terminal pager
# -F or --quit-if-one-screen
# automatically exit if the entire file can be displayed on the first screen
# -R or --RAW-CONTROL-CHARS
# handle ANSI "color" escape sequences
# -X or --no-init
# don't clear the screen on exit
#alias less='less -FRX'

#aliased_le() {
    #clear
    #if [[ $1 == "" ]]; then
        #less -FRX
    #else
        #for arg in "$@"; do
            #less -FRX "$arg"
        #done
    #fi
#}
#alias le='aliased_le'


### find
#aliased_f() {
    #clear
    #if [[ $1 == "" ]]; then
        #echo "nothing to search for"
    #else
        #find . -name "*$1*"
    #fi
#}
#alias f='aliased_f'


### mkdir
# make directories
# -p, --parents (not added)
# no error if existing, make parent directories as needed
# -v, --verbose
# print a message for each created directory
alias mkdir='mkdir -v'
alias md='mkdir -v'


### du
# estimate file space usage
# -h, --human-readable
# print sizes in human readable format (e.g., 1K 234M 2G)
# -s, --summarize (not added)
# display only a total for each argument
alias du='du -h'


### tree
# list contents of directories in a tree-like format
# -a : print all files
# -C : always colorize output
# -L <level> : limit depth of directory tree to <level>
#alias tree='tree -aC -L 2'


### improve some default settings
alias ..='cd ..'
alias rm='rm -Iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias info='info --vi-keys'
#alias vim='vim -p'
#alias tmux='tmux -2'
#alias pgrep='pgrep -l'
#alias ack='ack-grep --pager="less -FRX"'


### new commands
#alias clipboard='xclip -sel clip '


### df
# report file system disk space usage
# -h, --human-readable
# print sizes in human readable format (e.g., 1K 234M 2G)
alias df='df -h'


### custom
#alias py='python'
#alias py3='python3'


### hash functions
#aliased_md5sum() {
    #if [[ $1 == "" ]]; then
        #md5sum *
    #else
        #for arg in "$@"; do
            #md5sum "$arg"
        #done
    #fi
#}
#alias m5='aliased_md5sum'

#aliased_sha1sum() {
    #if [[ $1 == "" ]]; then
        #sha1sum *
    #else
        #for arg in "$@"; do
            #sha1sum "$arg"
        #done
    #fi
#}
#alias s1='aliased_sha1sum'


### tar
aliased_compress_tgz() {
    if [[ $1 == "" ]]; then
        echo "error: compress_tgz requires a path as an argument"
    else
        # http://stackoverflow.com/questions/1848415/remove-slash-from-the-end-of-a-variable
        # http://www.gnu.org/software/bash/manual/bashref.html#Shell-Parameter-Expansion
        arg=${1%/}
        tar -czvf $arg.tgz $arg
    fi
}
alias compress_tgz='aliased_compress_tgz'

aliased_uncompress_tar() {
    if [[ $1 == "" ]]; then
        echo "error: uncompress_tar requires an archive as an argument"
    else
        tar -xvf $1
    fi
}
alias uncompress_tgz='aliased_uncompress_tar'


### C compilation
aliased_ccompile() {
    arg=$1
    if [[ $arg == "" ]]; then
        echo "ccompile requires a C source file as an argument"
    else
        # filename argument without extension
        # http://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
        gcc -Wall -g $arg -o ${arg%.c}
    fi
}
alias ccompile='aliased_ccompile'


### git
# the standard version control system
################################################################################

### git init
# create an empty git repository or reinitialize an existing one

#aliased_gi() {
    #git init
    #cp $HOME/dotfiles/data/.gitignore .
    #git add .gitignore
    #git commit -m "add .gitignore"
#}
#alias gi='aliased_gi'

#aliased_gii() {
    #git init
    #cp $HOME/dotfiles/data/.gitignore .
    #git add .gitignore
    #git commit -m "add .gitignore"
    #git add .
    #git commit -m "import files"
#}
#alias gii='aliased_gii'



### git add
# add file contents to the index

#alias ga='git add'

# -p, --patch
# Interactively choose hunks of patch between the index and the work tree
# and add them to the index.

#alias gap='git add -p'



### git commit
# record changes to the repository

#alias gc='git commit'

# -a, --all
# Tell the command to automatically stage files that have been modified
# and deleted, but new files you have not told git about are not affected.

#alias gca='git commit -a'



### git status
# show the working tree status

#aliased_gst() {
    #clear
    #git status
#}
#alias gst='aliased_gst'


### git diff
# show changes between commits, commit and working tree, etc

#aliased_gd() {
    #clear
    #if [[ $1 == "" ]]; then
        #git diff
    #else
        #for arg in "$@"; do
            #git diff "$arg"
        #done
    #fi

    # http://stackoverflow.com/questions/2183900/how-do-i-prevent-git-diff-from-using-a-pager
    #git --no-pager diff
#}
#alias gd='aliased_gd'


# --cached
# view the changes you staged for the next commit
# --staged is a synonym of --cached

#aliased_gds() {
    #clear
    #if [[ $1 == "" ]]; then
        #git diff --cached
    #else
        #for arg in "$@"; do
            #git diff --cached "$arg"
        #done
    #fi
#}
#alias gds='aliased_gds'


### git difftool
# show changes using common diff tools

#aliased_gdt() {
    #clear
    #if [[ $1 == "" ]]; then
        #git difftool
    #else
        #for arg in "$@"; do
            #git difftool "$arg"
        #done
    #fi
#}
#alias gdt=aliased_gdt



# git difftool is a frontend to git diff and accepts the same options and
# arguments.

#aliased_gdts() {
    #clear
    #if [[ $1 == "" ]]; then
        #git difftool --cached
    #else
        #for arg in "$@"; do
            #git difftool --cached "$arg"
        #done
    #fi
#}
#alias gdts='aliased_gdts'



### git log
# show commit logs
# --decorate
# print out the ref names of any commits that are shown
# --all
# Pretend as if all the refs in refs/ are listed on the command line as
# <commit>.
# --graph
# Draw a text-based graphical representation of the commit history on the
# left hand side of the output.
# --date=iso (or --date=iso8601)
# shows timestamps in ISO 8601 format.

aliased_gl() {
    clear
    git log --decorate --all --graph --date=iso
}
alias gl='aliased_gl'

# --pretty[=<format>], --format=<format>
# pretty-print the contents of the commit logs in a given format

# oneline
#
# <sha1> <title line>
#
# This is designed to be as compact as possible.
aliased_gll() {
    clear
    git log --decorate --all --graph --pretty=oneline --abbrev-commit
}
alias gll='aliased_gll'

# -p, -u, --patch
# generate patch
#alias glp='git log -p'


### git push
# Update remote refs along with associated objects
#alias gps='git push'


### git pull
# Fetch from and integrate with another repository or a local branch
#alias gpl='git pull'


### git show
# Show various types of objects

#aliased_gsh() {
    #clear
    #if [[ $1 == "" ]]; then
        #git show
    #else
        #git show $1
    #fi
#}
#alias gsh='aliased_gsh'


### /git
################################################################################


# fix bug in running Anaconda Spyder
#alias spyder='unset QT_PLUGIN_PATH && spyder &'
