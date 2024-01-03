return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    -- runs require('Comment').setup()
    config = true
}
