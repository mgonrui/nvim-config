require 'core.options'
require 'core.mappings'
require 'core.autocmd'

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand '~/.cache/nvim/undodir'
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, 'p')
end

-- Install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

-- Add lazy.nvim to Neovim's runtime path
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Configure and install plugins
require('lazy').setup({
  require 'plugins.guess-indent', -- Detect tabstop and shiftwidth automatically
  require 'plugins.gitsigns', -- Adds git related signs to the gutter, as well as utilities for managing changes
  require 'plugins.rainbow-delimiters', -- Rainbow delimiters
  require 'plugins.telescope', -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.telescope-file-browser', -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.arrow', -- Switch fast between bookmarked files
  require 'plugins.conform', -- Autoformat
  require 'plugins.blink-cmp', -- Autocompletion
  require 'plugins.todo-comments', -- Highlight todo, notes, etc in comments
  require 'plugins.which-key', -- Useful plugin to show you pending keybinds.
  require 'plugins.mini', -- Collection of various small independent plugins/modules
  require 'plugins.treesitter', -- Highlight, edit, and navigate code
  require 'plugins.colorschemes.everforest', -- theme
  require 'plugins.colorschemes.gruvbox', -- theme
  require 'plugins.lazydev', -- configures Lua LSP for your Neovim config, runtime and plugins
  require 'plugins.nvim-lspconfig', -- Main LSP Configuration
  require 'plugins.indent_line',
  require 'plugins.autopairs',
  -- require 'plugins.nvim-dap',
  -- require 'plugins.lint',
}, {
  ui = {
    icons = {},
  },
})

vim.cmd 'colorscheme everforest' -- Colorscheme (If it's a plugin it needs to be loaded after them)
