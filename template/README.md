Template modules widely used in my NixOS environment. These are designed
to keep the system organized and predictable by providing a standard structure for
modules and other files (e.g. `default.nix`, which is a special type of module).

By default, **all modules are enabled**. You can disable them by explicitly setting
the corresponding option to `false` in your `home.nix`/`configuration.nix` file.

To import every module withing the same directory, use `default.nix` and import the
directory itself, like: 
```nix
imports = [ ./myDirectory ];
```

To add a new HOME program, use `myProgram.nix`.

To add a new CUSTOM system module, use `myModule.nix`.

**WARNING**: This directory **SHOULD NOT** be imported. Use its structure as a
template for other modules.