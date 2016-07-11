" LAMMPS custom configuration
if exists("did_load_filetypes")
     finish
endif

augroup filetypedetect
 au! BufRead,BufNewFile *.lmp setfiletype lammps
 au! BufRead,BufNewFile *.gp  setfiletype gnuplot
augroup END

