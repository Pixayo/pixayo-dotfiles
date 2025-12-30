Template modules commonly used in my NixOS environment. These are designed
to keep the system organized and predictable by providing a standard structure for
modules and other files (e.g. `default.nix`, which is a special type of module).

By default, **all modules are enabled**. You can disable them by explicitly setting
the corresponding option to `false` in your `home.nix`/`configuration.nix` file.

To import every module within the same directory, use the `default.nix` template and
import the directory itself, for example: 
```nix
imports = [ ./myDirectory ];
```

To add a new Home Manager program module, use `myProgram.nix`.

To add a new custom system module, use `myModule.nix`.

**WARNING**: This directory **SHOULD NOT** be imported. Use its structure as a
template for other modules.