-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
-- See the kickstart.nvim README for more information
return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
        delete_to_trash = false,
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open parent directory in floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
  {
    'pocco81/auto-save.nvim',
    enabled = true,
    execution_message = {
      message = function() -- message to print on save
        return ('AutoSave: saved at ' .. vim.fn.strftime '%H:%M:%S')
      end,
      dim = 0.18, -- dim the color of `message`
      cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require('window-picker').setup()
    end,
  },
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup {
        --Note how the `gitblame_` prefix is omitted in `setup`
        enabled = true,
      }
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {}
    end,
  },
  {
    'gelguy/wilder.nvim',
    build = ':UpdateRemotePlugins',
    keys = { '/', '?', ':' },
    config = function()
      local wilder = require 'wilder'
      wilder.setup {
        modes = { ':', '/', '?' },
        next_key = '<Down>',
        previous_key = '<Up>',
        accept_key = '<CR>',
        reject_key = '<Esc>',
      }
      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.python_file_finder_pipeline {
            -- to use ripgrep : {'rg', '--files'}
            -- to use fd      : {'fd', '-tf'}
            file_command = { 'find', '.', '-type', 'f', '-printf', '%P\n' },
            -- to use fd      : {'fd', '-td'}
            dir_command = { 'find', '.', '-type', 'd', '-printf', '%P\n' },
            -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
            -- found at https://github.com/nixprime/cpsm
            filters = { 'fuzzy_filter', 'difflib_sorter' },
          },
          wilder.cmdline_pipeline(),
          wilder.python_search_pipeline()
        ),
      })
      wilder.set_option(
        'renderer',
        wilder.popupmenu_renderer {
          -- highlighter applies highlighting to the candidates
          highlighter = wilder.basic_highlighter(),
          left = { ' ', wilder.popupmenu_devicons() },
          right = { ' ', wilder.popupmenu_scrollbar() },
          -- wilder.popupmenu_border_theme {
          --   highlights = {
          --     border = 'Normal', -- highlight to use for the border
          --   },
          --   -- 'single', 'double', 'rounded' or 'solid'
          --   -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
          --   border = 'rounded',
          -- },
        }
      )
    end,
  },
  { 'stevearc/dressing.nvim' },
  {
    'gbprod/yanky.nvim',
    cmd = { 'YankyRingHistory' },
    config = function()
      require 'config.yanky'
    end,
  },
  { 'michaeljsmith/vim-indent-object', event = 'VeryLazy' },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
  },
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'max397574/colortils.nvim',
    cmd = 'Colortils',
    config = function()
      require('colortils').setup()
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    -- config = function()
    --   local rainbow_delimiters = require 'rainbow-delimiters'
    --   rainbow_delimiters.setup {
    --     strategy = {
    --       [''] = rainbow_delimiters.strategy['global'],
    --       commonlisp = rainbow_delimiters.strategy['local'],
    --     },
    --     query = {
    --       [''] = 'rainbow-delimiters',
    --       latex = 'rainbow-blocks',
    --     },
    --     highlight = {
    --       'RainbowDelimiterRed',
    --       'RainbowDelimiterYellow',
    --       'RainbowDelimiterBlue',
    --       'RainbowDelimiterOrange',
    --       'RainbowDelimiterGreen',
    --       'RainbowDelimiterViolet',
    --       'RainbowDelimiterCyan',
    --     },
    --     blacklist = { 'c', 'cpp' },
    --   }
    -- end,
  },
}
