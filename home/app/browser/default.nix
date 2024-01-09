{
  pkgs,
  config,
  specialArgs,
  ...
}: {
  imports = [
    # ./edge.nix
    # ./chrome.nix
    # ./qutebrowser.nix
    # ./firefox.nix
  ];

  home.packages = with pkgs; [
    firefox
    google-chrome
    vivaldi
    brave
    microsoft-edge
  ];
}
