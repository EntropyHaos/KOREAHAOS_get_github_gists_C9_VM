# The build_easy_rtc_on_c9.bash script.

# A Bash Comment block, the line of code below, up untill the 'END' line are passed over and not run.
: <<'END'
What is this?

This script downloads, installs dependencies, and creates a file to run the NodeJS server that demonstrates the Open Source JavaScript EasyRTC bundle.

It has been sucesfully ran on the Cloud9 online IDE.
  * Run the gist with 'bash build_easy_rtc_on_c9.bash'
  * In your project's directory, start it up with 'bash run_demo.bash'
END

# Move to Cloud9 project root.
cd $GOPATH

# Clone the repository from GitHub.
git clone https://github.com/priologic/easyrtc.git

# Change workign directory into the repo's root directory.
cd easyrtc

# Installs dependencies for EasyRTC.
sudo npm install

# Change workign directory into the repo's demo directory.
cd server_example

# Installs dependencies for EasyRTC demos.
sudo npm install

cd ..
cd ..

# Create a file for running the EasyRTC demo server.
cat >run_demo.bash <<EOL
cd easyrtc/server_example
node server.js
EOL
