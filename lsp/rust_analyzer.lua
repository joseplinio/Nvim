-- it isn't working, I need to solve that

return {
  cmd = { "rust-analyzer" },
  root_markers = { "Cargo.lock", "Cargo.toml", },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}
