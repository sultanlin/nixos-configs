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
    chrome
    vivaldi
    brave
    edge
  ];
}
