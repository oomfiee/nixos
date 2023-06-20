<div align="center">

## **Startkit**

  <a href="https://codeberg.org/oomfie/Dotfiles/src/branch/main/LICENSE">
    <img src="https://img.shields.io/static/v1?label=License&message=GPL-3&color=FFB5A7&style=for-the-badge"></a>
</div>
&nbsp;

# ⚠️ **Warnings**
Do not apply these settings on your own system, Fork this repo and modify it to your desires.

# 📁 **Directory structure**

```
- [.configs] Contains all .config files.
- [.local] Contains all .local files.
- [modules] Contains all the nixos modules that make up this configuraiton. (you need to add your own configs first before running)
- [flake.nix] Contains the main flake.nix file.
- [home.nix] Contains the home.nix file.
```

# 📥 **How to**
These dot files can be installed onto a system by one way:

## **Already running nixos system**
If you have setup a nixos system with a configuration.nix file its possible to switch over to this nix config with
the following commands:

```shell
rm ~/.gtkrc-2.0 (to make sure home-manager doesnt fail)
nix --experimental-features "nix-command flakes"
nix-shell -p git
```
then

```shell
git clone https://github.com/oomfiee/nixos
cd nixos
sudo nixos-rebuild switch --flake .# --impure
```

The above assuse your computer name matches one of the configurations in the flake.
