-- Global settings
vim.g.mapleader = ' ' -- Set <space> as the global leader key (Must happen before plugins are loaded)
vim.g.maplocalleader = ' ' -- Set <space> as the local leader key (Must happen before plugins are loaded)
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal

-- Search settings
vim.o.ignorecase = true -- Search case insensitive
vim.o.smartcase = true -- Search case-sensitive if the search pattern contains uppercase letters
vim.o.hlsearch = false -- Don't highlight search results
vim.o.incsearch = true -- Show matches as you type

-- Behavior settings
vim.o.splitright = true -- When use vertical split, split to the right
vim.o.splitbelow = true -- When use horizontal split, split to the bottom
vim.o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- Minimal number of screen lines to keep leftoff and rightoff the cursor
vim.o.mouse = 'a' -- Enable mouse mode
vim.o.breakindent = false -- Enable break indent
vim.o.confirm = true -- Enables interactive confirmation prompts before losing unsaved changes
vim.o.undofile = true -- Save undo history
vim.opt.iskeyword:append '-' -- Treat dash as part of word
vim.o.hidden = true -- Allow hidden buffers
vim.o.errorbells = false -- No error bells
vim.o.backspace = 'indent,eol,start' -- Better backspace behavior
vim.opt.path:append '**' -- include subdirectories in search
vim.o.selection = 'exclusive' -- Selection behavior
vim.o.autochdir = false -- Don't auto change directory
vim.o.modifiable = true -- Allow buffer modifications
vim.o.encoding = 'UTF-8' -- Set encoding
vim.schedule(function() -- Schedule the setting after `UiEnter` because it can increase startup-time
  vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim
end)

-- File handling
vim.o.backup = false -- Don't reate backup files
vim.o.writebackup = false -- Don't create backup before writing
vim.o.swapfile = true -- Create swap files
vim.o.updatetime = 750 -- If this many milliseconds nothing is typed the swap file will be written to disk (see |crash-recovery|).
vim.o.timeoutlen = 300 -- Time in milliseconds to wait for a mapped sequence to complete.
vim.o.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
vim.o.undofile = true -- Persistent undo history
vim.o.undodir = vim.fn.expand '~/.cache/nvim/undodir' -- Undo history directory
vim.o.autoread = true -- Auto reload files changed outside vim
vim.o.autowrite = false -- Don't auto save

-- Visual settings
vim.o.background = 'dark' -- or "light" for light mode
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.cursorline = true -- Show which line your cursor is on
vim.o.inccommand = 'split' -- Preview substitutions as you type
vim.wo.wrap = false -- Disables line wrapping for the current window
vim.o.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.list = true -- Show invisible characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Sets how neovim will display certain whitespace characters in the editor
-- vim.o.termguicolors = true -- Enable 24-bit colors
vim.o.signcolumn = 'yes' -- Always show sign column
vim.o.colorcolumn = '80' -- Show color column at 80 characters
vim.o.showmatch = true -- Highlight matching brackets
vim.o.matchtime = 2 -- How long to show matching bracket
vim.o.cmdheight = 1 -- Command line height
vim.o.completeopt = 'menuone,noinsert,noselect' -- Completion options
vim.o.showmode = false -- Don't show mode in command line
vim.o.pumheight = 10 -- Popup menu height
vim.o.pumblend = 10 -- Popup menu transparency
vim.o.winblend = 0 -- Floating window transparency
vim.o.conceallevel = 0 -- Don't hide markup
vim.o.concealcursor = '' -- Don't hide cursor line markup
vim.o.lazyredraw = true -- Don't redraw during macros
vim.o.synmaxcol = 300 -- Syntax highlighting limit
vim.highlight.priorities.semantic_tokens = 95 -- Dont let LSP override treesitter color settings
