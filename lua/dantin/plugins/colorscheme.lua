return {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    -- make sure to load this before all the other start plugins
    priority = 1000,
    config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme nightfly]])
    end,
}
