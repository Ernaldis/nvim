local config_path = vim.fn.stdpath('config')
package.path = config_path .. '/?.lua;' .. package.path

require('plugins')
require('autocommands')
require('keybindings')
require('lsp')
require('completion')

vim.o.number = true
vim.o.swapfile = false
vim.o.wildmenu = true
vim.o.backspace = "indent,eol,start"
vim.o.undodir = vim.fn.expand("~/.cache/nvim/undo")
vim.o.undofile = true
vim.o.incsearch = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.expandtab = true
vim.o.showmatch = true
vim.o.hlsearch = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.list = true
vim.o.listchars = "tab:-\\|"
vim.o.autoindent = true
vim.o.shell = "bash -i"
vim.o.encoding = "UTF-8"
vim.o.wildmode = "longest,list"
vim.o.spelllang = "en_us"
-- vim.o.spell = true
vim.o.mouse = ""


-- Set up nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()


-- telescope/zoxide
local t = require("telescope")
local z_utils = require("telescope._extensions.zoxide.utils")

-- Configure the extension
t.setup({
  extensions = {
    zoxide = {
      prompt_title = "[ Walking on the shoulders of TJ ]",
      mappings = {
        default = {
          after_action = function(selection)
            print("Update to (" .. selection.z_score .. ") " .. selection.path)
          end
        },
        ["<C-s>"] = {
          before_action = function(selection) print("before C-s") end,
          action = function(selection)
            vim.cmd.edit(selection.path)
          end
        },
        ["<C-q>"] = { action = z_utils.create_basic_command("split") },
      },
    },
  },
})

-- Load the extension
t.load_extension('zoxide')

-- Add a mapping
vim.keymap.set("n", "<leader>cd", t.extensions.zoxide.list)


-- setup lualine
require('lualine').setup {
  options = { theme = 'palenight' }
}


require('nvim-autopairs').setup({
  enable_check_bracket_line = true
})
