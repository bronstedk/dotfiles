return {
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      local code_actions = null_ls.builtins.code_actions
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local hover = null_ls.builtins.hover
      local completion = null_ls.builtins.completion

      null_ls.setup {
        sources = {
          -- general
          diagnostics.todo_comments,
          diagnostics.trail_space,

          -- lua
          --          formatting.stylua,
          --  diagnostics.selene,

          -- javascript
          --        formatting.prettier,

          -- html
          --         diagnostics.erb_lint,

          -- go
          code_actions.gomodifytags,
          diagnostics.staticcheck,
          formatting.gofumpt,
          formatting.goimports,

          -- markdown
          hover.dictionary,

          -- python
          diagnostics.mypy,
          formatting.isort,
          formatting.pyink,

          -- kotlin
          diagnostics.ktlint,
          formatting.ktlint,

          -- java
          formatting.google_java_format,

          -- dart
          formatting.dart_format,
        },
      }
    end,
  },
}
