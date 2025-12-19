# My aliases
alias lss='tree -L 1'
alias pyserve='python3 -m http.server'
alias bat='batcat'
alias fd='fdfind'
alias check_bat='upower -i $(upower -e | rg "BAT")'
alias exa='exa --icons'
alias checkass='f() {objdump -dC -M intel $1 | bat -l asm --wrap=never};f'

