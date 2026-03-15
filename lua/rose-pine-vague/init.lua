-- Rose Pine Vague colorscheme
-- A blend of Rose Pine's aesthetic with Vague's darker background and higher pine contrast

local M = {
  name = "rose-pine-vague",
  palette = nil,
  groups = nil,
  user_config = {},
}

-- Default configuration
M.default_config = {
  -- Set background contrast: can be 'normal' or 'hard'
  contrast = "normal",

  -- Enable italics for comments
  italics = true,

  -- User can override specific colors
  overrides = {},

  -- Enable legacy highlights for compatibility
  legacy_highlights = true,
}

---Setup the colorscheme
---@param user_config? table
function M.setup(user_config)
  M.user_config = vim.tbl_deep_extend("force", M.default_config, user_config or {})

  -- Apply user palette overrides if any
  if M.user_config.overrides and next(M.user_config.overrides) then
    for k, v in pairs(M.user_config.overrides) do
      if M.palette[k] then
        M.palette[k] = v
      end
    end
  end
end

---Apply the colorscheme highlights
function M.apply()
  -- Get palette
  local palette_module = require("rose-pine-vague.palette")
  M.palette = palette_module.palette

  -- Get groups
  local groups_module = require("rose-pine-vague.groups")
  local all_groups = groups_module.get_groups(M.palette)

  -- Apply all highlight groups
  for group, settings in pairs(all_groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Set terminal colors if we have them
  vim.g.terminal_color_0 = M.palette.base
  vim.g.terminal_color_1 = M.palette.love
  vim.g.terminal_color_2 = M.palette.foam
  vim.g.terminal_color_3 = M.palette.gold
  vim.g.terminal_color_4 = M.palette.pine
  vim.g.terminal_color_5 = M.palette.iris
  vim.g.terminal_color_6 = M.palette.leaf
  vim.g.terminal_color_7 = M.palette.text
  vim.g.terminal_color_8 = M.palette.muted
  vim.g.terminal_color_9 = M.palette.love
  vim.g.terminal_color_10 = M.palette.foam
  vim.g.terminal_color_11 = M.palette.gold
  vim.g.terminal_color_12 = M.palette.pine
  vim.g.terminal_color_13 = M.palette.iris
  vim.g.terminal_color_14 = M.palette.leaf
  vim.g.terminal_color_15 = M.palette.subtle

  -- Set global colors_name
  vim.g.colors_name = M.name
end

---Colorscheme function called by :colorscheme
function M.colorscheme()
  M.setup() -- Apply user config if not already
  M.apply()

  -- Handle legacy highlights if needed
  if M.user_config.legacy_highlights then
    -- Apply some legacy Vim highlight groups for compatibility
    vim.api.nvim_set_hl(0, "SpecialKey", { fg = M.palette.pine })
    vim.api.nvim_set_hl(0, "NonText", { fg = M.palette.muted })
    vim.api.nvim_set_hl(0, "ModeMsg", { fg = M.palette.foam, bold = true })
    vim.api.nvim_set_hl(0, "MsgArea", { fg = M.palette.text })
    vim.api.nvim_set_hl(0, "MoreMsg", { fg = M.palette.iris })
  end
end

return M