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
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = '50%',
            },
            size = {
              width = 60,
              height = 'auto',
            },
          },
          popupmenu = {
            relative = 'editor',
            position = {
              row = 8,
              col = '50%',
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
            },
          },
        },
      }
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
    },
    config = true,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/todo-comments.nvim' },
    opts = {
      focus = true,
    },
    cmd = 'Trouble',
    keys = {
      { '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', desc = 'Open trouble workspace diagnostics' },
      { '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Open trouble document diagnostics' },
      { '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', desc = 'Open trouble quickfix list' },
      { '<leader>xl', '<cmd>Trouble loclist toggle<CR>', desc = 'Open trouble location list' },
      { '<leader>xt', '<cmd>Trouble todo toggle<CR>', desc = 'Open todos in trouble' },
    },
  },
}
