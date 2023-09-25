local dap = require "dap"
local DEBUGGER_LOCATION = os.getenv("HOME") .. "/.local/share/dbg/netcoredbg/netcoredbg"

dap.adapters.coreclr = {
    type = "executable",
    command = DEBUGGER_LOCATION,
    args = { "--interpreter=vscode" }
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end
    }
}

vim.keymap.set("n", "<space>db", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<space>dc", function() dap.continue() end)
vim.keymap.set("n", "<space>dl", function() dap.run_last() end)
vim.keymap.set("n", "<space>ds", function() dap.step_over() end)
vim.keymap.set("n", "<space>di", function() dap.step_into() end)
vim.keymap.set("n", "<space>do", function() dap.step_out() end)

require "nvim-dap-virtual-text".setup()