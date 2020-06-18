
# fzf navigation
jumpto()
{
    DIR=$({ \
        find ~/develop/rexlab/ -type d -not -path '*/\.*'; \
        find ~/develop/projects/ -type d -not -path '*/\.*'; \
        for d in ~/develop/{wtfu,vively}; do echo $d; done; \
        for d in ~/develop/explore/*; do echo $d; done; \
        for d in ~/develop/explore/*/*; do echo $d; done; \
    } | fzf)

    echo $DIR
    cd $DIR
}

alias jt="jumpto"

fjobs()
{
    fg $(jobs | fzf | awk '{print $1}' | sed 's/\[//g' | sed 's/\].*//g')
}

alias fj="fjobs"

jupinit()
{
    if [ "$#" -ne 2 ]; then
        echo "Wrong args. Example: \$ jupinit dynamics jl"
        return
    fi

    if [ "$2" == "jl" ]; then
        KERNEL=julia-1.4
    elif [ "$2" == "py" ]; then
        KERNEL=python3
    else
        echo "Unrecognized file extension/kernelspec"
        return
    fi

    touch $1.$2
    jupytext --to notebook $1.$2
    jupytext --set-formats ipynb,$2 $1.$2
    jupytext --set-kernel $KERNEL $1.$2
    echo "Created $1.$2 and $1.ipynb"
}

jupopen()
{
    FILEPATH=$(realpath $1 --relative-to="$HOME/develop")
    URL=http://localhost:8888/tree/$FILEPATH
    open $URL
}

complete -f -X '!*.ipynb' jupopen
