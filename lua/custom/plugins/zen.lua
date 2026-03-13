---@module 'lazy'
---@type LazySpec
return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      backdrop = 0.95,
      height = 0.9,
      width = 120,
      options = {
        signcolumn = 'no',
        number = false,
        relativenumber = false,
        cursorline = false,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        laststatus = 0,
        showcmd = false,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = false },
    },
  },
  config = function(_, opts)
    local zenmode = require 'zen-mode'
    zenmode.setup(opts)

    -- Keymaps for zen mode
    vim.keymap.set('n', '<leader>uz', zenmode.toggle, { desc = '[U]I [Z]en Mode Toggle' })
  end,
}
