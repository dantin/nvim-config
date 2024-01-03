return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        -- source for text in buffer.
        "hrsh7th/cmp-buffer",
        -- source for file system paths.
        "hrsh7th/cmp-path",
        -- snippet engine
        "L3MON4D3/LuaSnip",
        -- for autocompletion
        "saadparwaiz1/cmp_luasnip",
        -- useful snippets
        "rafamadriz/friendly-snippets",
        -- vs-code like pictograms
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        local lspkind = require("lspkind")

        -- laods vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            -- configure how nvim-cmp interacts with snippet engine.
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- previous suggestion.
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                -- next suggestion.
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                -- show completion suggestions.
                ["<C-Space>"] = cmp.mapping.complete(),
                -- close completion window.
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            -- sources for autocompletion.
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                -- snippets
                { name = "luasnip" },
                -- text within current buffer
                { name = "buffer" },
                -- file system paths
                { name = "path" },
            }),
            -- configure lspkind for vs-code like pictograms in completion menu.
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
    end
}
