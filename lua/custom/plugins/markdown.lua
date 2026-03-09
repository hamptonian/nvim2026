---@module 'lazy'
---@type LazySpec
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    render_modes = { 'n', 'v' },
    heading = {
      sign = false,
    },
    code = {
      sign = false,
      style = 'full',
    },
    checkbox = {
      checked = '✓',
      unchecked = '✗',
    },
    hr = '─',
    quote = '┃',
    table = {
      style = 'full',
    },
  },
  ft = { 'markdown', 'norg' },
}
