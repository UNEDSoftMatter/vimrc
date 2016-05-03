 ~/.vimrc
=========

Required external plugins
-------------------------

- Uses textformat plugin http://www.vim.org/scripts/script.php?script_id=2324
   On a paragraph, in normal mode the code '\aj' (without quotes) auto justify
   the paragraph to 80 cols per row.
- Uses tex_autoclose plugin http://www.vim.org/scripts/script.php?script_id=920
   In a .tex file, after opening an environment with \begin{env} you can type
   <C-c> in insert mode to put, automatically, the respective \end{env}.
- Uses latex-suite plugin http://sourceforge.net/projects/vim-latex/
   Can be installed trought apt-get install vim-latexsuite
   and configured with vim-addons install latex-suite
- Uses colorized color scheme (should be installed with xterm support)
   http://ethanschoonover.com/solarized


Personalized commands
---------------------

- C-E  Open explorer 
- tt   New tab
- tn   Next tab 
- :hi1 Activate highlight of the current line
- :hi0 Deactivate highlight of the current line 


Some useful tips built-in vim
-----------------------------

g Ctrl-G: Show information about number of lines, characters and words in
          a block or the full text

