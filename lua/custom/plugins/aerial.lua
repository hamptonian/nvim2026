---@module 'lazy'
---@type LazySpec
return {
  'stevearc/aerial.nvim',
  opts = {
    -- optionally use on_attach to set keymaps when aerial attaches to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr, desc = 'Previous Symbol' })
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr, desc = 'Next Symbol' })
    end,
  },
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local aerial = require 'aerial'

    -- Keymaps for aerial
    vim.keymap.set('n', '<leader>ua', aerial.toggle, { desc = '[U]I [A]erial (Code Outline)' })
  end,
}
