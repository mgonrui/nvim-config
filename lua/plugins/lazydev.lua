return {
  'folke/lazydev.nvim', -- configures Lua LSP for your Neovim config, runtime and plugins
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } }, -- Load luvit types when the `vim.uv` word is found
    },
  },
}
