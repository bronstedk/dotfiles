package installer

import "path/filepath"

func (i *Installer) isIgnored(path string) bool {
	for _, ignored := range i.absIgnore {
		if path == ignored {
			return true
		}
	}

	for _, ignored := range i.ignore {
		if filepath.Base(path) == ignored {
			return true
		}
	}

	return false
}
