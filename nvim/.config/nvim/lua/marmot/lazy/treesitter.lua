return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- The configuration now goes directly inside the 'opts' table
    ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "typescript", "clojure", "rust", "c_sharp", "hlsl" },
    highlight = { 
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- In the new version, we call setup on the main module, not .configs
    require("nvim-treesitter").setup(opts)
  end,
}
