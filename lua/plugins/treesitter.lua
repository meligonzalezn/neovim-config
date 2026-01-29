return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ok_ts, ts_configs = pcall(require, "nvim-treesitter.configs")
    if ok_ts then
      ts_configs.setup({
        ensure_installed = { "lua", "javascript" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  end,
}

