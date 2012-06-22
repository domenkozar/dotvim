Personal configuration of vim editor. Somewhat still messy, but with good intentions. Use under MIT licence.

Install
=======

::

	$ git clone https://github.com/iElectric/dotvim.git ~/.vim
        $ cd ~/.vim && git submodule init && git submodule update
	$ ln -s ~/.vim/vimrc ~/.vimrc
	$ ln -s ~/.vim/gvimrc ~/.gvimrc


Plugins
=======

- NERDCommenter - add comments in many supported languages
- syntastic - validate syntax of file
- python_matchit - extends support for % functionality


TODO
====

- don't save python on syntaxerror
- add FuzzyFinder
- see what's useful in https://github.com/scrooloose/vimfiles/
