{ config, pkgs, username, ... }:

{
  imports = [
    # ./desktop
    ./app
    # ./hyprland/hyprland.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
