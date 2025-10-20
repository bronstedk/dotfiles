package context

import "runtime"

// Context provides information about the current environment.
type Context struct {
	// OS is the operating system.
	OS string
}

// New creates a new Context.
func New() *Context {
	return &Context{
		OS: runtime.GOOS,
	}
}
