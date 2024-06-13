return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        { "j-hui/fidget.nvim", opts = {} },
        { "williamboman/mason.nvim", opts = {} },
        { "williamboman/mason-lspconfig.nvim" },
        { "folke/neodev.nvim", opts = { plugins = { "nvim-dap-ui", types = true } } },
        { "artemave/workspace-diagnostics.nvim" },
    },
    config = function()
        require("mason-lspconfig").setup({ automatic_installation = true })

        --- @type table<table<string>>
        local serverOpts = {}
        serverOpts["bashls"] = { filetypes = { "bash", "zsh" } }
        serverOpts["cssls"] = { filetypes = { "html", "css", "templ" } }
        serverOpts["gopls"] = { settings = {} }
        serverOpts["html"] = { filetypes = { "html", "templ", "gotmpl", "typescriptreact" } }
        serverOpts["htmx"] = { filetypes = { "html", "templ", "gotmpl", "typescriptreact" } }
        serverOpts["jsonls"] = {}
        serverOpts["lua_ls"] = {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    workspace = {
                        checkThirdParty = false,
                        library = { "${3rd}/luv/library", unpack(vim.api.nvim_get_runtime_file("", true)) },
                    },
                    hint = { enable = true, setType = true },
                },
            },
        }
        serverOpts["marksman"] = {}
        serverOpts["tailwindcss"] = {
            filetypes = { "css", "html", "javascriptreact", "templ", "typescriptreact" },
            init_options = { userLanguages = { templ = "html" } },
        }
        serverOpts["tsserver"] = {}
        serverOpts["templ"] = {}
        serverOpts["yamlls"] = {}
        serverOpts["zls"] = {}

        -- Configure Language Servers
        local lspconfig = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
        for k, v in pairs(serverOpts) do
            v.capabilities = capabilities
            v.on_attach = function(client, bufnr)
                require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
            end
            lspconfig[k].setup(v)
        end

        -- Create LSP keymaps
        vim.keymap.set("n", "KE", vim.diagnostic.open_float, { desc = "Float Error" })
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(ev)
                local function map(rhs, lhs, desc)
                    vim.keymap.set("n", rhs, lhs, { buffer = ev.buf, desc = desc })
                end

                -- Buffer local mappings.
                map("gd", require("telescope.builtin").lsp_definitions, "Go to Lsp Definitions")
                map("gr", require("telescope.builtin").lsp_references, "Go to Lsp References")
                map("gI", require("telescope.builtin").lsp_implementations, "Go to Lsp Implementations")
                map("KK", vim.lsp.buf.hover, "Hover Docuementation")
                map("KT", require("telescope.builtin").lsp_type_definitions, "Go to Type Definitions")
                map("KR", vim.lsp.buf.rename, "Rename")
                map("KC", vim.lsp.buf.code_action, "Code Action")
                map("KH", function()
                    ---@diagnostic disable-next-line: param-type-mismatch
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(nil))
                end, "Toggle Inlay Hints")
            end,
        })
        -- Hyprlang LSP
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
            pattern = { "*.hl", "hypr*.conf" },
            callback = function(event)
                print(string.format("starting hyprls for %s", vim.inspect(event)))
                vim.lsp.start({
                    name = "hyprlang",
                    cmd = { "hyprls" },
                    root_dir = vim.fn.getcwd(),
                })
            end,
        })
    end,
}
