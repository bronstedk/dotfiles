export ANDROID_HOME="~/Library/Android/sdk"
export JAVA_HOME=`/usr/libexec/java_home`
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval $(thefuck --alias fk)

alias ls='eza -lha -s name --icons=always'

alias cd='z'
alias cdi='zi'

alias y='yazi'

alias vi='nvim'
alias vim='nvim'

alias idea='open -a "/Applications/IntelliJ IDEA CE.app/Contents/MacOS/idea"'

alias epip='.venv/bin/python -m pip'
alias epython='.venv/bin/python'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

fastfetch
