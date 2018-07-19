
if [ $# -eq 0 ]
  then
    echo "dotfile install usage: install <destination for dotfiles>"
    exit 1
fi

# clone submodules
git submodule init
git submodule update

# separate repo mgmt from content dotfiles
mv .git git
mv .gitmodules gitmodules

# copy all content dotfiles to destination
cp -r ./.[^.]* ./scripts $1

