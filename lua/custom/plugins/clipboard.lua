---@module 'lazy'
---@type LazySpec
return {
  {
    'which-key.nvim', -- Pseudo-dependency just to ensure this runs after which-key loads
    config = function()
      -- Copy file to clipboard (normal mode: whole file, visual mode: selection)
      vim.keymap.set('n', '<leader>cy', ':silent %y+<CR>', { noremap = true, desc = 'Copy file to clipboard' })
      vim.keymap.set('v', '<leader>cy', '"+y', { noremap = true, desc = 'Copy selection to clipboard' })

      -- Paste from clipboard (without overwriting it)
      vim.keymap.set('n', '<leader>cp', '"+p', { noremap = true, desc = 'Paste from clipboard' })
      vim.keymap.set('v', '<leader>cp', '"+p', { noremap = true, desc = 'Paste from clipboard' })

      -- Copy current line to clipboard
      vim.keymap.set('n', '<leader>cL', ':silent .y+<CR>', { noremap = true, desc = 'Copy line to clipboard' })

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
