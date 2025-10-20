let platform = uname | $in.operating-system | str downcase
let macos = "darwin"
let windows = "ms/windows (windows 11)"
let linux = "gnu/linux"

if $platform == $macos {
	$env.PATH ++= [
		/usr/local/bin,
		/System/Cryptexes/App/usr/bin,
		/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin,
		/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin,
		/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin,
		/opt/homebrew/bin

		# /usr/bin,
		# /bin,
		# /usr/sbin,
		# /sbin,
	]
}

if $platform == $windows {
    $env.Path ++= [
        r#'C:\Users\djieu\scoop\apps\gpg4win\current\GnuPG\bin'#
        r#'C:\Users\djieu\scoop\apps\gpg4win\current\Gnu4win\bin'#
        r#'C:\Users\djieu\go\bin'#
        r#'C:\Users\djieu\scoop\apps\nodejs-lts\current\bin'#
        r#'C:\Users\djieu\scoop\apps\nodejs-lts\current'#
        r#'C:\ProgramData\chocolatey\bin'#
        r#'C:\Users\djieu\AppData\Local\Programs\oh-my-posh\bin\'#
        r#'C:\Users\djieu\scoop\shims'#
        r#'C:\Users\djieu\.cargo\bin'#
        r#'C:\Users\djieu\AppData\Local\Microsoft\WindowsApps'#
        r#'C:\Users\djieu\AppData\Local\Microsoft\WinGet\Links'#
        r#'C:\Users\djieu\AppData\Local\Microsoft\WinGet\Packages\oschwartz10612.Poppler_Microsoft.Winget.Source_8wekyb3d8bbwe\poppler-25.07.0/Library/bin'#
    ]

	$env.POSH_INSTALLER = "ws"
	$env.POSH_THEMES_PATH = r#'C:\Users\djieu\AppData\Local\Programs\oh-my-posh\themes\'#

	$env.BAT_CONFIG_DIR = r#'C:\Users\djieu\scoop\apps\bat\current'#
}

if $platform == $linux {
    $env.PATH ++= [
        "~/dev/bin"
    ]
}

$env.EDITOR = "nvim"

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save -f $"($nu.cache-dir)/carapace.nu"

mkdir ~/.local/share/atuin/
atuin init nu | save -f ~/.local/share/atuin/init.nu

zoxide init nushell | save -f $"($nu.cache-dir)/zoxide.nu"
