# 🧩 your dotfiles manager — planned architecture overview

## 2. **install-script precedence**

* each directory can contain an `install.nu`.
* if present, the manager **runs that script first and stops there**.
* this gives you full manual control when you need it — “user wins over automation.”

## 3. **per-directory `.rules.yaml`**

* every directory can have a `.rules.yaml` describing when it should apply.
* supports at least:

  ```yaml
  only_on: ["linux", "macos", "windows"]
  ```

* lets you keep one unified tree instead of `./linux`, `./macos`, etc.
* future extensions could add `skip_files`, or `mode: link`.

## 5. **templating integration (Go helper)**

* nushell handles orchestration and passes files to a small **Go templater** binary.
* go performs text/template rendering with full language features
and returns the rendered file.
* this separates responsibilities:

  * **nushell** → policy, rules, orchestration
  * **go** → fast, safe templating engine

## 6. **hash-based caching**

* each rendered file will store a **composite SHA256 hash** of:

  * template file content
  * variable context (JSON)
  * templater binary/version
* stored in a simple JSON manifest (e.g., `.cache.json`).
* on subsequent runs, if hashes match → skip rendering;
else → re-render and update cache.

## 8. **future quality-of-life features**

* optional `--dry-run` flag for safe previews.
* progress or summary output.

## 9. **remaining dotfiles**

### 1. **macos**

* aerospace
* sketchybar

### 2. **linux**

* hypr
* waybar

### 3. **both**

* git
* jj
