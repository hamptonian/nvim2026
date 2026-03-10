---@module 'lazy'
---@type LazySpec
return {
  'stevearc/oil.nvim',
  keys = {
    { '<leader>e', '<cmd>Oil<CR>', desc = 'Open parent directory', silent = true },
  },
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
    },
    view_options = {
      show_hidden = true,
    },
  },
}
