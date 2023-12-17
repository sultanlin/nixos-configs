{
  config,
  pkgs,
  username,
  lib,
  ...
}: {
  xdg.userDirs.enable = true;
  # xdg.userDirs.createDirectories = true;
  # Packages that should be installed to the user profile.
  home = {
    # sessionVariables = {
    #   XDG_CACHE_HOME = "$HOME/.cache";
    #   XDG_CONFIG_HOME = "$HOME/.config";
    #   XDG_DATA_HOME = "$HOME/.local/share";
    #   XDG_STATE_HOME = "$HOME/.local/state";
    #   XDG_BIN_HOME = "$HOME/.local/bin"; # Not technically in the official xdg specification
    #   XDG_DESKTOP_DIR = "$HOME/desktop";
    #   XDG_DOWNLOAD_DIR = "$HOME/downloads";
    #   # AJLOW_OCAML_TOOLS = "dune merlin ocaml-lsp-server odoc ocamlformat utop
    #   # dune-release core core_unix base";
    # };
    # sessionPath = [
    #   "$XDG_BIN_HOME"
    # ];
    packages = with pkgs; [
      neofetch
      nnn # terminal file manager

      # archives
      zip
      xz
      unzip
      p7zip

      # utils
      ripgrep # recursively searches directories for a regex pattern
      jq # A lightweight and flexible command-line JSON processor
      yq-go # yaml processer https://github.com/mikefarah/yq
      eza # A modern replacement for ‘ls’
      fzf # A command-line fuzzy finder

      # networking tools
      mtr # A network diagnostic tool
      iperf3
      dnsutils # `dig` + `nslookup`
      ldns # replacement of `dig`, it provide the command `drill`
      aria2 # A lightweight multi-protocol & multi-source command-line download utility
      socat # replacement of openbsd-netcat
      nmap # A utility for network discovery and security auditing
      ipcalc # it is a calculator for the IPv4/v6 addresses

      # misc
      cowsay
      file
      which
      tree
      gnused
      gnutar
      gawk
      zstd
      gnupg

      # nix related
      # it provides the command `nom` works just like `nix` with more details log output
      nix-output-monitor

      # productivity
      hugo # static site generator
      glow # markdown previewer in terminal

      btop # replacement of htop/nmon
      iotop # io monitoring
      iftop # network monitoring

      # system call monitoring
      strace # system call monitoring
      ltrace # library call monitoring
      lsof # list open files

      # system tools
      sysstat
      lm_sensors # for `sensors` command
      ethtool
      pciutils # lspci
      usbutils # lsusb
    ];
  };
}
