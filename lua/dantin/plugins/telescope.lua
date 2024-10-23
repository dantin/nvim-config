return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        -- local transform_mod = require("telescope.actions.mt").transform_mod

        -- local trouble = require("trouble")
        -- local trouble_telescope = require("trouble.sources.telescope")

        -- or create your custom action
        -- local custom_actions = transform_mod({
        --     open_trouble_qflist = function(prompt_bufnr)
        --         trouble.toggle("quickfix")
        --     end,
        -- })

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        -- move to prev result
                        ["<C-k>"] = actions.move_selection_previous,
                        -- move to next result
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        -- ["<C-t>"] = trouble_telescope.open,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        -- for conciseness.
        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy Find Fies in CWD" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy Find Recent Fies" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find String in CWD" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find String under Cursor in CWD" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    end
}
