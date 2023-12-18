{
  pkgs,
  config,
  specialArgs,
  ...
}: let
  dotfilesConfig = specialArgs.dotfilesConfig;
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
    ./shell/eza.nix
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
  ];

  # GitHub CLI tool
  programs.gh = {
    enable = true;
  };

  home = {
    file.".config/nvim" = {
      #source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/nvim";
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/nvim-nixos";
      recursive = true;
      # target = ".config/nvim";
    };
    file.".config/tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/tmux";
      recursive = true;
    };
  };
}
