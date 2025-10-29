return {
    -- Mason: gerenciador de LSPs
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

    -- Mason LSPConfig: conecta Mason com LSPs do Neovim
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "ts_ls", "rust_analyzer" },
            })
        end,
    },

    -- LSPConfig: configura cada servidor
    -- Configuração central do LSP
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require('lspconfig')

            -- Função para registrar keymaps do LSP por buffer
            local function set_lsp_keymaps(bufnr)
                local opts = { buffer = bufnr, noremap = true, silent = true }

                -- Hover
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                -- Ir para definição
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                -- Referências
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                -- Implementações
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                -- Formatar arquivo
                vim.keymap.set("n", "<Leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
                -- Salvar arquivo
                vim.keymap.set("n", "<C-S>", ":write<CR>", opts)
            end

            -- Função on_attach padrão para todos os servidores
            local function on_attach(client, bufnr)
                set_lsp_keymaps(bufnr)

                -- Formatação automática ao salvar (opcional)
                if client.supports_method("textDocument/formatting") then
                    local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = group,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = true })
                        end,
                    })
                end
            end

            -- Lista de servidores e configurações específicas
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                        },
                    },
                },
                pyright = {},
                ts_ls = {},
                rust_analyzer = {},
                gopls = {},
            }

            -- Inicializa cada servidor
            for server, config in pairs(servers) do
                if lspconfig[server] then
                    config.on_attach = on_attach
                    lspconfig[server].setup(config)
                else
                    vim.notify('LSP not found:' .. server, vim.log.levels.WARN)
                end
            end
        end,
    },

    -- nvim-cmp (autocomplete)
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip", -- snippets
            "saadparwaiz1/cmp_luasnip"
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true })
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "luasnip" }
                })
            })
        end
    },

}
