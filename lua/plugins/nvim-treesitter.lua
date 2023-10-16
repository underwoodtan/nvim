return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "bash", "make", "c", "cpp", "vim", "lua", "python", "rust", "scala", "markdown" },
      -- 启用代码高亮模块
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- 启用增量选择模块
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        },
      },
      -- 启用代码缩进模块 (=)
      indent = {
        enable = true,
      },
      -- Playground
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,     -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      }
    },
    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- set up verilog fold
      if require "nvim-treesitter.parsers".has_parser("verilog") then
        local folds_query =
        [[
          [
            (function_body_declaration)
            (task_body_declaration)
            (generate_block)
            (list_of_port_declarations)
            (module_instantiation)
            (list_of_port_connections)
          ] @fold
        ]]
        require("vim.treesitter.query").set("verilog", "folds", folds_query)
      end
    end,
  },
  {
    'nvim-treesitter/playground',
  },
}
