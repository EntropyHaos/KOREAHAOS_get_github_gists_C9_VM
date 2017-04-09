# this script sets up a vm to run ... (need to put the right word here!)


# First we get the files from GitHub repo : https://github.com/mnielsen/neural-networks-and-deep-learning

wget https://github.com/mnielsen/neural-networks-and-deep-learning/archive/master.zip

# Next we unzip the files.

unzip master.zip

# Make a directory for the task

mkdir run_mnist_thingy

# Make a directory for the data

mkdir data

# Next we copy the files we need.

# This is the base of the command : cp -rf /source/path/ /destination/path/
# (the -rf is a switch with two options; recursive and force. It is very important that you be carefull with the use of the force switch!)

cp -rf neural-networks-and-deep-learning-master/src/* run_mnist_thingy/

cp -rf neural-networks-and-deep-learning-master/data/* data/

# Let's make numpy work!

sudo apt-get update
sudo apt-get -y install python-numpy

cd run_mnist_thingy
cat > do_some_figuring.py <<EOL
import mnist_loader
training_data, validation_data, test_data = mnist_loader.load_data_wrapper()

import network

net = network.Network([784, 30, 10])

net.SGD(training_data, 30, 10, 3.0, test_data=test_data)

EOL

python do_some_figuring.py
