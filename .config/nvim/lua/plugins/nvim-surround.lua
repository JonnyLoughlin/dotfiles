return {
    "kylechui/nvim-surround",
    event = "BufReadPre",
    opts = {
        keymaps = {
            normal = "<leader>ys",
            normal_line = "<leader>yS",
            normal_cur = "<leader>yr",
            visual = "<leader>ys",
            change = "<leader>yc",
            delete = "<leader>yd",
            normal_cur_line = false,
            visual_line = false,
            change_line = false,
            insert = false,
            insert_line = false,
        },
    },
}
