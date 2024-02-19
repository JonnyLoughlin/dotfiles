return {
  {
    -- lSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
      { "williamboman/mason.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim" },
      { "folke/neodev.nvim", opts = { plugins = { "nvim-dap-ui", types = true } } },
      { "ray-x/lsp_signature.nvim", opts = { hint_prefix = "" } },
    },
    -- Install language servers.
    config = function()
      require("mason-lspconfig").setup({ automatic_installation = true })

      -- Configure Language Servers
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.bashls.setup({
        capabilities = capabilities,
        filetypes = { "bash", "zsh" },
      })

      lspconfig.biome.setup({ capabilities = capabilities })

      lspconfig.cssls.setup({
        capabilities = capabilities,
        filetypes = { "html", "css", "templ" },
      })

      lspconfig.gopls.setup({ capabilities = capabilities })

      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
        init_options = {
          configurationSection = { "html" },
          embeddedLanguages = {
            css = false,
            javascript = false,
          },
          provideFormatter = false,
        },
        html = {
          enable = false,
        },
      })

      lspconfig.htmx.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })

      lspconfig.jsonls.setup({ capabilities = capabilities })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
            hint = {
              enable = true,
              setType = true,
            },
          },
        },
      })

      lspconfig.marksman.setup({ capabilities = capabilities })

      lspconfig.rust_analyzer.setup({ capabilities = capabilities })

      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        settings = {
          emmetCompletions = true,
        },
        filetypes = { "css", "html", "javascript", "javascriptreact", "templ", "typescript", "typescriptreact" },
        init_options = {
          userLanguages = { templ = "html" },
        },
      })

      lspconfig.templ.setup({ capabilities = capabilities })
      vim.filetype.add({ extension = { templ = "templ" } })

      lspconfig.yamlls.setup({ capabilities = capabilities })

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
          vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
          vim.keymap.set("n", "<leader>lt", require("telescope.builtin").lsp_type_definitions, { buffer = ev.buf, desc = "go to lsp type definitions" })
          vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "lsp rename" })
          vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "code action" })
          vim.keymap.set("n", "<leader>la", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "add workspace folder" })
          vim.keymap.set("n", "<leader>ld", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "remove workspace folder" })
          vim.keymap.set("n", "<leader>ll", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, { buffer = ev.buf, desc = "list workspace folders" })
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
