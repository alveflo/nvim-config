return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Github copilot
  {
    "github/copilot.vim", -- Official GitHub Copilot plugin
    event = "InsertEnter", -- Load the plugin when entering Insert mode
  },

  {
    "Decodetalkers/csharpls-extended-lsp.nvim",
    -- config = function()
    --   require('csharpls_extended').setup()
    -- end,
  },

  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    config = function ()
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
        org_agenda_locale = 'en_US.UTF-8', -- Set locale to English
        mappings = {
          org = {
            org_toggle_checkbox = '<C-x>',
            org_todo = '<C-t>',
          }
        }
      })

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },

  {
    "GustavEikaas/easy-dotnet.nvim",
    event = 'VeryLazy',
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
    config = function()
      require("easy-dotnet").setup({
      ---@type TestRunnerOptions
      test_runner = {
        ---@type "split" | "float" | "buf"
        viewmode = "buf",
        enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
        noBuild = true,
        noRestore = true,
          icons = {
            passed = "",
            skipped = "",
            failed = "",
            success = "",
            reload = "",
            test = "",
            sln = "󰘐",
            project = "󰘐",
            dir = "",
            package = "",
          },
        mappings = {
          run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
          filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
          debug_test = { lhs = "<leader>d", desc = "debug test" },
          go_to_file = { lhs = "g", desc = "got to file" },
          run_all = { lhs = "<leader>R", desc = "run all tests" },
          run = { lhs = "<leader>r", desc = "run test" },
          peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
          expand = { lhs = "o", desc = "expand" },
          expand_node = { lhs = "E", desc = "expand node" },
          expand_all = { lhs = "-", desc = "expand all" },
          collapse_all = { lhs = "W", desc = "collapse all" },
          close = { lhs = "q", desc = "close testrunner" },
          refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" }
        },
        --- Optional table of extra args e.g "--blame crash"
        additional_args = {}
      },
      ---@param action "test" | "restore" | "build" | "run"
      terminal = function(path, action, args)
        local commands = {
          run = function()
            return string.format("dotnet run --project %s %s", path, args)
          end,
          test = function()
            return string.format("dotnet test %s %s", path, args)
          end,
          restore = function()
            return string.format("dotnet restore %s %s", path, args)
          end,
          build = function()
            return string.format("dotnet build %s %s", path, args)
          end
        }

        local command = commands[action]() .. "\r"
        vim.cmd("vsplit")
        vim.cmd("term " .. command)
      end,
      })
    end
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
