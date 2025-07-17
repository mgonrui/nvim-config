-- File browser for telescope
return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    local fb_actions = require 'telescope._extensions.file_browser.actions'
    require('telescope').setup {
      extensions = {
        file_browser = {

          -- Path & Directory Behavior
          path = '%:p:h', -- Start from current file's directory (if in a buffer)
          cwd = vim.loop.cwd(), -- Fallback to current working directory
          cwd_to_path = false, -- Don't force cwd as initial path

          -- Display & Filtering
          grouped = false, -- Don't group directories first
          hidden = false, -- Show hidden files (set to true to hide)
          respect_gitignore = vim.fn.executable 'fd' == 1, -- Use fd if available
          no_ignore = false, -- Don't force show gitignored files
          follow_symlinks = false, -- Don't follow symlinks
          hide_parent_dir = true, -- Hide ".." parent directory
          collapse_dirs = false, -- Don't collapse empty directories

          -- Icons & UI
          theme = 'ivy', -- open buffer in the bottom
          dir_icon = '', -- Folder icon
          dir_icon_hl = 'Default', -- Highlight group for folder icon
          display_stat = { date = true, size = true, mode = true }, -- Show file details

          -- Misc
          depth = 1, -- Initial scan depth
          auto_depth = false, -- Don't dynamically adjust depth
          use_fd = true, -- Prefer fd over find
          git_status = true, -- Show git status indicators
          hijack_netrw = false, -- Don't replace netrw by default

          -- Key mappings
          mappings = {
            ['i'] = { -- Insert mode
            },
            ['n'] = { -- Normal mode
              ['h'] = fb_actions.goto_parent_dir,
              ['l'] = fb_actions.open_dir,
            },
          },
        },
      },
    }
    require('telescope').load_extension 'file_browser'
  end,
}
