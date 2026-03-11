---@module 'lazy'
---@type LazySpec
return {
  'stevearc/dressing.nvim',
  event = 'VimEnter',
  opts = {
    input = {
      enabled = true,
      default_prompt = 'Input',
      title_pos = 'left',
      insert_only = true,
      start_mode = 'insert',
      border = 'rounded',
      relative = 'editor',
      prefer_width = 40,
      width = nil,
      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },
      buf_options = {},
      win_options = {
        wrap = false,
        list = true,
        listchars = 'precedes:…,extends:…',
        sidescrolloff = 0,
      },
      mappings = {
        n = {
          ['<Esc>'] = 'Close',
          ['<CR>'] = 'Confirm',
        },
        i = {
          ['<C-c>'] = 'Close',
          ['<CR>'] = 'Confirm',
          ['<Up>'] = 'HistoryPrev',
          ['<Down>'] = 'HistoryNext',
        },
      },
    },
    select = {
      enabled = true,
      backend = { 'telescope', 'fzf', 'builtin' },
      trim_prompt = true,
      telescope = nil,
      fzf = {
        window = {
          width = 0.5,
          height = 0.4,
        },
      },
      builtin = {
        show_numbers = true,
        border = 'rounded',
        relative = 'editor',
        buf_options = {},
        win_options = {
          cursorline = true,
          cursorlineopt = 'both',
        },
        width = nil,
        max_width = { 140, 0.8 },
        min_width = { 40, 0.2 },
        height = nil,
        max_height = 0.9,
        min_height = { 10, 0.2 },
        mappings = {
          ['<Esc>'] = 'Close',
          ['<C-c>'] = 'Close',
          ['<CR>'] = 'Confirm',
        },
      },
    },
  },
}
