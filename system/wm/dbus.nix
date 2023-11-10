{ config, lib, pkgs, stable, inputs, ... }:

{
    dbus.packages = [pkgs.gcr];
    geoclue2.enable = true;
  };
}
