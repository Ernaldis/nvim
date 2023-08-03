vim.api.nvim_set_keymap('n', '<C-l>', ':nohl<CR><C-l>:echo "Search Cleared"<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })


-- lsp key bindings
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


-- Snippet bindings
-- Jump forward or backward
vim.api.nvim_set_keymap('i', '<Tab>', 'vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-next)\'      : \'<Tab>\'',
  { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-next)\'      : \'<Tab>\'',
  { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'vsnip#jumpable(-1)  ? \'<Plug>(vsnip-jump-prev)\'      : \'<S-Tab>\'',
  { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'vsnip#jumpable(-1)  ? \'<Plug>(vsnip-jump-prev)\'      : \'<S-Tab>\'',
  { expr = true })
-- Expand Snippet
vim.api.nvim_set_keymap('i', '<C-j>', 'vsnip#expandable()  ? \'<Plug>(vsnip-expand)\'         : \'<C-j>\'', { expr = true })
vim.api.nvim_set_keymap('s', '<C-j>', 'vsnip#expandable()  ? \'<Plug>(vsnip-expand)\'         : \'<C-j>\'', { expr = true })

-- Expand or Jump
vim.api.nvim_set_keymap('i', '<C-l>', 'vsnip#available(1)  ? \'<Plug>(vsnip-expand-or-jump)\' : \'<C-l>\'', { expr = true })
vim.api.nvim_set_keymap('s', '<C-l>', 'vsnip#available(1)  ? \'<Plug>(vsnip-expand-or-jump)\' : \'<C-l>\'', { expr = true })

-- Select or Cut Text
vim.api.nvim_set_keymap('n', 's', '<Plug>(vsnip-select-text)', {})
vim.api.nvim_set_keymap('x', 's', '<Plug>(vsnip-select-text)', {})
vim.api.nvim_set_keymap('n', 'S', '<Plug>(vsnip-cut-text)', {})
vim.api.nvim_set_keymap('x', 'S', '<Plug)(vsnip-cut-text)', {})


-- Telescope
vim.keymap.set("n", "<leader>cd", T.extensions.zoxide.list)


-- Hop bindings
local function setHopMapping(key, direction, offset, mode)
  vim.keymap.set('', key, function()
    local hopOpts = { direction = direction, current_line_only = true, hint_offset = offset or 0 }
    if mode == 'word' then
      Hop.hint_words(hopOpts)
    elseif mode == 'pattern' then
      Hop.hint_patterns(hopOpts)
    else
      Hop.hint_char1(hopOpts)
    end
  end, { remap = true })
end

setHopMapping('<leader>f', Directions.AFTER_CURSOR)
setHopMapping('<leader>F', Directions.BEFORE_CURSOR)
setHopMapping('<leader>t', Directions.AFTER_CURSOR, -1)
setHopMapping('<leader>T', Directions.BEFORE_CURSOR, 1)

local hopOps = {silent = true}
vim.api.nvim_set_keymap('n', '<leader>w', [[<cmd>lua require'hop'.hint_words()<cr>]], hopOps)
vim.api.nvim_set_keymap('n', '<leader>p', [[<cmd>lua require'hop'.hint_patterns()<cr>]], hopOps)
