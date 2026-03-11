---@module 'lazy'
---@type LazySpec
return {
  {
    'which-key.nvim', -- Pseudo-dependency just to ensure this runs after which-key loads
    config = function()
      -- Yank to system clipboard (registers remain independent by default)
      vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { noremap = true, desc = 'Yank to clipboard' })
      vim.keymap.set('n', '<leader>Y', '"+Y', { noremap = true, desc = 'Yank line to clipboard' })
      vim.keymap.set('n', '<leader>ya', ':silent %y+<CR>', { noremap = true, desc = 'Yank all (file) to clipboard' })

      -- Copy file path (relative) to clipboard
      vim.keymap.set('n', '<leader>cf', function()
        vim.fn.setreg('+', vim.fn.expand '%')
        vim.notify('Copied: ' .. vim.fn.expand '%', vim.log.levels.INFO)
      end, { noremap = true, desc = 'Copy file path to clipboard' })

      -- Copy file path:line to clipboard (for bug reports)
      vim.keymap.set('n', '<leader>cl', function()
        local path_and_line = vim.fn.expand '%' .. ':' .. vim.fn.line '.'
        vim.fn.setreg('+', path_and_line)
        vim.notify('Copied: ' .. path_and_line, vim.log.levels.INFO)
      end, { noremap = true, desc = 'Copy path:line to clipboard' })
    end,
  },
}
