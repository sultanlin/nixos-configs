{
  config,
  pkgs,
  lib,
  ...
} @ args: {
  imports = [
    ./fhs-fonts.nix
    ./user-group.nix
    ./settings-system.nix
    ./boot-system.nix
    ./apps-system.nix
    #../cifs-mount.nix
    #../nfs-mount.nix
    ./shellscripts.nix
    ./nginx.nix
    # ../../overlays
  ];
  # nixpkgs.overlays = import ../../overlays args;
}
