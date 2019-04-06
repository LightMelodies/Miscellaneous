set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'

"All of your Plugins must be added before the following line
call vundle#end()            
filetype plugin indent on   
syntax on

"airline
let g:airline_theme='light'

"clipboard
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end

map <silent> =p :r !powershell.exe -Command Get-Clipboard<CR>
"map! <silent> <C-r>= :r !powershell.exe -Command Get-Clipboard<CR>

"mouse
set mouse=a

set smartindent
let g:signify_vcs_list = ['git']
let g:signify_update_on_bufenter = 0
