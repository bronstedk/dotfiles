local nvim_dap = "mfussenegger/nvim-dap"
return {
    {
        nvim_dap,
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("dapui").setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue Debug" })
        end,
    },
    {
        "leoluz/nvim-dap-go",
        ft = { "go" },
        dependencies = {
            nvim_dap,
        },
        config = function()
            require("dap-go").setup()
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = { "python" },
        dependencies = {
            nvim_dap,
        },
        config = function()
            require("dap-python").setup("~/.virtual_envs/debugpy/bin/python")
        end,
    },
}
