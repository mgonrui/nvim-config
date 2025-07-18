return {

  'nvim-treesitter/nvim-treesitter', -- Highlight, edit, and navigate code
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]]
  --
  opts = {
    -- ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
    auto_install = true, -- Autoinstall languages that are not installed
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
      -- Custom syntax highlighting for C code
      vim.api.nvim_set_hl(0, '@function.call.c', { link = '@variable', italic = false, underline = false, sp = '' }),
      vim.api.nvim_set_hl(0, '@operator.c', { link = '@variable', italic = false, underline = false, sp = '' }),
      vim.api.nvim_set_hl(0, '@variable.parameter.c', { link = '@variable.member', italic = false, underline = false, sp = '' }),
      vim.api.nvim_set_hl(0, '@variable.declaration.c', { link = '@variable.member', italic = false, underline = false, sp = '' }),
      -- vim.api.nvim_set_hl(0, '@punctuation.delimiter.c', { link = '@variable', italic = false, underline = false, sp = '' }),
      vim.api.nvim_set_hl(0, '@property.c', { link = '@variable', italic = false, underline = false, sp = '' }),
      vim.api.nvim_set_hl(0, '@number.c', { link = '@variable', italic = false, underline = false, sp = '' }),
      vim.api.nvim_set_hl(0, '@constant.c', { link = '@constant.builtin', italic = false, underline = false, sp = '' }),
      vim.api.nvim_set_hl(0, '@ibl.scope.underline.1', { link = '@variable', italic = false, underline = false, sp = '' }),
    },
     -- indent = { enable = true, disable = { 'ruby' } },
   },
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  -- --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
