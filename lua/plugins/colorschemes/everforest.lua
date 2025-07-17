return {
  'neanias/everforest-nvim', -- Theme
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function() -- test hello
    ---@diagnostic disable-next-line: missing-fields
    require('everforest').setup {
      italics = false,
      background = 'hard',
      ui_contrast = 'low',
      disable_italic_comments = true,
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }
  end,
}
