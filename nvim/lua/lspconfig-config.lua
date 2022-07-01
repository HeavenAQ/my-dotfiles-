local nvim_lsp = require("lspconfig")
local protocol = require("vim.lsp.protocol")


local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Mapping.
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

--typescript
nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function () return vim.loop.cwd() end,
    }

--python
nvim_lsp.pyright.setup {
    on_attach = on_attach,
    typeCheckingMode = 'off',
    useLibraryCodeForTypes = true,
    filetypes = { "python", "python.py" }
    }

--C/C++
nvim_lsp.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    }

--vue
nvim_lsp.vuels.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function () return vim.loop.cwd() end,
    }

--html
nvim_lsp.html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'htmldjango' }
    }

--css
nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    }

--sql 
nvim_lsp.sqls.setup{
  settings = {
    sqls = {
      connections = {
        {
          driver = 'mysql',
          dataSourceName = 'root:root@tcp(127.0.0.1:13306)/world',
        },
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
        },
      },
    },
  },
}
