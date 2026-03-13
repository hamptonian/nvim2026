return {
  'hat0uma/csvview.nvim',
  ---@module "csvview"
  ---@type CsvView.Options
  ft = { 'csv', 'tsv' },
  opts = {
    parser = {
      comments = { '#', '//' },
      -- Auto-detect delimiter for various file types
      delimiter = {
        ft = {
          csv = ',',
          tsv = '\t',
        },
        fallbacks = { ',', '\t', ';', '|' },
      },
    },
    view = {
      -- Use highlight mode for better column alignment
      display_mode = 'highlight',
      -- Enable sticky header (frozen top row)
      sticky_header = { enabled = true, separator = '─' },
      -- Minimum column width
      min_column_width = 8,
      -- Spacing between columns
      spacing = 2,
    },
    keymaps = {
      -- Text objects for selecting fields
      textobject_field_inner = { 'if', mode = { 'o', 'x' } },
      textobject_field_outer = { 'af', mode = { 'o', 'x' } },
      -- Excel-like navigation:
      -- Use <Tab> and <S-Tab> to move horizontally between fields.
      -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
      -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
      jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
      jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
      jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
      jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
    },
  },
  keys = {
    { '<leader>cv', '<cmd>CsvViewToggle<CR>', desc = 'Toggle CSV view' },
  },
  config = function(_, opts)
    require('csvview').setup(opts)

    -- Auto-enable CSV view for CSV and TSV files
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'csv', 'tsv' },
      callback = function(args)
        -- Small delay to ensure buffer is loaded
        vim.defer_fn(function()
          vim.cmd('CsvViewEnable')
        end, 100)
      end,
    })

    -- Set up rainbow column colors matching catppuccin mocha theme
    local colors = {
      '#f38ba8', -- Pink
      '#a6e3a1', -- Green
      '#fab387', -- Peach
      '#89b4fa', -- Blue
      '#f9e2af', -- Yellow
      '#cba6f7', -- Mauve
      '#94e2d5', -- Teal
      '#eba0ac', -- Red
      '#b4befe', -- Lavender
    }

    for i = 0, 8 do
      vim.api.nvim_set_hl(0, 'CsvViewCol' .. i, { fg = colors[i + 1] or colors[1] })
    end

    -- Set delimiter color
    vim.api.nvim_set_hl(0, 'CsvViewDelimiter', { fg = '#6c7086' })
  end,
}
