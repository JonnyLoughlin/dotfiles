return {
  {
    -- Configure Key Hints
    "folke/which-key.nvim",
    config = function()
      -- [[ Configure which-key]]
      local wk = require("which-key")
      wk.register({
        ["<leader>"] = { name = "search" },
        c = { name = "[c]omment" },
        l = { name = "[l]sp" },
        y = { name = "[y]ou surround" },
      }, { prefix = "<leader>" })
    end,
  },
  {
    -- Configure Clipboard to work over ssh
    "ojroques/nvim-osc52",
    config = function()
      local function copy(lines, _)
        require("osc52").copy(table.concat(lines, "\n"))
      end

      local function paste()
        ---@diagnostic disable-next-line: param-type-mismatch
        return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
      end

      vim.g.clipboard = {
        name = "osc52",
        copy = { ["+"] = copy, ["*"] = copy },
        paste = { ["+"] = paste, ["*"] = paste },
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          normal = "<leader>ys",
          normal_line = "<leader>yS",
          normal_cur = "<leader>yr",
          normal_cur_line = "<leader>yR",
          visual = "<leader>ys",
          visual_line = "<leader>yS",
          change = "<leader>yc",
          change_line = "<leader>yC",
          delete = "<leader>yd",
          insert = false,
          insert_line = false,
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    -- Configure indent highlighting
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    depeencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    commit = "0dca928",
    event = "VeryLazy",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
        },
      })
    end,
  },
  {
    -- Configure comment toggler
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<leader>cl",
          block = "<leader>cb",
        },
        opleader = {
          line = "<leader>cl",
          block = "<leader>cb",
        },
        extra = {
          above = "<leader>cO",
          below = "<leader>co",
          eol = "<leader>cA",
        },
      })
      vim.keymap.set(
        "n",
        "<leader>cx",
        "03li*                              <Esc>A                              *<Esc>yypk3lv$r*yyjp",
        { noremap = true, silent = true, desc = "[c]omment bo[x]" }
      )
    end,
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<leader>t]],
        direction = "float",
        insert_mappings = false,
      })
      vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "exit term" })
    end,
  },
}
