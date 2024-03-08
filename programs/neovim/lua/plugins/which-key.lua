local wk = require("which-key")

wk.setup()

wk.register {
    ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
    ["<leader>d"] = { name = "[D]ebug", _ = "which_key_ignore" },
    ["<leader>h"] = { name = "[H]istory", _ = "which_key_ignore" },
    ["<leader>t"] = { name = "[T]ab", _ = "which_key_ignore" },
}
