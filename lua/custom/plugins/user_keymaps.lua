-- Custom keymaps to adapt old Neovim config to kickstart.nvim

return {
  -- ===========================================================================
  -- TELESCOPE - Legacy keymaps from user's old config
  -- ===========================================================================
  {
    'nvim-telescope/telescope.nvim',
    opts = function()
      local builtin = require 'telescope.builtin'

      -- User's legacy keymaps (coexist with kickstart's <leader>s* keymaps)
      vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = '[P]roject files' })
      vim.keymap.set('n', '<leader>ag', builtin.live_grep, { desc = '[Ag]rep search' })
      vim.keymap.set('n', '<leader>ob', builtin.buffers, { desc = '[Ob] buffers' })
    end,
  },

  -- ===========================================================================
  -- LSP - Traditional keymaps (coexist with kickstart's gr* keymaps)
  -- ===========================================================================
  {
    'neovim/nvim-lspconfig',
    opts = function()
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { desc = 'LSP: ' .. desc })
      end

      -- Traditional LSP keymaps (user's muscle memory)
      map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('gy', require('telescope.builtin').lsp_type_definitions, '[G]oto T[y]pe Definition')
      map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
    end,
  },

  -- ===========================================================================
  -- WHICH-KEY - Register new keymap groups
  -- ===========================================================================
  {
    'folke/which-key.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.spec, {
        { '<leader>o', group = '[O]pen buffers' },
        { '<leader>a', group = '[A]grep search' },
      })
    end,
  },

  -- ===========================================================================
  -- BASIC KEYMAPS - Quick save
  -- ===========================================================================
  {
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = '[W]rite file' })
      vim.keymap.set('n', '<leader>W', ':wa<CR>', { desc = '[W]rite all files' })
    end,
  },
}
