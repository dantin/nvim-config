local python_version = "python3.11"

local pynvim_env = vim.fn.stdpath("data") .. "/pynvim_env"
if not vim.loop.fs_stat(pynvim_env) then
    vim.fn.system({
        "python3.11",
        "-m",
        "venv",
        pynvim_env,
    })
end

local pynvim_python = pynvim_env ..  "/bin/python"

local pynvim_lib = pynvim_env .. "/bin" .. python_version .. "/site-packages/pynvim"
if not vim.loop.fs_stat(pynvim_lib) then
    vim.fn.system({
        pynvim_python,
        "-m",
        "pip",
        "install",
        "pynvim",
    })
end

vim.g.python_host_prog = pynvim_python
vim.g.python3_host_prog = pynvim_python
