-- Highlight group mappings for Rose Pine Vague
local M = {}

function M.get_groups(palette)
  return {
    -- === BASIC SYNTAX (Vim highlights) ===
    Comment = { fg = palette.subtle, italic = true },
    Constant = { fg = palette.pine },
    String = { fg = palette.foam },
    Character = { link = "String" },
    Number = { fg = palette.gold },
    Boolean = { fg = palette.pine },
    Float = { fg = palette.gold },
    Identifier = { fg = palette.text },
    Function = { fg = palette.iris, bold = true },
    Statement = { fg = palette.rose },
    Conditional = { fg = palette.rose },
    Repeat = { fg = palette.rose },
    Label = { fg = palette.text },
    Operator = { fg = palette.subtle },
    Keyword = { fg = palette.pine },
    Exception = { fg = palette.love },
    PreProc = { fg = palette.iris },
    Include = { fg = palette.iris },
    Define = { fg = palette.iris },
    Macro = { fg = palette.iris },
    Type = { fg = palette.leaf },
    StorageClass = { fg = palette.pine },
    Structure = { fg = palette.leaf },
    Typedef = { fg = palette.leaf },
    Special = { fg = palette.foam },
    SpecialChar = { fg = palette.foam },
    Tag = { fg = palette.rose },
    Delimiter = { fg = palette.subtle },
    SpecialComment = { fg = palette.subtle, italic = true },
    Underlined = { underline = true, fg = palette.text },
    Ignore = { fg = palette.subtle },
    Error = { fg = palette.love, bold = true, underline = true },
    Todo = { fg = palette.rose, bold = true, bg = palette.overlay },

    -- === TREESITTER QUERIES ===
    ["@comment"] = { link = "Comment" },
    ["@error"] = { link = "Error" },
    ["@punctuation"] = { fg = palette.subtle },
    ["@punctuation.delimiter"] = { fg = palette.subtle },
    ["@punctuation.bracket"] = { fg = palette.subtle },
    ["@punctuation.special"] = { fg = palette.subtle },

    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = palette.pine },
    ["@constant.macro"] = { fg = palette.iris },

    ["@string"] = { link = "String" },
    ["@string.regex"] = { fg = palette.foam },
    ["@string.escape"] = { fg = palette.foam, bold = true },
    ["@string.special"] = { fg = palette.rose },

    ["@character"] = { link = "Character" },
    ["@number"] = { link = "Number" },
    ["@boolean"] = { link = "Boolean" },
    ["@float"] = { link = "Float" },

    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { fg = palette.iris },
    ["@function.call"] = { link = "Function" },
    ["@function.macro"] = { fg = palette.iris },

    ["@method"] = { fg = palette.iris },
    ["@method.call"] = { link = "Method" },

    ["@field"] = { fg = palette.text },
    ["@property"] = { fg = palette.text },

    ["@parameter"] = { fg = palette.subtle },
    ["@parameter.reference"] = { fg = palette.subtle },

    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = palette.pine },

    ["@label"] = { link = "Label" },

    ["@variable"] = { fg = palette.text },
    ["@variable.builtin"] = { fg = palette.pine },

    ["@keyword"] = { link = "Keyword" },
    ["@keyword.coroutine"] = { fg = palette.iris },
    ["@keyword.function"] = { fg = palette.iris },
    ["@keyword.operator"] = { fg = palette.subtle },
    ["@keyword.return"] = { fg = palette.pine },

    ["@operator"] = { link = "Operator" },

    ["@exception"] = { link = "Exception" },

    ["@module"] = { fg = palette.leaf },
    ["@module.builtin"] = { fg = palette.pine },

    ["@annotation"] = { fg = palette.iris },
    ["@attribute"] = { fg = palette.iris },

    ["@constructor"] = { fg = palette.text },
    ["@enum"] = { fg = palette.leaf },
    ["@enum.member"] = { fg = palette.pine },

    ["@event"] = { fg = palette.rose },
    ["@event.special"] = { fg = palette.foam },

    ["@markup"] = { fg = palette.text },
    ["@markup.strong"] = { bold = true, fg = palette.text },
    ["@markup.italic"] = { italic = true, fg = palette.text },
    ["@markup.underline"] = { underline = true, fg = palette.text },
    ["@markup.strikethrough"] = { strikethrough = true, fg = palette.subtle },
    ["@markup.heading"] = { fg = palette.iris, bold = true },
    ["@markup.link"] = { fg = palette.foam, underline = true },
    ["@markup.link.url"] = { fg = palette.subtle, underline = true },
    ["@markup.raw"] = { fg = palette.foam },

    ["@text"] = { fg = palette.text },
    ["@text.todo"] = { fg = palette.rose, bg = palette.overlay },
    ["@text.note"] = { fg = palette.pine, bg = palette.overlay },
    ["@text.warning"] = { fg = palette.gold, bg = palette.overlay },
    ["@text.danger"] = { fg = palette.love, bg = palette.overlay },

    -- === LSP DIAGNOSTICS ===
    LspErrorText = { fg = palette.love },
    LspWarningText = { fg = palette.gold },
    LspInformationText = { fg = palette.foam },
    LspHintText = { fg = palette.iris },

    DiagnosticError = { fg = palette.love },
    DiagnosticWarn = { fg = palette.gold },
    DiagnosticInfo = { fg = palette.foam },
    DiagnosticHint = { fg = palette.iris },

    DiagnosticUnderlineError = { undercurl = true, fg = palette.love },
    DiagnosticUnderlineWarn = { undercurl = true, fg = palette.gold },
    DiagnosticUnderlineInfo = { undercurl = true, fg = palette.foam },
    DiagnosticUnderlineHint = { undercurl = true, fg = palette.iris },

    -- === UI ELEMENTS ===
    Normal = { fg = palette.text, bg = palette.base },
    NormalFloat = { fg = palette.text, bg = palette.overlay },
    FloatBorder = { fg = palette.muted, bg = palette.overlay },
    StatusLine = { fg = palette.text, bg = palette.surface },
    StatusLineNC = { fg = palette.subtle, bg = palette.surface },
    TabLine = { fg = palette.subtle, bg = palette.surface },
    TabLineFill = { fg = palette.subtle, bg = palette.surface },
    TabLineSel = { fg = palette.text, bg = palette.overlay, bold = true },
    WinSeparator = { fg = palette.overlay },
    VertSplit = { fg = palette.overlay },
    Folded = { fg = palette.subtle, bg = palette.surface },
    FoldColumn = { fg = palette.subtle, bg = palette.base },
    SignColumn = { bg = palette.base },
    LineNr = { fg = palette.muted },
    CursorLineNr = { fg = palette.text, bold = true },
    CursorLine = { bg = palette.highlight_low },
    ColorColumn = { bg = palette.highlight_low },

    -- === CURSOR & SELECTION ===
    Cursor = { fg = palette.base, bg = palette.text },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    Visual = { bg = palette.highlight_med },
    VisualNOS = { link = "Visual" },

    -- === SEARCH ===
    Search = { fg = palette.text, bg = palette.pine },
    IncSearch = { fg = palette.base, bg = palette.foam },
    CurSearch = { link = "IncSearch" },

    -- === GIT SIGNS (gitsigns.nvim) ===
    GitSignsAdd = { fg = palette.foam, bg = palette.base },
    GitSignsChange = { fg = palette.rose, bg = palette.base },
    GitSignsDelete = { fg = palette.love, bg = palette.base },

    -- === POPUP MENUS ===
    Pmenu = { fg = palette.text, bg = palette.overlay },
    PmenuSel = { fg = palette.base, bg = palette.pine },
    PmenuKind = { fg = palette.text, bg = palette.overlay },
    PmenuKindSel = { fg = palette.base, bg = palette.pine },
    PmenuExtra = { fg = palette.subtle, bg = palette.overlay },
    PmenuExtraSel = { fg = palette.base, bg = palette.pine },

    -- === MATCHING PARENS ===
    MatchParen = { bold = true, fg = palette.iris, underline = true },

    -- === WHICHKEY ===
    WhichKey = { fg = palette.text },
    WhichKeyDesc = { fg = palette.pine },
    WhichKeyGroup = { fg = palette.iris },

    -- === TELESCOPE ===
    TelescopeNormal = { fg = palette.text, bg = palette.overlay },
    TelescopeBorder = { fg = palette.muted, bg = palette.overlay },
    TelescopePromptBorder = { fg = palette.muted, bg = palette.overlay },
    TelescopeResultsBorder = { fg = palette.muted, bg = palette.overlay },
    TelescopePreviewBorder = { fg = palette.muted, bg = palette.overlay },
    TelescopeSelection = { fg = palette.base, bg = palette.pine },
    TelescopePromptPrefix = { fg = palette.pine },

    -- === NOTIFICATIONS (Noice, Notify) ===
    NotifyERROR = { fg = palette.love },
    NotifyWARN = { fg = palette.gold },
    NotifyINFO = { fg = palette.foam },
    NotifyDEBUG = { fg = palette.subtle },
    NotifyTRACE = { fg = palette.subtle },

    -- === AERIAL (symbols outline) ===
    AerialArray = { fg = palette.pine },
    AerialBoolean = { fg = palette.pine },
    AerialClass = { fg = palette.iris },
    AerialConstant = { fg = palette.pine },
    AerialEnum = { fg = palette.iris },
    AerialEnumMember = { fg = palette.pine },
    AerialEvent = { fg = palette.rose },
    AerialField = { fg = palette.text },
    AerialFile = { fg = palette.text },
    AerialFunction = { fg = palette.iris },
    AerialInterface = { fg = palette.iris },
    AerialKey = { fg = palette.pine },
    AerialMethod = { fg = palette.iris },
    AerialModule = { fg = palette.leaf },
    AerialNamespace = { fg = palette.leaf },
    AerialNull = { fg = palette.pine },
    AerialNumber = { fg = palette.gold },
    AerialObject = { fg = palette.iris },
    AerialOperator = { fg = palette.subtle },
    AerialPackage = { fg = palette.leaf },
    AerialProperty = { fg = palette.text },
    AerialString = { fg = palette.foam },
    AerialStruct = { fg = palette.iris },
    AerialTypeParameter = { fg = palette.leaf },
    AerialVariable = { fg = palette.text },

    -- === GITSIGNS gutter ===
    GitSignsAddNr = { link = "GitSignsAdd" },
    GitSignsChangeNr = { link = "GitSignsChange" },
    GitSignsDeleteNr = { link = "GitSignsDelete" },

    -- === MINI STATUSLINE ===
    MiniStatuslineFilename = { fg = palette.text, bg = palette.surface },
    MiniStatuslineInactive = { fg = palette.subtle, bg = palette.base },

    -- === INDENT GUIDES ===
    IndentLine = { fg = palette.overlay },
    IndentLineCurrent = { fg = palette.muted },

    -- === SUBSTITUTE HIGHLIGHT ===
    Substitute = { bg = palette.overlay },

    -- === TERMINAL ===
    StatuslineTerm = { fg = palette.text, bg = palette.surface },
    StatuslineTermNC = { fg = palette.subtle, bg = palette.base },

    -- === CURSOR COLUMN/LINE FOR CODE NAV ===
    CursorColumn = { bg = palette.highlight_low },

    -- === NVIM-TREESITTER CONTEXT ===
    TreesitterContext = { fg = palette.text, bg = palette.surface },
    TreesitterContextBottom = { fg = palette.text, bg = palette.surface, sp = palette.muted, underline = true },

    -- === HEADINGS (for markdown, etc.) ===
    markdownH1 = { fg = palette.iris, bold = true },
    markdownH2 = { fg = palette.foam, bold = true },
    markdownH3 = { fg = palette.rose, bold = true },
    markdownH4 = { fg = palette.gold, bold = true },
    markdownH5 = { fg = palette.pine, bold = true },
    markdownH6 = { fg = palette.leaf, bold = true },

    -- === DIFF ===
    DiffAdd = { fg = palette.foam, bg = palette.surface },
    DiffChange = { fg = palette.rose, bg = palette.surface },
    DiffDelete = { fg = palette.love, bg = palette.surface },
    DiffText = { fg = palette.text, bg = palette.overlay },
  }
end

return M