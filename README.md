### INSTALLATION

* Clone into ~/.vim: 
  ```
  git clone https://github.com/fvisin/vim.git ~/.vim
  ```
* Install vundle: 
  ```
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ```

* Open vim and run 
  ```
  :PluginInstall
  ```
  to install the plugins 

* Install python flake8 or any other syntax checker allowed by syntastic

* Install YouCompleteMe by running `./install.py --clang-completer` in the 
  `.bundle/YouCompleteMe` directory

### USAGE

* Read the vimrc docstring to learn about the shortcuts keys of the tools

###  Troubleshooting:
  - installing flake8 with pip on a system with flake8 installed as system
    package can cause problems. In that case,
    ```
    pip uninstall flake8
    sudo apt-get install flake8 python-flake8  --reinstall
    ```
  - The pylint or flake8 binaries might use as a shebang the python binary that
    was available during installation (e.g., some conda path, if installed from
    a conda environment) that might not work when the environment is not
    active.  Try replacing it with `#!/usr/bin/python` if the spellcheck
    doesn't work.
  - pylint can interfere with flake8 sometimes. If this is the case, try
    reinstalling or uninstalling it.
  - More generally, running `:SyntasticInfo` can provide some insight on the 
    syntax checkers errors.
  - DO NOT install jedi as a system package. If you have it as system package, remove it.

