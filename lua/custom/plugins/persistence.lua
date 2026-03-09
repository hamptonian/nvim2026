---@module 'lazy'
---@type LazySpec
return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath 'data' .. '/sessions/'),
    options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' },
    pre_save = nil,
    save_empty = false,
    pre_load = nil,
  },
  config = function(_, opts)
    local persistence = require 'persistence'
    persistence.setup(opts)

    -- Manual save/load commands
    vim.keymap.set('n', '<leader>qs', function()
      persistence.save()
      vim.notify('Session saved', vim.log.levels.INFO)
    end, { desc = '[Q]uit [S]ave Session' })

    vim.keymap.set('n', '<leader>ql', function()
      persistence.load()
      vim.notify('Session loaded', vim.log.levels.INFO)
    end, { desc = '[Q]uit [L]oad Session' })

    -- OPTIONAL: Uncomment below to auto-restore last session on startup
    -- vim.api.nvim_create_autocmd('VimEnter', {
    --   callback = function()
    --     -- Only restore if not opening a file
    --     if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
    --       persistence.load()
    --     end
    --   end,
    --   nested = true,
    -- })

    -- OPTIONAL: Uncomment below to auto-save current session on exit
    -- vim.api.nvim_create_autocmd('VimLeavePre', {
    --   callback = function()
    --     persistence.save()
    --   end,
    -- })
  end,
}
