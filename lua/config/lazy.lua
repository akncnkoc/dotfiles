local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        -- disable UI heavy features and snippets
        defaults = {
          autocomplete = {
            snippets = false,
          },
          animations = false,
          ui = {
            hover = false,
            notifications = false,
            telescope = false,
          },
        },
      },
    },
    { import = "plugins" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
  },
  defaults = {
    lazy = true, -- lazy load all custom plugins
    version = false,
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "matchit",
        "matchparen",
        "netrwPlugin",
      },
      reset = true,
      paths = {},
    },
    reset_packpath = true,
    reset_rtp = true,
  },
})
