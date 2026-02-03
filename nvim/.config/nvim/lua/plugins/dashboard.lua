local quotes = {
  "Welcome Back, Commander.",
  "Here we go again.",
  "Control the instruction pointer.",
  "The terminal is waiting.",
  "Ship it. Then fix it.",
  "Think twice. Code once.",
  "Nothing works. Until it does.",
  "It works on my machine.",
  "Debugging is the real game.",
  "Silence means it compiled.",
  "One more refactor.",
  "Break things. Fix them.",
  "The machine obeys logic, not hope.",
  "You didn’t come this far to quit.",
  "Hello again, old friend.",
  "Another day, another exploit.",
  "Control the stack, control the flow.",
  "Every crash teaches something.",
}

local function random_quote()
  math.randomseed(os.time())
  return quotes[math.random(#quotes)]
end

return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,

        -- random quote header
        header = random_quote(),

        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "m", desc = "Mason", action = ":Mason" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
