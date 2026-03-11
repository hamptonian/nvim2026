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

    -- Browse commits in telescope
    vim.keymap.set('n', '<leader>gc', function() require('telescope.builtin').git_commits() end, { desc = '[G]it [C]ommits' })

    -- Browse and checkout branches in telescope
    vim.keymap.set('n', '<leader>gb', function() require('telescope.builtin').git_branches() end, { desc = '[G]it [B]ranches' })

    -- Open diffview to see working tree changes vs HEAD
    vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', { desc = '[G]it [D]iff (Diffview)' })
  end,
}
