return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.cmd.cprev()
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      -- { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    keys = {
      { "<leader>du", function () require("dapui").toggle() end, desc = "Toggle Dap UI" },
      { "<leader>dv", function () require("dapui").eval() end, desc = "Toggle Dap UI" },
      { "<leader>dwa", function () require("dapui").elements.watches.add() end, desc = "Toggle Watch Add" },
      { "<leader>dwd", function () require("dapui").elements.watches.remove() end, desc = "Toggle Watch Delate" },
    }
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Dap Breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<CR>", desc = "Dap Continue" },
    }
  }
}
