package installer

import (
	"fmt"
	"io"
	"io/fs"
	"os"
	"path/filepath"
	"strings"
	"text/template"

	"github.com/go-errors/errors"
)

func (i *Installer) handleFile(entry fs.DirEntry, current path) {
	srcPath := filepath.Join(current.src, entry.Name())
	dstPath := filepath.Join(current.dst, entry.Name())

	if err := i.copyFile(srcPath, dstPath); err != nil {
		fmt.Printf("Error copying file from %s to %s: %s\n", srcPath, dstPath, err)
	}
}

func (i *Installer) handleTemplate(entry fs.DirEntry, current path) {
	srcPath := filepath.Join(current.src, entry.Name())
	dstPath := filepath.Join(current.dst, strings.TrimSuffix(entry.Name(), ".tmpl"))

	t, err := template.ParseFiles(srcPath)
	if err != nil {
		fmt.Printf("Error parsing template %s: %s\n", srcPath, err)
		return
	}

	file, err := os.Create(dstPath)
	if err != nil {
		fmt.Printf("Error creating file %s: %s\n", dstPath, err)
		return
	}
	defer file.Close()

	if err := t.Execute(file, i.ctx); err != nil {
		fmt.Printf("Error executing template %s: %s\n", srcPath, err)
	}
}

func (i *Installer) copyFile(src, dst string) error {
	sourceFile, err := os.Open(src)
	if err != nil {
		return errors.Wrap(err, 0)
	}
	defer sourceFile.Close()

	destinationFile, err := os.Create(dst)
	if err != nil {
		return errors.Wrap(err, 0)
	}
	defer destinationFile.Close()

	_, err = io.Copy(destinationFile, sourceFile)
	return err
}
