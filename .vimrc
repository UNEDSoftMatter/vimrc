" ~/.vimrc
" Uses textformat plugin http://www.vim.org/scripts/script.php?script_id=2324
"   On a paragraph, in normal mode the code '\aj' (without quotes) auto justify
"   the paragraph to 80 cols per row.
" Uses tex_autoclose plugin http://www.vim.org/scripts/script.php?script_id=920
"   In a .tex file, after opening an environment with \begin{env} you can type
"   <C-c> in insert mode to put, automatically, the respective \end{env}.
" Uses latex-suite plugin http://sourceforge.net/projects/vim-latex/
"   Can be installed trought apt-get install vim-latexsuite
"   and configured with vim-addons install latex-suite
" Uses colorized color scheme (should be installed with xterm support)
"   http://ethanschoonover.com/solarized
"
" Some useful tips built-in vim
" g Ctrl-G Show information about number of lines, characters and words in
"          a block or the full text
"
" Last update:  8th Jun 2010
" Last update: 23th Feb 2011
" Last update: 24th Feb 2011
" Last update: 15th Mar 2011
" Last update: 13th Sep 2011
" Last update:  3th Oct 2011
" Last update: 28th Oct 2011
" Last update: 21th Nov 2011
"      Added a box for subsections in LaTeX. TODO: adapt the box to the type of archive
" Last update:  5th Nov 2015
"      Added solarized color scheme
" Last update: 12th Nov 2015
"      Added a sh header 
" Last update: 15th Apr 2016
"      Added highlight syntax for LineNumber
"      :hi1 enable  highlight current line
"      :hi0 disable highlight current line
" Last update:  3rd May 2016
"      Added header for .lmp files
"      Added (de)comment for .lmp files
" Last update: 22nd Nov 2016
"      Added (de)comment for .py files
"      Added support for Markdown files (HT https://github.com/JamshedVesuna/vim-markdown-preview)
"      :w write a temporary html file (needs markdown)
"      <C-P> open a lynx terminal with the file
"
" Author:     Jaime Arturo de la Torre
" Contact:    jatorre@fisfun.uned.es
" LastUpdate: 22nd Nov 2016
"
" 

" Basic configuration
syntax enable                                  " Enable syntax
au BufRead,BufNewFile *.cu set filetype=cpp    " CUDA syntas equals CPP
set number                                     " Enable line number
set autoindent                                 " Autoindent code
set smartindent
set expandtab                                  " <TAB> equals 4 spaces
set tabstop=2                                  " 
set shiftwidth=2                               " 
" set tw=80                                    " Wrap text to 80 cols
set encoding=utf8                              " Use UTF8
try                                            
    lang es_ES
catch
endtry

" Comment and decomment lines in BASH/GNUPLOT/PYTHON
au BufNewFile,BufRead *.{sh,gp,lmp,py} :vmap cc :s/^/# <CR>
au BufNewFile,BufRead *.{sh,gp,lmp,py} :vmap dcc :s/^# /<CR>

" Comment and decomment lines in FORTRAN 90
au BufNewFile,BufRead *.f90 :vmap cc :s/^/! <CR>
au BufNewFile,BufRead *.f90 :vmap dcc :s/^! /<CR>

" Comment and decomment lines In C, C++, CUDA and POV-ray
au BufNewFile,BufRead *.{c,cpp,cu,pov} :vmap cc :s/^/\/\/ <CR>
au BufNewFile,BufRead *.{c,cpp,cu,pov} :vmap dcc :s/^\/\/ /<CR>

" Comment and decomment lines in LaTeX
au BufNewFile,BufRead *.{tex} :vmap cc :s/^/% <CR>
au BufNewFile,BufRead *.{tex} :vmap dcc :s/^% /<CR>

" Launch Explore
map <C-E> :Explore<CR>

" TABS management
map tt :tabnew<CR>
map tn :tabnext<CR>

" Font specs for gvim
" if has("gui_running")
"     set co=120
"     set lines=30
"     set gfn=Monospace\ 13
" endif

" Write header
au BufNewFile *.{c,cpp,cu} so ~/.vim/header_c.txt
au BufNewFile *.{f,f90}    so ~/.vim/header_fortran.txt
au BufNewFile *.{tex}      so ~/.vim/header_tex.txt
au BufNewFile *.{sh,lmp}   so ~/.vim/header_sh.txt
au BufNewFile *.{f,f90,c,cpp,cu,tex,sh,lmp} exe "1,10g/Filename   :.*/s//Filename   : " .expand("%")
au BufNewFile *.{f,f90,c,cpp,cu,tex,sh,lmp} exe "1,10g/Created    :.*/s//Created    : " .strftime("%d.%m.%Y")
au BufNewFile *.{f,f90,c,cpp,cu,tex,sh,lmp} exe "1,10g/Author     :.*/s//Author     : " .$USERNAME
au BufNewFile *.{f,f90,c,cpp,cu,tex,sh,lmp} exe ":10"
au BufNewFile *.{f,f90,c,cpp,cu,tex,sh,lmp} exe "normal $"
au BufWritePre,filewritepre  *.{f,f90,c,cpp,cu,tex,sh,lmp} execute "normal ma"
au BufWritePre,filewritepre  *.{f,f90,c,cpp,cu,tex,sh,lmp} exe "1,10g/Modified   :.*/s/Modified   :.*/Modified   : " .strftime("%c")
au BufWritePre,filewritepost *.{f,f90,c,cpp,cu,tex,sh,lmp} execute "normal 'a"


map :box <esc>1ki<CR>%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%<esc>j\acji%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%<CR><CR>

" Autoclose opened brackets
" Everytime you open a new bracket vim puts the end bracket
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i

" LaTeX suite options
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
 let g:tex_flavor='latex'

" Fix a maximum of 70 cols per row
" set textwidth=70

" Prevent remote attacks
set nomodeline

" Solarized color scheme 
set background=dark
colorscheme solarized

" Highlight CursorLine
set cursorline
hi CursorLineNr cterm=NONE ctermbg=0 ctermfg=3
map :hi0 :hi CursorLine cterm=NONE ctermbg=0 ctermfg=none<CR>
map :hi1 :hi CursorLine cterm=NONE ctermbg=0 ctermfg=blue<CR>

" Create a html file for Markdown files
" NOTE: Requires markdown (apt-get install markdown)
" BUG:  It requires to write twice in order to work
au BufWritePre *.{md} call system('markdown "' . expand('%:p') . '" > /tmp/vim-markdown-preview.html')
  
" Open a lynx browser for Markdown files
" NOTE: Uses xfce4-terminal
au Filetype markdown,md map <buffer> <C-P> :call system('xfce4-terminal --geometry=80x20 -H -x lynx /tmp/vim-markdown-preview.html &> /dev/null &')<CR>

