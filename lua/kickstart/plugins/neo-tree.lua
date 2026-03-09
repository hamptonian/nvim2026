-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'Toggle file tree', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    filesystem = {
      filtered_items = {
        visible = false, -- Show hidden files by default
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      window = {
        width = 25, -- Make neo-tree narrower (default is 40)
        mappings = {
          ['<leader>e'] = 'close_window',
        },
      },
    },
  },
}
