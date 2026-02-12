local M = {}

M.config = {
  light = "default",
  dark = "default"
}

local function apply_theme(background)
  local user_colorscheme = M.config[background]
  if (user_colorscheme) then
    vim.cmd.colorscheme(user_colorscheme)
  end
end

function M.setup(opts)
  M.config = vim.tbl_extend("force", M.config, opts or {})

  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "background",
    desc = "Auto switch colorscheme on background change",
    callback = function()
      apply_theme(vim.o.background)
    end,
  })

  vim.api.nvim_create_user_command("AutoSwitchTheme", function(opts)
    local arg = opts.args

    local target

    if arg == "toggle" or arg == "" then
      target = (vim.o.background == "dark") and "light" or "dark"
    else
      vim.notify("Invalid argument.", vim.log.levels.ERROR)
      return
    end

    vim.o.background = target
    apply_theme(target)
  end, {
    nargs = "?",
    complete = function()
      return { "toggle" }
    end,
    desc = "Toggle between light and dark theme",
  })
end

return M

