return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()
      require("dap-go").setup()

      require("nvim-dap-virtual-text").setup({
        -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if
            name:match("secret")
            or name:match("api")
            or value:match("secret")
            or value:match("api")
          then
            return "*****"
          end

          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end,
      })

      vim.keymap.set(
        "n",
        "<leader>db",
        dap.toggle_breakpoint,
        { desc = "Toggle Breakpoint" }
      )
      vim.keymap.set(
        "n",
        "<leader>dr",
        dap.run_to_cursor,
        { desc = "Run to Cursor" }
      )

      vim.keymap.set("n", "<leader>d?", function()
        ---@diagnostic disable: missing-fields
        require("dapui").eval(nil, { enter = true })
      end, { desc = "Eval var under cursor" })

      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>dv", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dk", dap.step_back, { desc = "Step Back" })
      vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
