return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry", -- Contains the Roslyn LSP
          },
        },
      },
    },
    config = function()
      require("roslyn").setup({
		exe = vim.fn.stdpath("data") .. "/home/francisco-zizzi/.local/share/nvim/mason/packages/roslyn/libexec/Microsoft.CodeAnalysis.LanguageServer",
        args = {
          "--logLevel=Information",
          "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
          "--stdio",
        },
        config = {
          settings = {
            ["csharp|background_analysis"] = {
              dotnet_compiler_diagnostics_scope = "fullSolution",
              dotnet_analyzer_diagnostics_scope = "fullSolution",
            },
          },
        },
      })
    end,
  },
}
