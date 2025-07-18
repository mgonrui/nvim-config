-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_ivy(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- Keymaps

    vim.keymap.set('n', '<leader>sh', function() -- Search help
      require('telescope.builtin').help_tags {}
    end, { desc = '[S]earch [H]elp' })

    vim.keymap.set('n', '<leader>sk', function() -- Search keymaps
      require('telescope.builtin').keymaps {}
    end, { desc = '[S]earch [K]eymaps' })

    vim.keymap.set('n', '<leader>sf', function() -- Search files
      require('telescope.builtin').find_files(vim.tbl_deep_extend(
        'force',
        require('telescope.themes').get_ivy {
          previewer = true,
        },
        {
          hidden = true,
          follow = true,
        }
      ))
    end, { desc = '[S]earch [F]iles' })

    vim.keymap.set('n', '<leader>ss', function() -- Search select telescope
      require('telescope.builtin').builtin {}
    end, { desc = '[S]earch [S]elect Telescope' })

    vim.keymap.set('n', '<leader>sw', function() -- Search current word
      require('telescope.builtin').grep_string {}
    end, { desc = '[S]earch current [W]ord' })

    vim.keymap.set('n', '<leader>sg', function() -- Search by grep
      require('telescope.builtin').live_grep {}
    end, { desc = '[S]earch by [G]rep' })

    vim.keymap.set('n', '<leader>sd', function() -- Search diagnostics
      require('telescope.builtin').diagnostics {}
    end, { desc = '[S]earch [D]iagnostics' })

    vim.keymap.set('n', '<leader>sr', function() -- Search resume
      require('telescope.builtin').resume {}
    end, { desc = '[S]earch [R]esume' })

    vim.keymap.set('n', '<leader>s.', function() -- Search recent files
      require('telescope.builtin').oldfiles {}
    end, { desc = '[S]earch Recent Files ("." for repeat)' })

    vim.keymap.set('n', '<leader><leader>', function() -- Find existing buffers
      require('telescope.builtin').buffers {}
    end, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.require('telescope.builtin').live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
