---@module 'lazy'
---@type LazySpec
return {
  'NeogitOrg/neogit',
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', function() require('neogit').open() end, desc = '[G]it Status ([G]neogit)' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    { 'sindrets/diffview.nvim', cmd = { 'DiffviewOpen', 'DiffviewFileHistory' }, keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = '[G]it [D]iff (Diffview)' },
      { '<leader>gl', '<cmd>DiffviewFileHistory<CR>', desc = '[G]it [L]og (File History)' },
    }},
  },
  config = function()
    local neogit = require 'neogit'
    local diffview = require 'diffview'

    -- Configure Neogit with floating window for learning phase
    neogit.setup {
      -- kind = 'floating', -- Default is fullscreen
      -- window = {
      --   width = 0.9, -- 90% of screen width
      --   height = 0.9, -- 90% of screen height
      --   border = 'rounded',
      -- },
      disable_relative_line_numbers = false, -- Enable relative line numbers in neogit buffers
      signs = {
        section = { '', '' },
        item = { '', '' },
        hunk = { '', '' },
      },
      integrations = {
        diffview = true, -- Use diffview for diffs within Neogit
      },
    }

    -- Configure Diffview with better keybindings and floating window
    diffview.setup {
      keymaps = {
        view = {
          q = '<cmd>DiffviewClose<CR>', -- Easy quit with 'q'
        },
        file_panel = {
          q = '<cmd>DiffviewClose<CR>', -- Easy quit from file panel
        },
        file_history_panel = {
          q = '<cmd>DiffviewClose<CR>', -- Easy quit from file history
        },
      },
      view = {
        default = {
          layout = 'diff2_horizontal',
          winbar_info = false,
        },
      },
      file_panel = {
        win_config = {
          position = 'left',
          width = 35,
          height = 10,
        },
      },
    }

    -- Open neogit UI - all git operations (commit, push, pull, etc.) are done within the UI
    vim.keymap.set('n', '<leader>gg', neogit.open, { desc = '[G]it Status ([G]neogit)' })

    -- Close neogit floating window (in addition to 'q' key inside neogit)
    vim.keymap.set('n', '<leader>gq', function()
      if vim.bo.filetype == 'NeogitStatus' then
        vim.cmd 'quit'
      else
        vim.cmd 'DiffviewClose'
      end
    end, { desc = '[G]it Close (Neogit or Diffview)' })

    -- Browse commits in telescope
    vim.keymap.set('n', '<leader>gc', function() require('telescope.builtin').git_commits() end, { desc = '[G]it [C]ommits' })

    -- Browse and checkout branches in telescope
    vim.keymap.set('n', '<leader>gb', function() require('telescope.builtin').git_branches() end, { desc = '[G]it [B]ranches' })

    -- Note: <leader>gd and <leader>gl are defined in diffview.nvim dependency keys

    -- Force close all diffview buffers (in case 'q' doesn't work)
    vim.keymap.set('n', '<leader>gx', function()
      vim.cmd 'DiffviewClose'
      -- Force kill any lingering diffview buffers
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
          if filetype == 'DiffviewFiles' or filetype == 'DiffviewFileHistory' then vim.api.nvim_buf_delete(buf, { force = true }) end
        end
      end
    end, { desc = '[G]it Force-close All Diffview Buffers' })
  end,
}
