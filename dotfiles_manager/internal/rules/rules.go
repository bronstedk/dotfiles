package rules

import (
	"os"

	"github.com/go-errors/errors"
	"gopkg.in/yaml.v3"
)

// Rule represents a rule from a .rules.yaml file.
type Rule struct {
	AllowOn string            `yaml:"allow_on"`
	Target  map[string]string `yaml:"target"`
}

// Load loads rules from a file.
func Load(path string) ([]Rule, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, errors.Wrap(err, 0)
	}

	var rules []Rule
	if err := yaml.Unmarshal(data, &rules); err != nil {
		return nil, errors.Wrap(err, 0)
	}

	return rules, nil
}
