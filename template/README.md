Template modules widely used in my NixOS environment. These are designed
to keep the system organized and predictable by providing a standard structure for
modules and other files (e.g. `default.nix`, which is a special type of module).

By default, **all modules are enabled**. You can disable them by explicitly setting
the corresponding option to `false` in your `home.nix`/`configuration.nix` file.

To add a new home program, use the `myProgram.nix` module as a boilerplate for
your configuration.

**WARNING**: This directory **SHOULD NOT** be imported. Use its structure as a
template for other modules.