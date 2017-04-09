# This line of bash will create a file with a list of all the virtual machines.

# The input file needs to be manually produced...
# log into Cloud9 at : https://c9.io/login
# copy/paste the view source into a file input.html
# Change <user_name> to whatever your user id is.

input_file='input.html'
output_file='virtual_machine_list.txt'
user_name='<user_name>'

cat $input_file | grep -Eo "https://ide.c9.io/$user_name/[a-zA-Z0-9./?=_-]*" | sort | uniq > $output_file
