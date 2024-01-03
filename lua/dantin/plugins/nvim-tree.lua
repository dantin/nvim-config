return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        -- change color for arrows in tree to light blue.
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        -- configure nvim-tree
        nvimtree.setup({
            view = {
                width = 35,
                -- relativenumber = true,
            },
            sort = {
                sorter = "case_sensitive",
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            }
        })

        -- set keymaps
        local keymap = vim.keymap

        -- toggle file explorer.
        keymap.set("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer"})
        -- toggle file explorer on current file.
        keymap.set("n", "<leader>nf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
        -- collapse file explorer
        keymap.set("n", "<leader>nc", "<cmd>NvimTreeCollapse<CR>", { desc = "Toggle file explorer" })
        -- refresh file explorer
        keymap.set("n", "<leader>nr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    end
}
