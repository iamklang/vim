 git clone https://github.com/iamklang/vim.git .vim
 
 ln -s ~/.vim/vimrc ~/.vimrc
 
 cd .vim/
 git submodule init
 git submodule update
 
 refer : http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
