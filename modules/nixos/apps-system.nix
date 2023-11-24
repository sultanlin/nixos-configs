{ config, lib, pkgs, stable, inputs, ... }:

{
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.greetd.enableGnomeKeyring = true;
  };

  # programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

  environment = {
    # Linux shells install
    shells = with pkgs; [
      bash
      nushell
      zsh
    ];
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    systemPackages = with pkgs; [           # System-Wide Packages
      # Terminal
      coreutils         # GNU Utilities
#      nix-tree          # Browse Nix Store
      pciutils          # Manage PCI
#      ranger            # File Manager
      tldr              # Helper
      usbutils          # Manage USB

      kitty

      # Video/Audio
      alsa-utils        # Audio Control
      feh               # Image Viewer
      mpv               # Media Player
      pavucontrol       # Audio Control
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

      neovim
      nano		# Basic text editor
      wget              # Retriever
      curl
      aria2
      git               # Version Control
      git-lfs
      psmisc  		# killall/pstree/prtstat/fuser/...
      # zsh

      # create a fhs environment by command `fhs`, so we can run non-nixos packages in nixos!
      (
        let
          base = pkgs.appimageTools.defaultFhsEnvArgs;
        in
          pkgs.buildFHSUserEnv (base
            // {
              name = "fhs";
              targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config];
              profile = "export FHS=1";
              runScript = "bash";
              extraOutputsToInstall = ["dev"];
            })
      )
    ]; 
 };


  hardware.bluetooth.enable = true;

  services = {
    printing.enable = true;		    # CUPS
    pipewire = {                            # Sound
      enable = true;
      package = pkgs.pipewire;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    # bluetooth
    blueman.enable = true;
    
    gnome.gnome-keyring.enable = true;

    # https://flatpak.org/setup/NixOS
    flatpak.enable = true;

    dbus.packages = [pkgs.gcr];
    geoclue2.enable = true;

    # Fix shebang issues with FHS
    # envfs.enable = true;
  };
}
