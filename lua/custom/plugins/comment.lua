---@module 'lazy'
---@type LazySpec
return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  keys = {
    { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
    { 'gc', mode = { 'n', 'v' }, desc = 'Comment toggle linewise' },
    { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
    { 'gb', mode = { 'n', 'v' }, desc = 'Comment toggle blockwise' },
  },
  opts = {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
      line = 'gcc',
      block = 'gbc',
    },
    opleader = {
      line = 'gc',
      block = 'gb',
    },
    extra = {
      above = 'gcO',
      below = 'gco',
      eol = 'gcA',
    },
    mappings = {
      basic = true,
      extra = true,
    },
  },
}
