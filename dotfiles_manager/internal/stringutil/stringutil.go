package stringutil

import (
	"dotfiles/internal/context"
	"errors"
	"os"
	"strings"
)

// Dupl creates a duplicate of a string with a replacement.
func Dupl(s, old, new string) []string {
	return []string{s, strings.Replace(s, old, new, -1)}
}

func ExpandHome(s string, ctx context.Context) (string, error) {
	var expanded string

	homeDir, err := os.UserHomeDir()
	if err != nil {
		return expanded, err
	}
	if strings.Count(s, "~") > 1 {
		return expanded, errors.New("%s contains more than 1 '~' symbol")
	}

	return strings.Replace(s, "~", homeDir, 1), nil
}

func PathSeparation(paths ...string) string {
	newPath := ""
	pathLen := len(paths) - 1

	for i, path := range paths {
		newPath += path

		if pathLen != i {
			newPath += string(os.PathSeparator)
		}
	}

	return newPath
}
