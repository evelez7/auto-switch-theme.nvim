<p align="center">
  <video src="https://github.com/evelez7/auto-switch-theme.nvim/blob/main/.github/example.mp4" alt="Theme change example"/>
</p>

A simple plugin to automatically switch themes when the system theme changes.

This plugin simply creates an autocmd to listen for an `OptionSet` event on `background`.
Neovim automatically updates `background` based on an OSC signal.

I created this plugin because similar ones do a lot of complex DBus stuff or
duplicate what Neovim already does to determine whether or not the system
changed themes.
This only relies on Neovim's own internal updating.

## Setup

lazy.nvim example:

```
return {
  'evelez7/auto-switch-theme.nvim',
  opts = {
      light = 'dookie',
      dark = 'github-monochrome-solarized'
  }
}
```

