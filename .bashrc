export PATH="$HOME/.local/bin:$PATH"

# History
HISTSIZE=10000
HISTFILESIZE=10000
shopt -s histappend
PROMPT_COMMAND="history -a; history -n"

# Custom prompt (cyan)
PS1='\[\e[36m\]ashh\[\e[0m\] $ '
