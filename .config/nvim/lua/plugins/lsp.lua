return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
            { "williamboman/mason.nvim", opts = {} },
            { "williamboman/mason-lspconfig.nvim" },
            { "folke/neodev.nvim", opts = { plugins = { "nvim-dap-ui", types = true } } },
            { "ray-x/lsp_signature.nvim", opts = { hint_prefix = "" } },
        },
        config = function()
            require("mason-lspconfig").setup({ automatic_installation = true })

            --- @type table<table<string>>
            local serverOpts = {}
            serverOpts["bashls"] = { filetypes = { "bash", "zsh" } }
            serverOpts["biome"] = {}
            serverOpts["cssls"] = {}
            serverOpts["gopls"] = {}
            serverOpts["dockerls"] = {}
            serverOpts["html"] = { filetypes = { "html", "templ", "gotmpl", "gohtmltmpl", "typescriptreact" } }
            serverOpts["htmx"] = { filetypes = { "html", "templ", "gotmpl", "gohtmltmpl", "typescriptreact" } }
            serverOpts["jsonls"] = {}
            serverOpts["lua_ls"] = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
                        hint = { enable = true, setType = true },
                    },
                },
            }
            serverOpts["marksman"] = {}
            serverOpts["rust_analyzer"] = {}
            serverOpts["tailwindcss"] = {
                filetypes = { "css", "html", "javascriptreact", "templ", "gohtmltmpl", "typescriptreact" },
                init_options = { userLanguages = { templ = "html" } },
            }
            serverOpts["templ"] = {}
            serverOpts["tsserver"] = {}
            serverOpts["yamlls"] = {}

            -- Configure Language Servers
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            for k, v in pairs(serverOpts) do
                v.capabilities = capabilities
                lspconfig[k].setup(v)
            end

            -- Create LSP keymaps
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "error float" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("UserlspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local function map(rhs, lhs, desc)
                        vim.keymap.set("n", rhs, lhs, { buffer = ev.buf, desc = desc })
                    end

                    -- Buffer local mappings.
                    map("gd", require("telescope.builtin").lsp_definitions, "go to lsp definitions")
                    map("gr", require("telescope.builtin").lsp_references, "go to lsp references")
                    map("gI", require("telescope.builtin").lsp_implementations, "go to lsp implementations")
                    map("K", vim.lsp.buf.hover, "Hover Docuementation")
                    map("<leader>lt", require("telescope.builtin").lsp_type_definitions, "go to lsp type definitions")
                    map("<leader>lr", vim.lsp.buf.rename, "lsp rename")
                    map("<leader>lc", vim.lsp.buf.code_action, "code action")
                    map("<leader>lh", function()
                        vim.lsp.inlay_hint.enable(nil, not vim.lsp.inlay_hint.is_enabled(nil))
                    end, "toggle inlay hints")
                end,
            })
        end,
    },
}
