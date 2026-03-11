---@module 'lazy'
---@type LazySpec
return {
  'mbbill/undotree',
  keys = {
    { '<leader>uu', vim.cmd.UndotreeToggle, desc = '[U]ndo Tree' },
  },
}
