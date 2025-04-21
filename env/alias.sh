################################
# alias
################################
# zsh
alias ezshrc="vim ~/.zshrc"                           # edit zshc onfig
alias szshrc="source ~/.zshrc"                        # reload zsh config

# helpful terminal commands I use alot
alias del='rm -rf'                                    # delete all the things
alias ports='netstat -anv | grep LISTEN'              # check listening ports
alias py='python3'                                    # shorthand for running python3 scripts

# git
alias gs='git status'                                 # check listening ports 
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpf='git push -f'
alias gca='git commit --amend --no-edit'
alias gt='cd $(git rev-parse --show-toplevel)'
alias grs='git reset --soft'


alias snip='asciinema'                              # https://github.com/asciinema/asciinema