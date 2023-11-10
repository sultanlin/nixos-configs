#
#  Main system configuration. More information available in configuration.nix(5) man page.
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ configuration.nix *
#   └─ ./modules
#       ├─ ./desktops
#       │   └─ default.nix
#       ├─ ./editors
#       │   └─ default.nix
#       ├─ ./hardware
#       │   └─ default.nix
#       ├─ ./programs
#       │   └─ default.nix
#       ├─ ./services
#       │   └─ default.nix
#       ├─ ./shell
#       │   └─ default.nix
#       └─ ./theming
#           └─ default.nix
#

{ config, lib, pkgs, stable, inputs, vars, ... }:

{
#  imports = ( import ../modules/desktops ++
#              import ../modules/editors ++
#              import ../modules/hardware ++
#              import ../modules/programs ++
#              import ../modules/services ++
#              import ../modules/shell ++
#              import ../modules/theming );

  users.users.${vars.user} = {              # System User
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "camera" "networkmanager" "lp" "scanner" "kvm" "libvirtd" "plex" ];
  };

  time.timeZone = "Asia/Riyadh";        # Time zone and Internationalisation
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ar_SA.UTF-8";
      LC_IDENTIFICATION = "ar_SA.UTF-8";
      LC_MEASUREMENT = "ar_SA.UTF-8";
      LC_MONETARY = "ar_SA.UTF-8";
      LC_NAME = "ar_SA.UTF-8";
      LC_NUMERIC = "ar_SA.UTF-8";
      LC_PAPER = "ar_SA.UTF-8";
      LC_TELEPHONE = "ar_SA.UTF-8";
      LC_TIME = "ar_SA.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
#    sudo.wheelNeedsPassword = false;
  };

  fonts.packages = with pkgs; [                # Fonts
    carlito                                 # NixOS
    vegur                                   # NixOS
    source-code-pro
    jetbrains-mono
    font-awesome                            # Icons
    corefonts                               # MS
    (nerdfonts.override {                   # Nerdfont Icons override
      fonts = [ "FiraCode" "SourceCodePro" "JetBrainsMono" "Iosevka" "Hack" ];
    })
  ];

  environment = {
    variables = {                           # Environment Variables
      TERMINAL = "${vars.terminal}";
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };
    systemPackages = with pkgs; [           # System-Wide Packages
      # Terminal
      btop              # Resource Manager
      coreutils         # GNU Utilities
#      git               # Version Control
      killall           # Process Killer
      nano              # Text Editor
      neovim
#      nix-tree          # Browse Nix Store
      pciutils          # Manage PCI
#      ranger            # File Manager
      tldr              # Helper
      usbutils          # Manage USB
      wget              # Retriever

      kitty

      # Video/Audio
      alsa-utils        # Audio Control
      feh               # Image Viewer
      mpv               # Media Player
      pavucontrol       # Audio Control
      pipewire          # Audio Server/Control
      pulseaudio        # Audio Server/Control
      vlc               # Media Player
      stremio           # Media Streamer

      # Apps
      appimage-run      # Runs AppImages on NixOS
      google-chrome     # Browser
      remmina           # XRDP & VNC Client

      # File Management
      gnome.file-roller # Archive Manager
      okular            # PDF Viewer
      pcmanfm           # File Browser
      p7zip             # Zip Encryption
      rsync             # Syncer - $ rsync -r dir1/ dir2/
      unzip             # Zip Files
      unrar             # Rar Files
      zip               # Zip

      firefox

    ]; 
#    (with stable; [
#      # Apps
#      firefox           # Browser
#     ]);
 };

  programs = {
    dconf.enable = true;
  };

  services = {
    printing = {                            # CUPS
      enable = true;
    };
    pipewire = {                            # Sound
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    openssh = {                             # SSH
      enable = true;
      allowSFTP = true;                     # SFTP
    };
  };

  #services.flatpak.enable = true;                    # Enable Flatpak (see module options)

  nix = {                                   # Nix Package Manager Settings
    settings ={
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {                                  # Garbage Collection
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;        # Allow Proprietary Software.

  system = {                                # NixOS Settings
    stateVersion = "23.05";
  };

  home-manager.users.${vars.user} = {       # Home-Manager Settings
    home = {
      stateVersion = "23.05";
    };

    programs.home-manager.enable = true;
  };
}
