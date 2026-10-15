# Leon Val's dotfile

This is my personal dotfiles that use yolk-dotfile as dotfile management tool. 

# Content

- bin (binaries and scripts for day to day use)
- config (configuration that are not deployed outside of the dotfiles directory)
- eggs (configuration that are deployed outside of the dotfiles directory and/or templated by yolk)
- export (configuration file that need to be imported and/or exported)
- share (complementary files like icons, fonts, cursor, etc)
- system (complementary file to setup the system usually scripts)
- unused (unused configuration)
- justfile (justfile recipe to easily run commands)
- theme (rhai file to store theme)
- yolk (rhai file for dotfiles configuration)

# Setup

## Prerequisite

[just](https://github.com/casey/just) command runner

[rust](https://rust-lang.org/) language (to build yolk)

[yolk](https://github.com/elkowar/yolk) to safeguard and deploy cloned dotfile directory

## Running the setup

On the dotfile directory invoke:

```sh
just setup
````

> [!Note]
> Currently for safety and compatibility reason this only safeguard and deploy the configuration in eggs directory. We need to manually install the extra package and other system script for the complete setup.
> The list is of package is available in the **export/package** dir.

To setup systemd invoke:

```sh
systemd-setup
````

---
The complete recipe can be printed by just invoking the `just` command without any args

# Credit

[just](https://github.com/casey/just) for an amazing command runner to simplify many processes

[yolk](https://github.com/elkowar/yolk) for a simple yet powerful dotfile management tool, fit for my case
