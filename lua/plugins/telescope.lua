return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local ok_telescope, builtin = pcall(require, "telescope.builtin")
      if ok_telescope then
        vim.keymap.set("n", "<C-p>", function()
          builtin.find_files({
            hidden = false,
          })
        end)
      end
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select") 
    end 
  },
}
