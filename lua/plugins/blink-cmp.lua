return {
  "saghen/blink.cmp",
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    ---@type blink.cmp.KeymapConfig
    keymap = { preset = "enter" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lsp", "path" },
    },
  },
  opts_extend = { "sources.default" },
}
