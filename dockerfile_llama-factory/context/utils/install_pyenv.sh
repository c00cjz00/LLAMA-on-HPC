#!/bin/bash

# add path
echo -e "\n# pyenv" >> ~/.bashrc
echo "export PYENV_ROOT=\$HOME/.pyenv" >> ~/.bashrc
echo "export PATH=\$PYENV_ROOT/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# initialize
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
