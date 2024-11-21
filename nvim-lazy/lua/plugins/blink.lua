return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "saghen/blink.compat", opts = {} },
    },
    opts = {
      nerd_font_variant = "normal",
      trigger = { signature_help = { enabled = true } },
      keymap = {
        preset = "enter",
        ['<Esc>'] = { 'hide', 'fallback' },
        ["<Tab>"] = {
          function(cmp)
            if cmp.windows.autocomplete.win:is_open() then
              return cmp.select_next()
            elseif cmp.is_in_snippet() then
              return cmp.snippet_forward()
            end
          end,
          "fallback"
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.windows.autocomplete.win:is_open() then
              return cmp.select_prev()
            elseif cmp.is_in_snippet() then
              return cmp.snippet_backward()
            end
          end,
          "fallback"
        }
      }
    }
  },
}
