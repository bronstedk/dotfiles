# ======================
# General Configuration
# ======================
$env.config.buffer_editor = "nvim"
$env.config.completions.external.enable = true
$env.config.edit_mode = "vi"
$env.config.highlight_resolved_externals = true
$env.config.history.file_format = "sqlite"
$env.config.history.sync_on_enter = true
$env.config.show_banner = false
$env.config.rm.always_trash = true

# ======================
# Sources
# ======================
source sources.nu

# ======================
# Aliases
# ======================
source aliases.nu

# ======================
# Custom Function
# ======================
source functions.nu

# ======================
# Colors
# ======================
source colors.nu

# ======================
# Extras
# ======================
fastfetch
