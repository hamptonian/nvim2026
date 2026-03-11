---@module 'lazy'
---@type LazySpec
return {
  'nvim-mini/mini.nvim',
  keys = {
    {
      '<leader>bc',
      function() require('mini.bufremove').delete(0) end,
      desc = '[B]uffer [C]lose',
    },
    {
      '<leader>bo',
      function()
        local cur = vim.api.nvim_get_current_buf()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if buf ~= cur and vim.api.nvim_buf_is_loaded(buf) then
            require('mini.bufremove').delete(buf)
          end
        end
      end,
      desc = '[B]uffer Close [O]thers',
    },
    {
      '<leader>ba',
      function()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(buf) then
            require('mini.bufremove').delete(buf)
          end
        end
      end,
      desc = '[B]uffer Close [A]ll',
    },
  },
}
