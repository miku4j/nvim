# AGENTS.md

Project-specific guidance for AI agents working in this Neovim config.
Git conventions, system package management, and Nix fallback live in the
global `~/.config/opencode/AGENTS.md`.

## Project

Neovim configuration written in Lua and managed by [lazy.nvim](https://github.com/folke/lazy.nvim),
which auto-bootstraps from `lua/config/lazy.lua`.

## Layout

- `init.lua` — entry point; requires core modules and the lazy config.
- `lua/core/` — `options.lua`, `keymaps.lua`, `autocmds.lua`, `helpers.lua`.
- `lua/config/lazy.lua` — lazy.nvim bootstrap and setup; `{ import = "plugins" }`
  loads every file under `lua/plugins/`.
- `lua/plugins/*.lua` — one file per plugin (or plugin group); each returns a
  spec table or a list of spec tables.

## Plugin conventions

- Add new plugins as a new file in `lua/plugins/` returning a spec table/list.
- Prefer lazy-loading via `event`, `cmd`, `keys`, or `ft` rather than eagerly.
- `lazy-lock.json` is committed for reproducibility — never hand-edit it.

## Formatting

- Lua is formatted with `stylua` (configured via conform.nvim).
- `stylua` is installed by mason at `~/.local/share/nvim/mason/bin/stylua`;
  if not on `$PATH`, use the Nix fallback from the global AGENTS.md.
- Run `stylua lua/` from the repo root before committing. No `.stylua.toml`
  is present; stylua defaults apply.
- No linter is configured.

## LSP

- mason.nvim + mason-lspconfig.nvim + nvim-lspconfig.
- Installed servers: `lua_ls`, `ts_ls`, `gopls`, `eslint`.
- Formatter/formatter tools ensured by `mason-tool-installer.nvim`:
  `stylua`, `prettier`, `goimports`, `gofumpt`, `shfmt`.

## Helpers

`lua/core/helpers.lua` exposes reusable functions: `format`, `root`,
`git_root`, `lazygit_toggle`, `bufdelete`, `bufdelete_other`,
`bufdelete_invisible`, `zoom`, `toggle_diagnostics`, `git_browse`.
Extend this module instead of duplicating logic in plugin specs.

## Verification

No test suite. Smoke test that the config loads cleanly:

```
nvim --headless '+qall'
```

Exit code `0` means the config loaded without errors.
