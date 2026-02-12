https://github.com/user-attachments/assets/4f0f255d-5f28-405e-a246-b9ad7fa3a4df


A simple plugin to automatically switch themes when the system theme changes.

This plugin simply creates an autocmd to listen for an `OptionSet` event on `background`.
Neovim automatically updates `background` based on an OSC signal.

I created this plugin because similar ones do a lot of complex DBus stuff or
duplicate what Neovim already does to determine whether or not the system
changed themes.
This only relies on Neovim's own internal updating.

Tested on macOS and Fedora GNOME.

> [!WARNING]
> Explicitly setting your `background` will cause Neovim to delete its own
> autocmd that detects a system theme change, which will break this plugin.

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

## Manual Toggle/Switch

If you'd like, you can manually toggle Neovim's theme regardless of the current
system theme.
That way, you can switch to your dark theme while your system is in light mode.
The theme will still switch if there is a system theme change.

```
:AutoSwitchTheme

:AutoSwitchTheme toggle
```

