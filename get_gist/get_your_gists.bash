# This script downloads your gists!

# ToDo : Handle multiple GitHub accounts.
# ToDo : Handle directory already exists issue. 

function do_script {
    mkdir your_gists
    cd your_gists
    test_if_gist_is_installed_install_if_not
    test_if_gist_gem_token_exists_else_set_one_up
    get_gists
    cd ..
}

function test_if_gist_is_installed_install_if_not {
    if $(gem list gist -i)
    then
        echo "Gist ruby gem is installed!"
    else
        gem install gist
    fi
}


function test_if_gist_gem_token_exists_else_set_one_up {
    
    if [ -e ~/.gist ]
    then
        echo "GitHub Auth Token exists!"
    else
        echo "Need to create Auth Token!"
        gist --login
    fi
}

function get_gists {
    wget \
        $(wget -q -O- \
        $(gist -l | \
        grep -Eo '(http|https)://[^ ]+') | \
        grep -oP '"\K[^"\047]+[^"]/raw/[^"]+(?=["\047])' | \
        awk '{print "https://gist.githubusercontent.com"$1}')
}

do_script