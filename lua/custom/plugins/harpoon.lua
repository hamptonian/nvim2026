---@module 'lazy'
---@type LazySpec
return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- Keymaps for harpoon
    vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, { desc = '[H]arpoon [A]dd' })
    vim.keymap.set('n', '<leader>hm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon [M]enu' })

    -- Quick file navigation 1-4
    vim.keymap.set('n', '<leader>h1', function() harpoon:list():select(1) end, { desc = 'Harpoon File 1' })
    vim.keymap.set('n', '<leader>h2', function() harpoon:list():select(2) end, { desc = 'Harpoon File 2' })
    vim.keymap.set('n', '<leader>h3', function() harpoon:list():select(3) end, { desc = 'Harpoon File 3' })
    vim.keymap.set('n', '<leader>h4', function() harpoon:list():select(4) end, { desc = 'Harpoon File 4' })

    -- Navigation between harpooned files
    vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = '[H]arpoon [N]ext' })
    vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = '[H]arpoon [P]revious' })
  end,
}
