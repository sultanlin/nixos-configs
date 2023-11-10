#
#  These are the diffent profiles that can be used when using Nix on other distros.
#  Home-Manager is used to list and customize packages.
#
#  flake.nix
#   └─ ./nix
#       ├─ default.nix *
#       └─ <host>.nix
#

{ lib, inputs, pkgs, home-manager, vars, ... }:

let
  system = "x86_64-linux";                                  # System Architecture
  #pkgs = pkgs.legacyPackages.${system};
in
{
  pacman = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = { inherit inputs vars; };
    modules = [                                             # Modules Used
      ./pacman.nix
      {
        home = {
          username = "${vars.user}";
          homeDirectory = "/home/${vars.user}";
          packages = [ pkgs.home-manager ];
          stateVersion = "23.05";
        };
      }
    ];
  };
}
