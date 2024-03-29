# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.8.0] - 2022-09-18

### Added

- Add cmp-cmdline
- Add sqls.nvim
- Add winbar
- Add find-cmdline
- Add dashboard native
- Add git conflict
- Add nvim-ufo

### Changed

- Refactor Telescope buffer previewer
- Refactor Telescope hologram
- Refactor Statusline
- Disable Cmp in comment
- Set cmdheight to 0 (core dump)
- Set rest keymap to buffer
- Set laststatus to 3
- Show diagnostic in floating window
- Use nvim_set_hl for highlight

### Fixed

- Fix search untracked file Telescope
- Fix Telescope icon (nvim-mini-file-icon)
- Fix Auto-session create empty file when git change branch

### Removed

- Remove dashboard.nvim
- Remove <leader>q due to <C-l>

## [0.7.0] - 2022-07-01

### Added

- Perfect center dashboard.
- Show dashboard when close all buffers.
- Preview image when search file

### Changed

- Update screenshot in README
- Update plugin in README

### Removed

- Project description in README
