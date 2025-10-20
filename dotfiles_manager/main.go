package main

import (
	"dotfiles/internal/context"
	"dotfiles/internal/installer"
	"dotfiles/internal/stringutil"
	"fmt"
	"log"
)

func main() {
	ignore := []string{
		"install", ".git", ".jj", ".gitignore", "goals.md", "README.md",
		"/dotfiles", "dotfiles_manager",
	}
	ignore = append(ignore, stringutil.Dupl(".sops.yaml", ".yaml", ".yml")...)
	ignore = append(ignore, stringutil.Dupl(".rules.yaml", ".yaml", ".yml")...)

	ctx := context.New()

	target, err := stringutil.ExpandHome("~/Documents/.config", *ctx)
	if err != nil {
		log.Fatal(err)
	}

	installer, err := installer.NewInstaller(".", target, ignore, ctx)
	if err != nil {
		log.Fatal(err)
	}

	if err := installer.Run(); err != nil {
		log.Fatal(err)
	}

	fmt.Println("Installation complete.")
}
