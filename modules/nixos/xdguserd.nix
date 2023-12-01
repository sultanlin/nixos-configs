{ config, lib, pkgs, stable, inputs, ... }:

{
  environment = {
    systemPackages = with pkgs; [           # System-Wide Packages
      xdg-user-dirs
    ]; 
 };
}
