PATH="$PATH:/Users/filippdenisov/bin/flutter/bin"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/Users/filippdenisov/yandex-cloud/path.bash.inc' ]; then source '/Users/filippdenisov/yandex-cloud/path.bash.inc'; fi

# GO
export GOPATH=/Users/filippdenisov/projects/go
export PATH=$GOPATH/bin:$PATH

# Svz
export CON_CONF_PATH=/Users/filippdenisov/projects/svyaznoy/constantine/configs/config.toml

# MySQL
export PATH=$PATH:/usr/local/mysql/bin
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
export PATH=$PATH:/usr/local/share/dotnet 
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Shortcuts
alias ls="exa -lah -s modified -r"
alias l="exa -G"
alias vim="nvim"

# Set default terminal as Starship.io
eval "$(starship init zsh)"
