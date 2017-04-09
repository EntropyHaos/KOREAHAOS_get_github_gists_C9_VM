function convert_file {
    if [ ! -z "$1" ]
    then
        python $GOPATH/pdf-to-markdown/main.py $PWD/$1
    fi
}

if [ -z "$1" ]
then
    echo "You need to pass in a file name!"
else
    echo "arg passed in : $1"
    if [ -d "$1" ]
    then
        echo "$1 is directory! (Wholesale conversion comming soon!)"
    elif [ -a "$1" ]
    then
        echo "$1 is an existing file!"
        convert_file $1
    else
        echo "I do not know what to do with $1"
    fi
fi

