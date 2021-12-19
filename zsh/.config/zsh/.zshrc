# __     __         _       _     _           
# \ \   / /_ _ _ __(_) __ _| |__ | | ___  ___ 
#  \ \ / / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#  \ V / (_| | |  | | (_| | |_) | |  __/\__ \
#    \_/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

source ~/.config/zsh/variables

#  _____ _                         
# |_   _| |__   ___ _ __ ___   ___ 
#   | | | '_ \ / _ \ '_ ` _ \ / _ \
#   | | | | | |  __/ | | | | |  __/
#   |_| |_| |_|\___|_| |_| |_|\___|
                                 
source ~/.config/zsh/theme

#  ____  _             _           
# |  _ \| |_   _  __ _(_)_ __  ___ 
# | |_) | | | | |/ _` | | '_ \/ __|
# |  __/| | |_| | (_| | | | | \__ \
# |_|   |_|\__,_|\__, |_|_| |_|___/
#                |___/             

source ~/.config/zsh/plugins

#        _                                        _     
#   ___ | |__        _ __ ___  _   _      _______| |__  
#  / _ \| '_ \ _____| '_ ` _ \| | | |____|_  / __| '_ \ 
# | (_) | | | |_____| | | | | | |_| |_____/ /\__ \ | | |
#  \___/|_| |_|     |_| |_| |_|\__, |    /___|___/_| |_|
#                              |___/                    

# source $ZSH/oh-my-zsh.sh

#     _    _ _                     
#    / \  | (_) __ _ ___  ___  ___ 
#   / _ \ | | |/ _` / __|/ _ \/ __|
#  / ___ \| | | (_| \__ \  __/\__ \
# /_/   \_\_|_|\__,_|___/\___||___/
                                 
source ~/.config/zsh/aliases

#  _____                 _   _                 
# |  ___|   _ _ __   ___| |_(_) ___  _ __  ___ 
# | |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _|| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/


source ~/.config/zsh/functions



source ~/.oh-my-zsh/plugins/antigen.zsh

export NVM_DIR=~/.nvm
source $NVM_DIR/nvm.sh
# source $(brew --prefix nvm)/nvm.sh

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme
antigen theme awesomepanda

# Tell antigen that you're done
antigen apply

