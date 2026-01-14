<!-- Default README (English) -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./assets/ignore/banner-dark.png">
    <source media="(prefers-color-scheme: light)" srcset="./assets/ignore/banner-light.png">
    <img alt="Pixayo Dotfiles - NixOS / Home Manager Setup" src="./assets/banner-dark.png">
  </picture>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Nix-Flakes-7EBAE4?style=for-the-badge&logo=nixos&logoColor=white">
  <!-- <img src="https://img.shields.io/badge/Hyprland-Wayland-00C2FF?style=for-the-badge"> -->
  <img src="https://img.shields.io/badge/GNOME-4A86CF?style=for-the-badge&logo=gnome&logoColor=white">
</p>

---

<p>
  <a href="README.md">EN</a> |
  <a href="README.pt-br.md">PT-BR</a>
</p>

## About

This repository is a collection of Nix files meant to define and
manage my personal NixOS environment.

Something like this could (and probably should) be private. However,
I decided to make it public to share my experience using NixOS and,
hopefully, serve as a source of information for other users.

For that reason, this repository is not just a pile of obscure
configurations. Most decisions and changes are documented to some
extent, either through README files and other Markdown documents
or directly within the code itself. I plan to keep expanding this
documentation over time.

## Content

My system is designed to be portable and adaptable, supporting multiple users or just a single one. Many configurations are split into their own modules, which can be easily decoupled, overridden, or removed, while also providing a foundation for expansion and the creation of new modules.

Therefore, I believe my configuration is a good example of how to make your own setup portable and robust through the use of metadata and a “lego-like” model.

### Repository structure

```text
├── assets -> Visual resources and non-essential utilities
│   └── ...
├── home-manager -> User environment configuration
│   ├── data -> Home environment metadata
│   └── ...
├── nixos -> NixOS system configuration
│   ├── data -> System metadata
│   └── ...
└── template -> Reusable templates
    └── ...
```

The `nixos` and `home-manager` directories are independent and can be used separately. Both include their own `flake` module, which provides essential resources for their submodules, making replication on other machines and Linux systems using the Nix package manager much more intuitive.

In particular, the `data` directories do not define behavior; they only retain mutable data for their respective environments. In `home-manager`, for example: the file `./home-manager/data/env.nix` contains user-related data such as name, `home`, important `paths`, and even the system architecture, which is passed to `nixpkgs`.

On the other hand, the `assets`, `template`, and essentially any other directory that is not one of the two main ones mentioned in the previous paragraph do not serve a technical purpose. Although they may contain scripts and other utilities, they are not required for the system to function.

### About wallpapers

The implementation of wallpapers in the assets directory may seem disconnected from the repository’s main goal, but this is a personal choice. Whenever I need to apply my system to another machine or "nuke" an existing one, I prefer to have everything versioned in a single place. This speeds up the replication process and simplifies installation scripts.

All wallpapers are public domain. Feel free to use them if you wish.

## Visuals

All the visual identity of my setup comes from `home-manager` + `stilyx`. You can see more details in the `./home-manager/myDotfiles` directory.

<p align="center"> 
  <img src="./assets/ignore/screenshot1.png">
  <img src="./assets/ignore/screenshot2.png">
  <img src="./assets/ignore/screenshot3.png">
</p>

## Installation

> Only in pt-br for now.

## ...