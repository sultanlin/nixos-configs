{
  pkgs,
  config,
  specialArgs,
  ...
}: let
  dotfilesConfig = specialArgs.dotfilesConfig;
  config_sym_dir = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}";
in {
  imports = [
    #./creative.nix
    #./gtk.nix
    #./immutable-file.nix
    #./ssh.nix
    #./wallpaper.nix
    ./xdg.nix
    ./bash.nix
    ./bat.nix
    ./btop.nix
    ./git.nix
    ./media.nix
    ./neovim.nix
    #./neovim
    #./shell
    ./starship.nix
    ./terminal
    ./tmux.nix
    ./zsh.nix
    ./direnv.nix
    ./browser
    ./shell/eza.nix
    ./hyprland.nix
  ];

  home.packages = with pkgs; [
    # GUI apps
    insomnia # REST client
    wireshark # network analyzer

    # e-book viewer(.epub/.mobi/...)
    # do not support .pdf
    foliate

    # instant messaging
    telegram-desktop
    discord
    qq # https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/networking/instant-messengers/qq

    # remote desktop(rdp connect)
    remmina
    freerdp # required by remmina

    # misc
    flameshot

    # On screen keyboard
    wvkbd

    plex-media-player
  ];

  home = {
    file.".config/nvim" = {
      #source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/nvim";
      # source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/nvim-nixos";
      source = "${config_sym_dir}/nvim-nixos";
      recursive = true;
      # target = ".config/nvim";
    };
    #file.".config/tmux" = {
    # source = "${config_sym_dir}/tmux";
    #  recursive = true;
    #};
    file.".config/hypr" = {
      source = "${config_sym_dir}/hypr";
      recursive = true;
    };
  };
}
