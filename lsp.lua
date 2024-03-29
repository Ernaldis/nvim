-- setup mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})


-- setup mason-lspconfig
require("mason-lspconfig").setup()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require("rust-tools").setup({
  tools = { -- rust-tools options
    autoSetHints = true,
    RustHoverActions = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      show_parameter_hints = false,
      parameter_hints_prefix = "<-",
      other_hints_prefix = "=>",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
    },
    hover_actions = {
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
    },
  },

  server = { -- rust-analyer options
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        }
      },
    },
  },
})
require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
require("lspconfig").gopls.setup({
  cmd = { 'gopls' },
  -- on_attach = on_attach,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  },
  capabilities = capabilities,
  on_attach = on_attach,
})
require("lspconfig").taplo.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})
require("lspconfig").pylsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})
require("lspconfig").bashls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})
require("lspconfig").yamlls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
})
require('lspconfig').jsonnet_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flags,
  formatting = {
    Indent              = 2,
    MaxBlankLines       = 2,
    StringStyle         = 'single',
    CommentStyle        = 'slash',
    PrettyFieldNames    = true,
    PadArrays           = false,
    PadObjects          = true,
    SortImports         = true,
    UseImplicitPlus     = true,
    StripEverything     = false,
    StripComments       = false,
    StripAllButComments = false,
  },
}
require("lspconfig").jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    json = {
      format = { indent = 2 },
    },
  },
})
