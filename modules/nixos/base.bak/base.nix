{
  config,
  lib,
  pkgs,
  stable,
  inputs,
  hostname,
  ...
}: {
  nix = {
    # Nix Package Manager Settings
    settings = {
      auto-optimise-store = true;
      # Enable flakes globally
      experimental-features = ["nix-command" "flakes"];
    };
    gc = {
      # Garbage Collection
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 1w";
    };
    # make `nix run nixpkgs#nixpkgs` use the same nixpkgs as the one used by this flake.
    registry.nixpkgs.flake = pkgs;
    channel.enable = false; # remove nix-channel related tools & configs, we use flakes instead.
  };
  # but NIX_PATH is still used by many useful tools, so we set it to the same value as the one used by this flake.
  # Make `nix repl '<nixpkgs>'` use the same nixpkgs as the one used by this flake.
  environment.etc."nix/inputs/nixpkgs".source = "${pkgs}";
  # https://github.com/NixOS/nix/issues/9574
  nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";

  nixpkgs.config.allowUnfree = true; # Allow Proprietary Software.
}
