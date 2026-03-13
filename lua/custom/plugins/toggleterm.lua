---@module 'lazy'
---@type LazySpec
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    { '<leader>t1', '<cmd>ToggleTerm direction=vertical<CR>', desc = '[T]erminal 1 (Vertical)' },
    { '<leader>t2', '<cmd>ToggleTerm direction=horizontal<CR>', desc = '[T]erminal 2 (Horizontal)' },
  },
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return vim.o.lines * 0.3
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.3
      end
    end,
    open_mapping = nil, -- Don't set default mapping, we'll use custom keybinds
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = 'vertical',
    close_on_exit = true,
    shell = vim.o.shell,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
    -- Easy exit from terminal mode
    vim.keymap.set('t', '<C-\\>', '<cmd>close<CR>', { noremap = true, desc = 'Close terminal' })
  end,
}
