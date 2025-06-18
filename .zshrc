export ANDROID_HOME=~/Library/Android/sdk
export JAVA_HOME=/Users/bronstedk/.sdkman/candidates/java/current
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"

# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# eval "$(starship init zsh)"
# eval "$(atuin init zsh)"
# eval "$(zoxide init zsh)"
# eval $(thefuck --alias)
# eval $(thefuck --alias fk)
# eval "$(starship init zsh)"

# alias ls='eza -lha -s name --icons=always'
# alias cd='z'
# alias cdi='zi'
# alias mc='mc --nosubshell --nocolor'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nu