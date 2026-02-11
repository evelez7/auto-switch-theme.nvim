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
end

return M

