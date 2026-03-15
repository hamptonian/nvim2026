local M = {}

-- Rose Pine Vague palette
-- Base: Rose Pine main variant with Vague's dark background and brighter colors
M.palette = {
  -- Core colors
  base = "#141415",        -- Vague's background (very dark)
  nc = "#0f0f12",          -- Non-current window background (even darker)
  surface = "#1a1b26",     -- Slightly brighter than base
  overlay = "#232333",     -- Popup backgrounds
  muted = "#7a7692",       -- Brighter muted color
  subtle = "#9a96b8",      -- Brighter subtle
  text = "#e6e6f0",        -- Brighter main text

  -- Semantic colors
  love = "#ef8aa2",        -- Errors (brighter)
  gold = "#f7ca8f",        -- Warnings (brighter)
  rose = "#efcabe",        -- Git delete/change (brighter)
  pine = "#5ec8e0",        -- MUCH brighter pine (key change from #31748f)
  foam = "#a4d7e2",        -- Info (brighter)
  iris = "#c8b3eb",        -- Hint (brighter)
  leaf = "#9abbb8",        -- Success/ok (brighter)

  -- Highlights
  highlight_low = "#252538",
  highlight_med = "#4a4960",
  highlight_high = "#625e7a",

  none = "NONE",
}

return M