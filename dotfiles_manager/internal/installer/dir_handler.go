package installer

import (
	"dotfiles/internal/rules"
	"fmt"
	"io/fs"
	"os"
	"path/filepath"
)

func (i *Installer) handleDir(entry fs.DirEntry, current path) {
	next := path{
		src: filepath.Join(current.src, entry.Name()),
		dst: filepath.Join(current.dst, entry.Name()),
	}

	installNuPath := filepath.Join(next.src, "install.nu")
	if _, err := os.Stat(installNuPath); err == nil {
		fmt.Printf("Found install.nu in %s. Skipping directory.\n", next.src)
		// Here we would execute the install.nu script.
		// For now, we just skip the directory.
		return
	}

	ruleFilePath := filepath.Join(next.src, ".rules.yaml")
	if _, err := os.Stat(ruleFilePath); err == nil {
		rules, err := rules.Load(ruleFilePath)
		if err != nil {
			fmt.Printf("Error loading rules from %s: %s\n", ruleFilePath, err)
		} else {
			for _, rule := range rules {
				if rule.AllowOn != "" && rule.AllowOn != i.ctx.OS {
					fmt.Printf("Skipping directory %s because it is not allowed on this OS.\n", next.src)
					return
				}

				if target, ok := rule.Target[i.ctx.OS]; ok {
					next.dst = target
				}
			}
		}
	}

	if err := os.MkdirAll(next.dst, 0755); err != nil {
		fmt.Printf("Error creating directory %s: %s\n", next.dst, err)
		return
	}

	i.stack = append(i.stack, next)
}
