source ~/.config/nushell/catppuccin_mocha.nu
source ~/.cache/carapace/init.nu
source ~/.zoxide.nu
source ~/.local/share/atuin/init.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

alias ls = ls -a
alias cd = z
alias cdi = zi
alias mc = mc --nosubshell --nocolor

def "config dotfiles" [] {
  cd "~/dotfiles"
  nvim .
}
def "config zsh" [] {
  cd "~/dotfiles"
  nvim .zshrc
}
def "config nvim" [] {
  cd "~/dotfiles/.config/nvim"
  nvim .
}
def "config aerospace" [] {
  cd "~/dotfiles/.config/aerospace"
  nvim aerospace.toml
}

# Generates a specified number of daily progress note files by copying a template
# and appending incremented dates to the filenames. Updates the last used date in 'last_date.json'.
#
# Parameters:
#   --num_files (-n): int
#     The number of files to generate. Must be a positive integer.
#
# Usage:
#   genDocFiles --num_files 5
def "custom genDocFiles" [ --num_files (-n): int, --last_date (-l): string = ""] {
  if ($num_files == null or $num_files <= 0) {
    error make {msg: "Please provide a positive integer for --num_files."}
  }
  cd /Volumes/BK_PSSD_T7/Documents/shema/

  let dir = "./templates/"
  let target_dir = "./daily_notes/"
  let file = "DAILY  PROGRESS NOTES FORM.docx"
  let last_date_file = ($dir + "last_date.json")
  let date_format = "%m-%d-%Y"
  let og_file = $dir + $file

  if not ($og_file | path exists) {
    error make {msg: $"Source file not found: ($og_file)"}
  }
  if not ($target_dir | path exists) {
    mkdir $target_dir
  }

  mut date: datetime = open $last_date_file | from json | into datetime
  if $last_date != "" {
    $date = $last_date | into datetime
  }
  mut prefix: string = $date | format date $date_format
  mut count: int = 0

  while $count < $num_files {
    let target_file = ($target_dir + $prefix + " " + $file)
    try {
      cp $og_file $target_file
      print $"Created file: ($target_file)"
    } catch {
      print $"Failed to create file: ($target_file)"
    }

    $count += 1
    $date = $date + 1day
    $prefix = ($date | format date $date_format)
  }

  $date | to json | save -f $last_date_file
  "done"
}

def "custom groupFiles" [maxSize: filesize = 5mb, --move (-m)] {
  let files: table<name: string, size: filesize> = ls -a
  | where type == file
  | where name != ".DS_Store"
  | sort-by size
  | reverse
  | select name size

  mut chunks: list<list<string>> = []
  mut currentChunk: list<string> = []
  mut currentSize = 0mb
  mut oversized: list<string> = []

  for file in $files {
    if $file.size > $maxSize {
      $oversized = $oversized ++ [$file.name]
      continue
    }

    if ($currentSize + $file.size) <= $maxSize {
      $currentChunk = $currentChunk ++ [$file.name]
      $currentSize = $currentSize + $file.size
    } else {
      if ($currentChunk | length) != 0 {
        $chunks = $chunks ++ [$currentChunk]
      }
      $currentChunk = [$file.name]
      $currentSize = $file.size
    }
  }

  if ($currentChunk | length) != 0 {
    $chunks = $chunks ++ [$currentChunk]
  }

  mut folderIndex = 1
  for chunk in $chunks {
    let folderName = $"chunk_($folderIndex)"

    if not ($folderName | path exists) {
      mkdir $folderName
    }

    for fname in $chunk {
      if $move {
        mv $fname $"./($folderName)/($fname)"
      } else {
        cp $fname $"./($folderName)/($fname)"
      }
    }

    $folderIndex = $folderIndex + 1
  }

  if ($oversized | length) != 0 {
    let oversizedDir = "oversized"
    mkdir $oversizedDir
    for bigFile in $oversized {
      if $move {
        mv $bigFile $"./($oversizedDir)/($bigFile)"
      } else {
        cp $bigFile $"./($oversizedDir)/($bigFile)"
      }
    }
  }

  "done"
}

def "scrcpy custom" [] {
  scrcpy --no-mouse-hover --power-off-on-close --stay-awake --window-borderless
}

def "touch -custom" [...files: string] {
  for $file in $files {
    let spilt = $file | split row "/" | last
    let folder = $file | split row "/" | drop | str join "/"

    mkdir $folder
    touch $file
  }
}

fastfetch
