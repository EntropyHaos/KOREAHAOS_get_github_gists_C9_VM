# THIS WORKS!! (WootWoot!!)

# bash <(curl -s https://gist.githubusercontent.com/KoreaHaos/40f246eca7ab508804bea4c78e84a3a7/raw/230384250364c7c43d714fdc678fa2098e8039b0/build_kanboard_on_c9.bash)


# A Bash Comment block, the line of code below, up untill the 'END' line are passed over and not run.
: <<'END'
What is this?
This script downloads, installs dependencies, and creates a file to run the Apache2 server that serves up the Kanboard WebApp.
It has been sucesfully ran on the Cloud9 online IDE.
  * Run the gist from the root of a fresh vm and you should get the Kanboard project management webapp installed and simple bash script that starts up the Apache2 server.
  * Or, copy/paste the comment on line 2 into terminal and the script will be run. (it's easier...)
  * Once it is started, you can view access app by choosing the 'preview running application' option from the Cloud9 IDE toolbar.
END


sudo apt-get update
sudo apt-get install -y php5 php5-sqlite php5-mysql php5-pgsql php5-ldap php5-gd php5-json php5-mcrypt unzip

sudo wget http://kanboard.net/kanboard-latest.zip
sudo unzip kanboard-latest.zip
sudo chown -R www-data:www-data kanboard/data
sudo rm kanboard-latest.zip

cat << EOT >> index.html
<!-- redirect to the kanboard login screen -->

<meta http-equiv="refresh" content="0; url=kanboard/" />
EOT

cat << EOT >> startup_server.bash
/etc/init.d/apache2 start
EOT


cd kanboard
sudo chmod 777 data

# Starts the server. ( ToDo : Consider deleting this.)
/etc/init.d/apache2 start


# ToDo: Set up the comments for the autodoc process.
