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
    keys = { '/', '?', ':' },
    build = ':UpdateRemotePlugins',
  },
}
