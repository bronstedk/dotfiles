$env.config.show_banner = false
$env.config.edit_mode = "vi"

$env.config.highlight_resolved_externals = true

$env.config.history.file_format = "sqlite"

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
