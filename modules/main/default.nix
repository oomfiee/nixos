{pkgs, config, lib, ...}:
{
    imports = [
    ./configuration.nix # // your main system config
    ./hardware-configuration.nix # // same as above but for hardware //
    ];
}