# Neogit & Git Workflow Guide

## Quick Start

Your git workflow now centers around **Neogit** with supporting tools for specific tasks.

### Primary Git Command
```
<leader>gg  →  Open Neogit Status UI (floating window)
```

---

## Neogit Core Workflow

Once you press `<leader>gg`, you're in the Neogit UI. Here are the essential keys:

### Navigation & Basic Actions
| Key | Action |
|-----|--------|
| `j` / `k` | Move down/up |
| `<CR>` (Enter) | Toggle selection on file/section |
| `s` | **Stage/unstage** file or hunk |
| `d` | **Discard** changes (delete) |
| `r` | **Revert** file |
| `c` | **Commit** (opens commit message editor) |
| `P` | **Push** to remote |
| `p` | **Pull** from remote |
| `F` | **Fetch** from remote |
| `b` | **Branch** operations (create, switch, delete) |
| `l` | **Log** - view commit history |
| `<Space>` | Preview changes (opens inline diff) |
| `q` | **Quit** Neogit (or use `<leader>gq`) |

### Examples:

**Staging a file:**
1. `<leader>gg` → Open Neogit
2. Navigate to the file you want to stage
3. Press `s` to stage it (it moves to "Staged changes" section)
4. Repeat for other files
5. Press `c` to commit

**Pushing your changes:**
1. After staging and committing: Press `P` in Neogit
2. Select the branch to push to
3. Confirm

**Switching branches:**
1. Press `b` in Neogit
2. Select "checkout" → "create branch" / "checkout existing"
3. Choose your branch

**View detailed diff:**
1. Navigate to a file in Neogit
2. Press `<Space>` to see inline diff of changes
3. Navigate up/down to see different hunks

---

## Supporting Git Tools

### Recent Git Commits (Quick View)
```
<leader>gc  →  Browse commits in Telescope (quick picker)
```
- Useful for: Quickly finding a specific commit without opening Neogit
- In Telescope, `<CR>` shows commit details, `<C-x>` rebases, etc.

### Git Branches (Quick Switch)
```
<leader>gb  →  Browse branches in Telescope (quick picker)
```
- Useful for: Fast branch switching without opening full Neogit
- Just select a branch and press `<CR>` to switch
- **OR** use Neogit's `b` key for more detailed branch operations

### Diff View (Detailed Diff)
```
<leader>gd  →  Open Diffview (side-by-side comparison of working tree vs HEAD)
```
- Shows all changes across all files in a split view
- Press `q` to close Diffview
- Navigate files in left panel, see diff in right panel
- Useful for: Review all changes before committing

### Git File History (Log)
```
<leader>gl  →  View commit history for current file (via Diffview)
```
- Shows all commits that touched the current file
- Excellent for: Understanding how a file evolved
- Press `q` to close

### Force-Close Diffview (Emergency)
```
<leader>gx  →  Force-close all Diffview buffers (if 'q' doesn't work)
```
- Use this if Diffview gets stuck or won't close properly
- Alternative: `<leader>gq` also closes Diffview gracefully

---

## Gitsigns - Inline Git Information

Gitsigns shows git change indicators directly in your editor's gutter (left margin).

### Gutter Symbols
| Symbol | Meaning |
|--------|---------|
| `+` | **Added** lines (new code) |
| `~` | **Changed** lines (modified code) |
| `_` | **Deleted** lines (removed code) |

### Navigation
```
]c  →  Jump to NEXT git change/hunk
[c  →  Jump to PREVIOUS git change/hunk
```

### How to Use:
1. Navigate to a file with changes
2. You'll see `+`, `~`, or `_` symbols on the left
3. Press `]c` to jump to the next change
4. When you land on a hunk, you can:
   - **View the change**: It's highlighted/shown in the editor
   - **Stage it**: Go to Neogit (`<leader>gg`) and press `s` on that hunk
   - **Navigate other hunks**: Keep pressing `]c` / `[c`

### Why Use Gitsigns?
- **Quick navigation**: Easily find all changes in a large file
- **Visual feedback**: See immediately what's changed
- **Integration with Neogit**: Use gitsigns to navigate, Neogit to stage/commit

