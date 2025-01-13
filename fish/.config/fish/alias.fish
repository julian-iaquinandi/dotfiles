# Bindings
bind \cf tmux-sessionizer

# Chat picker
alias chp="~/.config/zsh/plugs/gpttui/chat_picker"

# Git commit message generator
alias gita="git diff | sgpt 'Generate git commit message, for my changes, keep it short, concise and use emojis'"

# ------------------------------ Nvim
alias v="nvim"
alias vim="nvim"
# alias lv="env NVIM_APPNAME=lazy nvim"
# alias o="nvr --remote"
# alias k="nvr --remote-send"

# ------------------------------ Git
alias g="git"
alias gpl="git pull"
alias gd="git diff"
alias ga="git add ."
alias gac="git add . && git commit"
alias gl="git lg"
alias gll="git lg2"
alias gc="git commit"
alias gch="git checkout"
alias gs="~/.config/tmux/scripts/git_status"
alias gps="git push"
alias cgs="clear && git status"
alias lzg="lazygit"

# ------------------------------ Apt-get
alias install="sudo apt install -y"
alias remove="sudo apt purge"
alias update="sudo apt update"
alias upgrade="sudo apt update && sudo apt upgrade"

alias list="sudo dpkg -l"
alias findapp="sudo apt list --installed | grep -i apache"

# ------------------------------ File Ops
alias c="clear"

alias l="eza -l --icons --git -a"
alias ls="eza --icons --git -a"
alias la="eza -l --icons --git"
alias lsa="eza --icons --git"

alias lt="eza --tree --level=2 --long --icons --git -a"
alias lta="eza --tree --level=2 --long --icons --git"

alias lh="ls -d .?*"
alias lha="ls -ld .?*"

alias DELETE="sudo rm -rf"
# alias del="rm -rf"
alias del="trash"
alias rm="trash"

alias es="sudo chmod u+x"
alias aliases="nvim ~/.config/zsh/aliases"

# ------------------------------ Pnpm
alias p="pnpm"
alias pd="pnpm dev"
alias pt="pnpm test"
alias pti="pnpm test:ui"
alias pte="pnpm test:e2e"
alias pb="pnpm build"

# ------------------------------ TMUX
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias tmns="tmux new -s"
alias tmas="tmux a -t"
alias tmks="tmux kill-session -t"
alias tmsc="tmux a -t sysconfig"
alias tmls="tmux list"
alias tma="tmux a"

# ------------------------------ Docker
alias dkrmi="sudo docker rmi (docker images -a -q)"
alias dkrmc="sudo docker ps -a"
alias dkrma="sudo docker rmi (docker images -a -q) && docker ps -a"
alias dk="lazydocker"

# ------------------------------ FZF
alias s="displayFZFFiles"
alias sd="fdFzf"
alias sl="nvimGoToLine"
alias sf="nvimGoToFiles"
