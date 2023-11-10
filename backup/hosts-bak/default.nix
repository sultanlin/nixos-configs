#
#  These are the different profiles that can be used when building NixOS.
#
#  flake.nix 
#   └─ ./hosts  
#       ├─ default.nix *
#       ├─ configuration.nix
#       └─ ./<host>.nix
#           └─ default.nix 
#

{ lib, inputs, nixpkgs, nixpkgs-stable, home-manager, vars, ... }:

let
  system = "x86_64-linux";                                  # System Architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                              # Allow Proprietary Software
  };

  stable = import nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{

  vm = lib.nixosSystem {                                    # VM Profile
    inherit system;
    specialArgs = {
      inherit inputs pkgs vars stable;
      host = {
        hostName = "vm";
        mainMonitor = "Virtual-1";
        secondMonitor = "";
      };
    };
    modules = [
      ./vm
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
	home-manager.users."${vars.user}" = import ../home.nix;
      }
    ];
  };
}
