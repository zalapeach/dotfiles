# Dotfiles

Vim and terminal config files for OS X and Linux


## Getting started

Make sure you have installed the following software

* Vim
* Git

If you haven't installed the software described above here are some commands to help you:

    # Linux users
    sudo (apt-get|yum|zypper) install vim git git-core exuberant-ctags

    # Mac users
    brew install git vim

Clone the repository and run the install command:

    git clone git://github.com/zalapeach/dotfiles.git ~/.dotfiles; \
      cd ~/.dotfiles; \
      ./install.sh

Enjoy!

## Screenshots

### NeoVim (or Vim) + Terminal emulator

![Vim](https://s14.postimg.org/bg6ti7upd/Screen_Shot_2016_08_22_at_11_58_57_AM.png)


## LICENSE

The MIT License (MIT)

Copyright (c) 2013 Antonio Chávez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Personal note

next time that you wish to add a plugin, go to folder `bundle` and inside of
that folder run:

    git submodule add git://github.com/user/pluginToAdd.git

after that edit the file `vim-for-rails.vim` file and add the following at the
end of the `Bundle` section:

    Bundle 'user/pluginToAdd'

After that just commit your changes.
