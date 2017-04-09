:<<EOL
This is the start of a script that loads utilities configures and a Cloud9 
virtual machine to be useful for document conversion.

[STATUS]
in progress

[ToDo]
1. Figure out why it doesn't convert the pdf docs that Konemann supplied!
1. Test compatibility with git manage tools.
2. Create script to automate pdf to markdown using : python $GOPATH/pdf-to-markdown/main.py $PWD/
3. Make above script convert all docs in folder and possibly subfolders.
EOL

function do_update_n_upgrade_on_c9 {
    sudo apt-get update
    sudo apt-get -y upgrade
}

# info : http://pandoc.org/installing.html
function install_pandoc {
    sudo apt-get -y install pandoc
}

# info : http://installion.co.uk/ubuntu/vivid/universe/p/python-pdfminer/install/index.html
# info : https://github.com/euske/pdfminer
function install_pdfminer {
    git clone https://github.com/euske/pdfminer.git
    cd pdfminer
    sudo make cmap
    sudo python setup.py install
    rm -rf .git
    cd ..
}

# info : https://github.com/johnlinp/pdf-to-markdown
# IMPORTANT! : pdfminer needs to be installed!!
function install_pdf_to_markdown {
    cd $GOPATH
    git clone https://github.com/johnlinp/pdf-to-markdown.git
    cd pdf-to-markdown
    rm -rf .git
    cd ..
}

# info : https://plone.org/documentation/manual/installing-plone/installing-on-linux-unix-bsd/debian-libraries
function install_poppler_utils {
    sudo apt-get install -y poppler-utils
}

function run_tests {
    mkdir test_examples
    cd test_examples
    get_example_pdf
    pdftotext example.pdf pdftotext_produced_example.txt
    python ../pdf-to-markdown/main.py example.pdf
    echo "Attempting to rename example.md to pdf-to-markdown_produced_example.md."
    mv example.md pdf-to-markdown_produced_example.md
    echo "Attempting to rename completed."
    cd ..
}

function get_example_pdf {
    wget http://aufbix.org/~bolek/download/guide1.pdf -O example.pdf
}

:<<EOF

do_update_n_upgrade_on_c9
install_pdfminer
install_pdf_to_markdown
install_pandoc
EOF


:<<EOF

# This looks useful but can not figure out how to get it working...

# A live example is here : http://word-to-markdown.herokuapp.com/
gem install word-to-markdown

# The above gem has an unmet dependancy on soffice

# Attempts at configuration...

# sudo add-apt-repository ppa:upubuntu-com/office 
# sudo apt-get update
# sudo apt-get install openoffice
EOF


# This doesn't work!!
# pandoc -f docx -t markdown test.docx -o test_output.markdown