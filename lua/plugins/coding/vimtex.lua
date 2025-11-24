return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  ft = { "tex", "bib" }, -- Load for tex and bib files
  config = function()
    -- Set the PDF viewer
    -- For macOS, you can use:
    -- - Skim (recommended for macOS)
    -- - Preview
    -- - Zathura (if installed via Homebrew)
    vim.g.vimtex_view_method = "general" -- Uses macOS Preview.app

    -- Compiler settings
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-pdf",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    -- Enable folding
    vim.g.vimtex_fold_enabled = 1

    -- Disable overfull/underfull warnings
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
    }

    -- Enable TOC (table of contents)
    vim.g.vimtex_toc_config = {
      split_pos = "vert rightbelow",
      split_width = 50,
    }

    -- Syntax concealment settings (optional)
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      spacing = 0,
      greek = 1,
      math_bounds = 0,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 0,
      styles = 1,
    }

    -- Set conceallevel for better readability
    vim.opt.conceallevel = 2

    -- Key mappings for VimTeX
    vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { desc = "LaTeX: Compile" })
    vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "LaTeX: View PDF" })
    vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>", { desc = "LaTeX: Toggle TOC" })
    vim.keymap.set("n", "<leader>ll", "<cmd>VimtexLog<CR>", { desc = "LaTeX: View Log" })
    vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>", { desc = "LaTeX: Stop Compiler" })
    vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>", { desc = "LaTeX: View Errors" })
    vim.keymap.set("n", "<leader>lC", "<cmd>VimtexClean<CR>", { desc = "LaTeX: Clean auxiliary files" })
  end,
}
