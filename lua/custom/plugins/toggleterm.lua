---@module 'lazy'
---@type LazySpec
return {
  'akinsho/toggleterm.nvim',
  version = '*',
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

    -- Vertical terminal (30% width right side)
    vim.keymap.set('n', '<leader>t1', function()
      vim.cmd 'ToggleTerm direction=vertical'
    end, { desc = '[T]erminal 1 (Vertical)' })

    -- Horizontal terminal (30% height bottom)
    vim.keymap.set('n', '<leader>t2', function()
      vim.cmd 'ToggleTerm direction=horizontal'
    end, { desc = '[T]erminal 2 (Horizontal)' })

    -- Easy exit from terminal mode
    vim.keymap.set('t', '<C-\\>', '<cmd>close<CR>', { noremap = true, desc = 'Close terminal' })
  end,
}
