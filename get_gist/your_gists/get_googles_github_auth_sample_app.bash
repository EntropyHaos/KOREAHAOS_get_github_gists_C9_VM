# It's gist a get_googles_github_auth_sample_app.bash script!
#
# A simple script that gets the github_auth app from GoogleChrome's chrome-app-samples repository and sets it up to be loaded into Chrome.
#
# Source and Credits are at the bottom of the file.
#

mkdir github_auth_temp
cd github_auth_temp
git init
git remote add -f origin https://github.com/GoogleChrome/chrome-app-samples.git
git config core.sparseCheckout true
echo "samples/github-auth" >> .git/info/sparse-checkout
git pull origin master
cd ..
mkdir github_auth_app
cp -r github_auth_temp/samples/github-auth/* github_auth_app/
zip -r github_auth_app github_auth_app
rm -rf github_auth_temp

:<<'EOF'

Credit : Much thanks to Google, Stack Overflow, GitHub, and the Internet in general.

Source : https://github.com/GoogleChrome/chrome-app-samples
Source : http://stackoverflow.com/questions/600079/is-there-any-way-to-clone-a-git-repositorys-sub-directory-only/13738951#13738951
Source : http://schacon.github.io/git/git-read-tree.html#_sparse_checkout
Source : http://vmiklos.hu/blog/sparse-checkout-example-in-git-1-7

If you are so inclined;
checkout the repo https://github.com/KoreaHaos/hello_github_auth_chrome_app for instructions on how to run,
or my blog-post .. for an even more complete write-up.

B.C.Haos
EOF