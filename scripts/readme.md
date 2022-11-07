# Linux Install 

sudo apt update -y && sudo apt upgrade-full -y
sudo apt install git -y
git clone https://github.com/julian-iaquinandi/dotfiles.git ~/dotfiles
cd ~/dotfiles
./scripts/init.sh

