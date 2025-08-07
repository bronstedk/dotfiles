source ~/.config/nushell/catppuccin_mocha.nu
source ~/.cache/carapace/init.nu
source ~/.zoxide.nu
source ~/.local/share/atuin/init.nu

alias ls-builtin = ls
alias eza = eza -lha -s name --icons=always

alias cd = z
alias cdi = zi

alias y = yazi

alias vi = nvim
alias vim = nvim

alias epip = .venv/bin/python -m pip
alias epython = .venv/bin/python

def ls [
  --long (-l), # Get all available columns for each entry (slower; columns are platform-dependent)
  --short-names (-s), # Only print the file names, and not the path
  --full-paths (-f), # display paths as absolute paths
  --du (-d), # Display the apparent directory size ("disk usage") in place of the directory metadata size
  --directory (-D), # List the specified directory itself instead of its contents
  --mime-type (-m), # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
  --threads (-t), # Use multiple threads to list contents. Output will be non-deterministic.
  ...pattern: glob, # The glob pattern to use.
]: [nothing -> table] {
  let pattern = if ($pattern | is-empty) { ['.'] } else { $pattern }

  (
    ls-builtin
    -a
    --long=$long
    --short-names=$short_names
    --full-paths=$full_paths
    --du=$du
    --directory=$directory
    --mime-type=$mime_type
    --threads=$threads
    ...$pattern
  ) | sort-by type name -i
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
  cd /Users/bronstedk/Documents/schema

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

def "scrcpy custom" [] {
  scrcpy --no-mouse-hover --power-off-on-close --stay-awake --window-borderless
}

def "touch -c" [...files: string] {
  for $file in $files {
    let spilt = $file | split row "/" | last
    let folder = $file | split row "/" | drop | str join "/"

    if not ($folder | path exists) {
      mkdir $folder
    }
    touch $file
  }
}
