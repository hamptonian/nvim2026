---@module 'lazy'
---@type LazySpec
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '<leader>fe', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file explorer' },
  },
  opts = {
    sort_by = 'case_sensitive',
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
  },
}
