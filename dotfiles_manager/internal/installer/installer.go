package installer

import (
	"dotfiles/internal/context"
	"os"
	"path/filepath"
	"strings"

	"github.com/go-errors/errors"
)

// Installer provides the functionality to install dotfiles.
// It is responsible for traversing the source directory, copying files,
// and handling special cases like install scripts and rule files.
// The zero value of Installer is not ready to use. Use NewInstaller to create one.
type Installer struct {
	// src is the source directory of the dotfiles.
	src string
	// dst is the destination directory for the dotfiles.
	dst string
	// ignore is a list of files and patterns to ignore.
	ignore []string
	// absIgnore is a list of absolute paths to ignore.
	absIgnore []string
	// stack is a list of paths to process.
	stack []path
	// ctx is the context for the installation.
	ctx *context.Context
}

// path is a struct to hold the source and destination paths.
type path struct {
	src string
	dst string
}

// NewInstaller creates a new Installer with the given source and destination directories.
func NewInstaller(src, dst string, ignore []string, ctx *context.Context) (*Installer, error) {
	wd, err := os.Getwd()
	if err != nil {
		return nil, errors.Wrap(err, 0)
	}

	var absIgnore []string
	var relIgnore []string

	for _, i := range ignore {
		if filepath.IsAbs(i) {
			absIgnore = append(absIgnore, filepath.Join(wd, i))
		} else {
			relIgnore = append(relIgnore, i)
		}
	}

	return &Installer{
		src:       src,
		dst:       dst,
		ignore:    relIgnore,
		absIgnore: absIgnore,
		ctx:       ctx,
	}, nil
}

// Run starts the installation process.
func (i *Installer) Run() error {
	absSrc, err := filepath.Abs(i.src)
	if err != nil {
		return errors.Wrap(err, 0)
	}

	absDst, err := filepath.Abs(i.dst)
	if err != nil {
		return errors.Wrap(err, 0)
	}

	i.stack = []path{{
		src: absSrc,
		dst: absDst,
	}}

	for len(i.stack) > 0 {
		current := i.stack[len(i.stack)-1]
		i.stack = i.stack[:len(i.stack)-1]

		entries, err := os.ReadDir(current.src)
		if err != nil {
			return errors.Wrap(err, 0)
		}

		for _, entry := range entries {
			path := filepath.Join(current.src, entry.Name())
			if i.isIgnored(path) {
				continue
			}

			if entry.IsDir() {
				i.handleDir(entry, current)
			} else if strings.HasSuffix(entry.Name(), ".tmpl") {
				i.handleTemplate(entry, current)
			} else {
				i.handleFile(entry, current)
			}
		}
	}

	return nil
}
