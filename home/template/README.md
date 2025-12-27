Template modules related to Home Manager configurations. These are designed
to keep the system organized and predictable by providing a standard toggle-based 
structure.

By default, **all modules are enabled**. You can disable them by explicitly setting
the corresponding option to `false` in your `home.nix` file.

To add a new program, use the `myProgram.nix` module as a boilerplate for
your configuration.

**NOTE**: This directory **SHOULD NOT** be imported.