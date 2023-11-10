{ config, lib, pkgs, stable, inputs, ... }:

{
  services = {
    gnome.gnome-keyring.enable = true;
  };
}
