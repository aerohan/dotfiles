
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

