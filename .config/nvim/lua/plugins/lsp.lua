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
            serverOpts["cssls"] = { filetypes = { "html", "css", "templ" } }
            serverOpts["gopls"] = {}
            serverOpts["html"] = {
                filetypes = { "html", "templ" },
                init_options = {
                    configurationSection = { "html" },
                    embeddedLanguages = { css = false, javascript = false },
                    provideFormatter = false,
                },
                html = { enable = false },
            }
            serverOpts["htmx"] = { filetypes = { "html", "templ" } }
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
            serverOpts["luacheck"] = {}
            serverOpts["marksman"] = {}
            serverOpts["rust_analyzer"] = {}
            serverOpts["tailwindcss"] = {
                settings = { emmetCompletions = true },
                filetypes = { "css", "html", "javascript", "javascriptreact", "templ", "typescript", "typescriptreact" },
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

            vim.filetype.add({ extension = { templ = "templ" } })

            -- Create LSP keymaps
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "error float" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("UserlspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { buffer = ev.buf, desc = "go to lsp definitions" })
                    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "go to lsp references" })
                    vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, { buffer = ev.buf, desc = "go to lsp implementations" })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover Docuementation" })
                    vim.keymap.set(
                        "n",
                        "<leader>lt",
                        require("telescope.builtin").lsp_type_definitions,
                        { buffer = ev.buf, desc = "go to lsp type definitions" }
                    )
                    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "lsp rename" })
                    vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "code action" })
                    vim.keymap.set("n", "<leader>lh", function()
                        vim.lsp.inlay_hint.enable(nil, not vim.lsp.inlay_hint.is_enabled(nil))
                    end, { desc = "toggle inlay hints" })
                end,
            })
        end,
    },
    {
        "laytan/tailwind-sorter.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
        build = "cd formatter && npm i && npm run build",
        opts = {
            on_save_enabled = true,
            on_save_pattern = { "*.html", "*.js", "*.jsx", "*.tsx", "*.templ" },
        },
    },
}
