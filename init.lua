-- vim.g.python_host_prog = '/home/david/.pyenv/versions/neovim/bin/python'
-- Globals
local function init_globals()
    vim.g.python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'
end

init_globals()

require("dantin.core")
-- require("dantin.pynvim")
require("dantin.lazy")
