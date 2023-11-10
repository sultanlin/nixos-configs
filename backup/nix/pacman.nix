#
#  Nix Setup using Home-manager
#
#  flake.nix
#   └─ ./nix
#       ├─ default.nix
#       └─ pacman.nix *
#

{ config, inputs, pkgs, vars, ... }:

{
  home = {
    activation = {                                      # Rebuild Script
      linkDesktopApplications = {                       # Add Packages To System Menu
        after = [ "writeBoundary" "createXdgUserDirectories" ];
        before = [ ];
        data = "sudo /usr/bin/update-desktop-database"; # Updates Database
      };
    };
  };

  xdg = {                                               # Add Nix Packages to XDG_DATA_DIRS
    enable = true;
    systemDirs.data = [ "/home/${vars.user}/.nix-profile/share" ];
  };

  nix = {                                               # Nix Package Manager Settings
    settings ={
      auto-optimise-store = true;
    };
    package = pkgs.nixFlakes;                           # Enable Flakes
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };
  nixpkgs.config.allowUnfree = true;                    # Allow Proprietary Software.
}
