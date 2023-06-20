{ config, pkgs, inputs, lib, ... }: {

  gtk.enable = true;
  qt.enable = true;
  xdg.enable = true;

  home = {
    stateVersion = "22.11"; # // Specificify release version (Newer better) //
    username      = "USERNAME"; # FIXME: Change `USERNAME` to username
    homeDirectory = "/home/USERNAME"; # FIXME: Change `USERNAME` to username
    packages = with pkgs; # // List all your packages here //
      [
        firefox
      ];
  };

  # // Flatpak goofy patch for nixos //
  home.file.".local/share/flatpak/overrides/global".text = ''
  [Context]
   filesystems=/run/current-system/sw/share/X11/fonts:ro;/nix/store:ro;xdg-config/gtk-3.0:ro;xdg-config/gtk-2.0:ro;xdg-config/gtk-4.0:ro;xdg-config/gtkrc:ro
  '';

  # // Force GTK+ (GTK3/GTK4) packages to use breeze //
  gtk.theme.package = pkgs.libsForQt5.breeze-gtk;
  gtk.theme.name = "Breeze";

  # // Simple way to have your dots syncing in every nixos setup //
  home.file.".config/" = {
  recursive = true;
  source = "/home/USERNAME/dots/.config"; # FIXME: Change `USERNAME` to username
  };

  home.file.".local/" = {
  recursive = true;
  source = "/home/USERNAME/dots/.local"; # FIXME: Change `USERNAME` to username
  };

   # // Force all packages to use breeze cursor //
   home.pointerCursor = {
      name = "breeze_cursors";
      package = pkgs.libsForQt5.breeze-icons;
      x11 = {
        enable = true;
        defaultCursor = "breeze_cursors";
      };
   };
}
