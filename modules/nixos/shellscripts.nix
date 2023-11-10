{ config, pkgs, ...}:
{
  environment.systemPackages = [
    (import ../../shell/direnv-create.nix {inherit pkgs; })  
    (import ../../shell/direnv-add.nix {inherit pkgs; })  
  ];
}

