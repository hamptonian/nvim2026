---@module 'lazy'
---@type LazySpec
return {
  {
    dir = vim.fn.stdpath('config'), -- point to config directory
    name = 'clipboard-mappings', -- give it a name
    dependencies = { 'which-key.nvim' }, -- ensure this runs after which-key loads
    config = function()
      -- Yank motion/selection to system clipboard (+)
      vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { noremap = true, desc = 'Yank to clipboard (+)' })
      vim.keymap.set('n', '<leader>Y', '"+Y', { noremap = true, desc = 'Yank line to clipboard (+)' })

      -- Copy entire file to system clipboard
      vim.keymap.set('n', '<leader>ca', ':silent %y+<CR>', { noremap = true, desc = 'Copy all (file) to clipboard' })

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
