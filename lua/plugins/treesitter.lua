return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- rama main: sin `nvim-treesitter.configs`; se instala y se activa a mano
    require("nvim-treesitter").install({
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "java",
      "json",
      "html",
      "css",
      "yaml",
      "markdown",
      "markdown_inline",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        -- pcall: filetypes sin parser simplemente no se resaltan
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
