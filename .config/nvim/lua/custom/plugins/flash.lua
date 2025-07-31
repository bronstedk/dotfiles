return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    config = function()
      local flash = require 'flash'

      vim.keymap.set({ 'n', 'x', 'o' }, 'gs', flash.jump, { desc = 'Flash', noremap = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'gS', flash.treesitter, { desc = 'Flash Treesitter', noremap = true })
      vim.keymap.set('o', 'r', flash.remote, { desc = 'Remote Flash', noremap = true })
      vim.keymap.set({ 'o', 'x' }, 'R', flash.treesitter_search, { desc = 'Treesitter Search', noremap = true })
      vim.keymap.set('c', '<c-s>', flash.toggle, { desc = 'Toggle Flash Search', noremap = true })
    end,
  },
}
