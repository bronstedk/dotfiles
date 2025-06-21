# env.nu
#
# Installed by:
# version = "0.104.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

let prePath = [
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "/usr/local/bin"
  "/System/Cryptexes/App/usr/bin"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
  "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin"
  "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin"
  "/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"
  "/Library/Apple/usr/bin"
  "/usr/local/MacGPG2/bin"
  "/Library/TeX/texbin"
  "/Users/bronstedk/.config/carapace/bin"
  "/Users/bronstedk/go/bin"
  "/opt/homebrew/opt/postgresql@15/bin"
  "/opt/homebrew/opt/openjdk/bin"
  "/Library/Frameworks/Python.framework/Versions/3.13/bin"
  "/Users/bronstedk/Library/Application Support/carapace/bin"
  "/Users/bronstedk/.sdkman/candidates/kotlin/current/bin"
  "/Users/bronstedk/.sdkman/candidates/java/current/bin"
  "/Users/bronstedk/.sdkman/candidates/gradle/current/bin"
  "/Users/bronstedk/.atuin/bin"
  "/Users/bronstedk/.cargo/bin"
  "/Users/bronstedk/Library/Application Support/JetBrains/Toolbox/scripts"
  "/Users/bronstedk/.rvm/bin"
  "/Users/bronstedk/.pub-cache/bin"
  "/Users/bronstedk/Library/Application Support/JetBrains/Toolbox/scripts"
  ($env.HOME + "/.atuin/bin/env")
]
$env.PATH = $prePath ++ $env.PATH

$env.HOMEBREW_REPOSITORY = "/opt/homebrew"
$env.INFOPATH = "/opt/homebrew/share/info:/opt/homebrew/share/info"
$env.HOMEBREW_CELLAR = "/opt/homebrew/Cellar"

$env.GRADLE_HOME = "/Users/bronstedk/.sdkman/candidates/gradle/current"

$env.SDKMAN_PLATFORM = "darwinarm64"
$env.SDKMAN_CANDIDATES_API = "https://api.sdkman.io/2"
$env.SDKMAN_DIR = "/Users/bronstedk/.sdkman"
$env.SDKMAN_CANDIDATES_DIR = "/Users/bronstedk/.sdkman/candidates"

$env.STARSHIP_CONFIG = $env.Home + "/.config/starship/starship.toml"
$env.ANDROID_HOME = "/Library/Android/sdk"
$env.JAVA_HOME = "/Users/bronstedk/.sdkman/candidates/java/current"
$env.KOTLIN_HOME = "/Users/bronstedk/.sdkman/candidates/kotlin/current"
$env.PKG_CONFIG_PATH = "/opt/homebrew/opt/postgresql@15/lib/pkgconfig"
$env.LDFLAGS = "-L/opt/homebrew/opt/postgresql@15/lib"
$env.CPPFLAGS = "-I/opt/homebrew/opt/postgresql@15/include"
$env.SDKMAN_DIR = $env.HOME + "/.sdkman"

$env.XDG_CONFIG_HOME = $env.HOME + "/.config"

$env.config.show_banner = false

$env.EDITOR = "nvim"
$env.config.edit_mode = "vi"

$env.config.highlight_resolved_externals = true

$env.config.history.file_format = "sqlite"

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
