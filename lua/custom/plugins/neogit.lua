---@module 'lazy'
---@type LazySpec
return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'sindrets/diffview.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup()

    -- Open neogit UI - all git operations (commit, push, pull, etc.) are done within the UI
    vim.keymap.set('n', '<leader>gg', neogit.open, { desc = '[G]it Status ([G]neogit)' })
  end,
}