---

## Workflow Examples

### Example 1: Quick Commit
```
1. Make some changes in your code
2. <leader>gg                 (open Neogit)
3. Navigate to files (j/k)
4. Press 's' on files to stage them
5. Press 'c' to commit
6. Write your commit message
7. <CR> to confirm
8. Press 'q' to close Neogit
9. <leader>gq (if needed to fully close)
```

### Example 2: Review Large Changes
```
1. You've made edits across multiple files
2. <leader>gd                 (open Diffview - see ALL changes side-by-side)
3. Review the diff
4. Press 'q' to close Diffview
5. <leader>gg                 (open Neogit for staging/committing)
```

### Example 3: Navigate & Stage Hunks
```
1. Open a file with changes
2. ]c                         (jump to first hunk)
3. <leader>gg                 (open Neogit)
4. Press 's' to stage the hunk
5. Repeat ]c and staging for other hunks
6. <leader>gq                 (quit Neogit)
```

### Example 4: Find Old Code Quickly
```
1. You're looking at a file and want to see its history
2. <leader>gl                 (DiffviewFileHistory - shows all commits for this file)
3. Review the file's evolution
4. Press 'q' to close
```

---

## Floating Window Learning Phase

Right now, Neogit opens in a **floating window** (85% of your screen). This helps you:
- See your code behind the Neogit UI (context)
- Focus on learning Neogit keybindings without full screen takeover
- Gradually transition to the default fullscreen behavior

### Exiting the Floating Window:
- Press `q` inside Neogit, OR
- Use `<leader>gq` from normal mode

### Transition to Fullscreen (Later):
Once you're comfortable with Neogit, you can disable floating mode:
1. Edit `lua/custom/plugins/neogit.lua`
2. Find the line: `kind = 'floating',`
3. Delete that line (or change to `kind = 'split'` for side panel)
4. Restart nvim

---

## Complete Keymap Reference

| Keymap | Tool | Action |
|--------|------|--------|
| `<leader>gg` | Neogit | Open status UI |
| `<leader>gc` | Telescope | Browse commits |
| `<leader>gb` | Telescope | Browse & switch branches |
| `<leader>gd` | Diffview | View all changes (diff) |
| `<leader>gl` | Diffview | View file commit history |
| `<leader>gq` | Both | Close Neogit/Diffview |
| `<leader>gx` | Diffview | Force-close all diffview buffers |
| `]c` | Gitsigns | Jump to next hunk |
| `[c` | Gitsigns | Jump to previous hunk |
| `<leader>fl` | Telescope | Find recent files |

---

## Troubleshooting

### "I can't exit Neogit"
- Press `q` (while inside Neogit floating window)
- OR use `<leader>gq` (from normal mode outside)

### "Diffview won't close"
- Press `q` inside Diffview
- OR use `<leader>gq` from normal mode
- Last resort: `<leader>gx` to force-close all diffview buffers

### "I accidentally closed something and can't find it"
- `<leader>gg` to re-open Neogit
- `<leader>gd` to re-open Diffview
- `:tabnew` to open a new tab if you lost your workspace

### "The floating window is too small/big"
- Edit `lua/custom/plugins/neogit.lua`
- Find the `window` section
- Adjust `width = 0.85` (currently 85%) and `height = 0.85`
- Restart nvim (or reload config with `:e .`)

---

## Next Steps

1. **Open Neogit**: `<leader>gg`
2. **Explore**: Use `j`/`k` to navigate, `<Space>` to preview changes
3. **Try staging**: Press `s` on a file
4. **Make a commit**: Press `c` and write a message
5. **Push**: Press `P`

Come back to this guide anytime you forget a key! The goal is to eventually use Neogit as your primary git interface, just like you did with lazygit.

---

## Why This Setup?

- **Neogit** = Your main git UI (like lazygit, but in Neovim)
- **Gitsigns** = Quick navigation to changes in your code
- **Diffview** = Detailed diff viewing when you need it
- **Telescope** = Quick pickers for commits/branches
- **Floating window** = Learning phase with context (graduate to fullscreen later)

Happy gitting! 🚀
