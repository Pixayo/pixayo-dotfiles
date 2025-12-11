This directory contains **desktop-environment-specific** configuration modules..

The active desktop environment is selected via the `desktop` parameter in
`flake.nix`. Only the DEs present in this directory are available.

If you want to add a different DE, use the **COSMIC** implementation as a template, 
and be aware that the main configuration file (`configuration.nix`) enables any DE 
passed to `desktop` by default.

Current options:
- **GNOME** (custom setup)
- **COSMIC** (basic setup)

Planned DE implementations:
- **CINNAMON** 
- **HYPRLAND** (not sure)
