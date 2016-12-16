* Clone into ~/.vim: 
    git clone https://github.com/fvisin/vim.git ~/.vim

* Install vundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

* Open vim and run `:PluginInstall` to install the plugins 

* Install python flake8 or any other syntax checker allowed by syntastic
  Note: installing flake8 with pip on a system with flake8 installed as 
        system package can cause problems. In that case, 
            pip uninstall flake8
            sudo apt-get install python-flake8  --reinstall
  Note also that pylint can cause problems sometimes. If this is the case,
  uninstall it.

* Note: DO NOT install jedi as a system package. If you have it as system package, remove it.

* Read the vimrc docstring to learn about the shortcuts keys of the tools
