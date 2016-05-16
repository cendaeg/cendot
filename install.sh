#Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable


#Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Install Cask
brew tap phinze/homebrew-cask
brew install brew-cask

#Install brew files
.\brew

#Install Cask Files
sh cask.sh

#Install Prezto
curl -L https://raw.githubusercontent.com/cendaeg/cendot/master/zprezto.sh | sh

#Setup zsh
cp ./.aliases ~/.aliases

#Install Vim files
sh vim.sh

#Install Google Fonts 
curl https://raw.githubusercontent.com/conlinism/all_google_fonts/master/install.sh | sh

source ~/.zshrc
