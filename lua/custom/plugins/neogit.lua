---@module 'lazy'
---@type LazySpec
return {
  'NeogitOrg/neogit',
  cmd = { 'Neogit', 'DiffviewOpen', 'DiffviewFileHistory', 'DiffviewClose' },
  keys = {
    { '<leader>gg', function() require('neogit').open() end, desc = '[G]it Status ([G]neogit)' },
    { '<leader>gq', function()
      if vim.bo.filetype == 'NeogitStatus' then
        vim.cmd 'quit'
      else
        vim.cmd 'DiffviewClose'
      end
    end, desc = '[G]it Close (Neogit or Diffview)' },
    { '<leader>gc', function() require('telescope.builtin').git_commits() end, desc = '[G]it [C]ommits' },
    { '<leader>gb', function() require('telescope.builtin').git_branches() end, desc = '[G]it [B]ranches' },
    { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = '[G]it [D]iff (Diffview)' },
    { '<leader>gl', '<cmd>DiffviewFileHistory<CR>', desc = '[G]it [L]og (File History)' },
    { '<leader>gx', function()
      vim.cmd 'DiffviewClose'
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local filetype = vim.api.nvim_get_option_value('filetype', { buf = buf })
          if filetype == 'DiffviewFiles' or filetype == 'DiffviewFileHistory' then vim.api.nvim_buf_delete(buf, { force = true }) end
        end
      end
    end, desc = '[G]it Force-close All Diffview Buffers' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'sindrets/diffview.nvim',
  },
  config = function()
    require('neogit').setup {
      disable_relative_line_numbers = false,
      signs = {
        section = { '', '' },
        item = { '', '' },
        hunk = { '', '' },
      },
      integrations = {
        diffview = true,
      },
    }

    require('diffview').setup {
      keymaps = {
        view = { q = '<cmd>DiffviewClose<CR>' },
        file_panel = { q = '<cmd>DiffviewClose<CR>' },
        file_history_panel = { q = '<cmd>DiffviewClose<CR>' },
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
  end,
}
