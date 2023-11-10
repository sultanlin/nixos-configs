{ config, pkgs, ...}:
{
  environment.systemPackages = [
    (import ../../shell/direnv-create.nix {inherit pkgs; })  
  ];
}

