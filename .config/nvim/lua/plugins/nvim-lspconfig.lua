return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} },
        { "williamboman/mason.nvim", opts = {} },
        { "williamboman/mason-lspconfig.nvim" },
        { "artemave/workspace-diagnostics.nvim" },
        {
            "nanotee/sqls.nvim",
            ft = { "sql" },
            keys = {
                { "<leader>ds", "<cmd>SqlsSwitchConnection<cr>", desc = "Sqls Switch Connection" },
            },
        },
    },
    config = function()
        require("mason-lspconfig").setup({ automatic_installation = true })

        local serverOpts = {}
        serverOpts["bashls"] = { filetypes = { "bash", "sh", "zsh" } }
        serverOpts["biome"] = {}
        serverOpts["clangd"] = {}
        serverOpts["cssls"] = {}
        serverOpts["gopls"] = {
            settings = {
                gopls = {
                    gofumpt = true,
                    hints = {
                        enable = true,
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                        functionParameterNames = true,
                    },
                },
            },
        }
        serverOpts["html"] = { filetypes = { "html", "templ", "typescriptreact" } }
        serverOpts["htmx"] = { filetypes = { "html", "templ" } }
        -- -- Hyprlang LSP
        serverOpts["hyprls"] = {}
        -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        --     pattern = { "*.hl", "hypr*.conf" },
        --     callback = function(event)
        --         print(string.format("starting hyprls for %s", vim.inspect(event)))
        --         vim.lsp.start({
        --             name = "hyprlang",
        --             cmd = { "/home/jonny/proj/hyprls/hyprls" },
        --             root_dir = vim.fn.getcwd(),
        --         })
        --     end,
        -- })
        serverOpts["jsonls"] = {}
        serverOpts["lua_ls"] = {}
        serverOpts["marksman"] = {}
        serverOpts["omnisharp"] = {}
        serverOpts["pyright"] = {}
        serverOpts["rust_analyzer"] = {}
        serverOpts["sqls"] = { on_attach = function(client, bufnr) require("sqls").on_attach(client, bufnr) end }
        serverOpts["tailwindcss"] = {
            filetypes = { "css", "html", "javascriptreact", "templ", "typescriptreact" },
            init_options = { userLanguages = { templ = "html" } },
        }
        serverOpts["ts_ls"] = {}
        serverOpts["templ"] = {}
        serverOpts["taplo"] = { root_dir = require("lspconfig.util").root_pattern("*.toml", ".git") }
        serverOpts["yamlls"] = {}
        serverOpts["zls"] = {}

        -- Configure Language Servers
        local lspconfig = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
        for k, v in pairs(serverOpts) do
            v.capabilities = capabilities
            if k ~= "sqls" then v.on_attach = function(client, bufnr) require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr) end end
            lspconfig[k].setup(v)
        end

        -- Create LSP keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(ev)
                local function map(rhs, lhs, desc) vim.keymap.set("n", rhs, lhs, { buffer = ev.buf, desc = desc }) end

                -- Buffer local mappings.
                map("KE", vim.diagnostic.open_float, "Float Error")
                map("gd", require("telescope.builtin").lsp_definitions, "Go to Lsp Definitions")
                map("grr", require("telescope.builtin").lsp_references, "Go to Lsp References")
                map("gI", require("telescope.builtin").lsp_implementations, "Go to Lsp Implementations")
                map("KK", vim.lsp.buf.hover, "Hover Docuementation")
                map("KT", require("telescope.builtin").lsp_type_definitions, "Go to Type Definitions")
                map("grn", vim.lsp.buf.rename, "Rename")
                map("gra", vim.lsp.buf.code_action, "Code Action")
                map("KH", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil)) end, "Toggle Inlay Hints")
            end,
        })
    end,
}
