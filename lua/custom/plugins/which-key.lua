---@module 'lazy'
---@type LazySpec
return {
  'folke/which-key.nvim',
  keys = {
    -- Only load on actual key press, not at startup
    { '<leader>', mode = 'n', noremap = false },
    { '<leader>', mode = 'v', noremap = false },
  },
  lazy = true,
  opts = function(_, opts)
    -- Extend the existing which-key spec with our custom groups
    opts.spec = opts.spec or {}
    local spec = opts.spec

    -- Icons: Using nerd font symbols for beautiful visual hierarchy
    -- 󰙵 UI,  Terminal,  Git,  Harpoon, 󰔌 Session/Quit, 📋 Clipboard, 󰈔 File

    -- Base keybindings from original kickstart config
    table.insert(spec, { 'gr', group = '󰒍 LSP Actions', mode = { 'n' } })

    -- File/Find group
    table.insert(spec, { '<leader>e', desc = '󰈔 Toggle File Tree' })

    -- Find files group
    table.insert(spec, { '<leader>f', group = '󰈔 Find', mode = { 'n', 'v' } })
    table.insert(spec, { '<leader>ff', desc = '󰈔 Find Files', mode = { 'n', 'v' } })
    table.insert(spec, { '<leader>fg', desc = ' Find Git Files', mode = { 'n', 'v' } })
    table.insert(spec, { '<leader>fh', desc = ' Find Hidden Files', mode = { 'n', 'v' } })
    table.insert(spec, { '<leader>fn', desc = '󰒕 Find Neovim Config' })

    -- Search group
    table.insert(spec, { '<leader>s', group = '󰍉 Search', mode = { 'n', 'v' } })

    -- UI features group
    table.insert(spec, { '<leader>u', group = '󰙵 UI' })
    table.insert(spec, { '<leader>ua', desc = '󰈬 Aerial (Code Outline)' })
    table.insert(spec, { '<leader>uz', desc = '󱓞 Zen Mode (Focus)' })

    -- Terminal group
    table.insert(spec, { '<leader>t', group = ' Terminal' })
    table.insert(spec, { '<leader>t1', desc = ' Terminal 1 (Vertical)' })
    table.insert(spec, { '<leader>t2', desc = ' Terminal 2 (Horizontal)' })
    table.insert(spec, { '<leader>th', desc = ' Toggle Inlay [H]ints' })

    -- Git operations group
    table.insert(spec, { '<leader>g', group = '  Git' })
    table.insert(spec, { '<leader>gg', desc = ' Git Status (Neogit)' })
    table.insert(spec, { '<leader>gf', desc = ' Git Files' })

    -- Harpoon group
    table.insert(spec, { '<leader>h', group = ' Harpoon' })
    table.insert(spec, { '<leader>ha', desc = ' Add Mark' })
    table.insert(spec, { '<leader>hm', desc = ' Menu' })
    table.insert(spec, { '<leader>h1', desc = '1️⃣ File 1' })
    table.insert(spec, { '<leader>h2', desc = '2️⃣ File 2' })
    table.insert(spec, { '<leader>h3', desc = '3️⃣ File 3' })
    table.insert(spec, { '<leader>h4', desc = '4️⃣ File 4' })
    table.insert(spec, { '<leader>hn', desc = ' Next' })
    table.insert(spec, { '<leader>hp', desc = ' Previous' })

    -- Session management group
    table.insert(spec, { '<leader>q', group = '󰔌 Session/Quit' })
    table.insert(spec, { '<leader>qs', desc = ' Save Session' })
    table.insert(spec, { '<leader>ql', desc = ' Load Session' })

    -- Clipboard group
    table.insert(spec, { '<leader>c', group = '📋 Clipboard' })
    table.insert(spec, { '<leader>cy', desc = ' Copy File/Selection' })
    table.insert(spec, { '<leader>cp', desc = ' Paste from Clipboard' })
    table.insert(spec, { '<leader>cL', desc = ' Copy Line' })
    table.insert(spec, { '<leader>cf', desc = ' Copy File Path' })
    table.insert(spec, { '<leader>cl', desc = ' Copy Path:Line' })

    -- Set a small delay so which-key doesn't immediately pop up
    opts.delay = 500  -- milliseconds
    
    -- Customize appearance and positioning (bottom-right like LazyVim)
    opts.win = {
      border = 'rounded',
      no_overlap = true,
      padding = { 1, 2 },
    }
    
    -- Position which-key at bottom-right corner for better UX
    opts.layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = 'left',
    }
    opts.sort = { 'local', 'order' }
    opts.plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    }

    return opts
  end,
}
