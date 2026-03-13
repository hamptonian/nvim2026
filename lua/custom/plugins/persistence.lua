---@module 'lazy'
---@type LazySpec
return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  -- Modern persistence.nvim (v2+) config
  opts = {
    -- Sessions are stored in stdpath('data')/sessions/ by default
    options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' },
    -- Don't save empty sessions
    save_empty = false,
  },
  keys = {
    {
      '<leader>qs',
      function()
        require('persistence').save()
        vim.notify('Session saved', vim.log.levels.INFO)
      end,
      desc = '[Q]uit [S]ave Session',
    },
    {
      '<leader>ql',
      function()
        require('persistence').load()
        vim.notify('Session loaded', vim.log.levels.INFO)
      end,
      desc = '[Q]uit [L]oad Session',
    },
  },
}
