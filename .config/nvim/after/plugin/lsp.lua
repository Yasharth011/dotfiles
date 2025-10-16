vim.opt.signcolumn = "yes"

-- ================================
-- Mason setup
-- ================================
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup({
    ui = {
        border = "rounded",
        icons = { package_installed = "✔", package_pending = "➜", package_uninstalled = "✗" },
    },
    ensure_installed = { "lua_ls", "pyright", "clangd" },
    automatic_installation = true,
})

-- ================================
-- Diagnostics signs
-- ================================
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = { border = "rounded" },
})

-- ================================
-- nvim-cmp setup
-- ================================
local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")

cmp.setup({
    snippet = {
        expand = function(args)
	     require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

local capabilities = cmp_lsp.default_capabilities()

-- ================================
-- on_attach keymaps
-- ================================
local function on_attach(client, bufnr)
    local opts = { buffer = bufnr }
    local bufmap = vim.keymap.set

    bufmap("n", "K", vim.lsp.buf.hover, opts)
    bufmap("n", "gd", vim.lsp.buf.definition, opts)
    bufmap("n", "gD", vim.lsp.buf.declaration, opts)
    bufmap("n", "gi", vim.lsp.buf.implementation, opts)
    bufmap("n", "go", vim.lsp.buf.type_definition, opts)
    bufmap("n", "gr", vim.lsp.buf.references, opts)
    bufmap("n", "gs", vim.lsp.buf.signature_help, opts)
    bufmap({ "n", "x" }, "<F3>", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP keymaps",
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        on_attach(client, event.buf)
    end,
})

-- ================================
-- Automatically setup and enable all Mason-installed servers
-- ================================
local all_servers = mason_lsp.get_installed_servers()

for _, server in ipairs(all_servers) do
    local config = {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    -- Optional server-specific settings
    if server == "lua_ls" then
        config.settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                hint = { enable = true },
            },
        }
    end

    -- Register and enable
    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end

