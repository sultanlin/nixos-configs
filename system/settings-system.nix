{ config, lib, pkgs, stable, inputs, ... }:

{

  # supported fil systems, so we can mount any removable disks with these filesystems
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "xfs"
    #"zfs"
    "ntfs"
    "fat"
    "vfat"
    "exfat"
    "cifs" # mount windows share
  ];

  # Bootloader, grub vs systemd-boot. Grub better for dual booting
  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
      configurationLimit = lib.mkDefault 10;
      useOSProber = true;
    };
    timeout = 1;
    # UEFI settings
    # efi = {
    #     canTouchEfiVariables = true;
    #     efiSysMountPoint = "/boot";
    #   }
  };

  # Networking
  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
  };


  # Time zone and Internationalisation
  time.timeZone = "Asia/Riyadh";        
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  environment = {
    variables = {                           # Environment Variables
      TERMINAL = "${"kitty"}";
      EDITOR = "${"nvim"}";
      VISUAL = "${"nvim"}";
    };
 };

  # Default shell
  #users.defaultUserShell = pkgs.zsh;

  programs = {
    # The OpenSSH agent remembers private keys for you
    # so that you don’t have to type in passphrases every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent.
    ssh.startAgent = true;
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };

  # A key remapping daemon for linux.
  # https://github.com/rvaiya/keyd
  services.keyd = {
    enable = true;
  #  settings = {
  #    main = {
  #      # overloads the capslock key to function as both escape (when tapped) and control (when held)
  #      capslock = "overload(control, esc)";
  #    };
  #  };
  };

  hardware.bluetooth.enable = true;

  services = {
    # Enable openssh daemon
    openssh = {                             # SSH
      enable = true;
      allowSFTP = true;                     # SFTP
      settings = {
        X11Forwarding = true;
	PermitRootLogin = "no"; # disable root login
	#PasswordAuthentication = false; # disable password login
      };
      openFirewall = true;
    };
    # Power management
    power-profiles-daemon = {
      enable = true;
    };
    upower.enable = true;
  };

  xdg.portal = {
    enable = true;
    # Sets environment variable NIXOS_XDG_OPEN_USE_PORTAL to 1
    # This will make xdg-open use the portal to open programs,
    # which resolves bugs involving programs opening inside FHS envs or with unexpected env vars set from wrappers.
    # xdg-open is used by almost all programs to open a unknown file/uri
    # alacritty as an example, it use xdg-open as default, but you can also custom this behavior
    # and vscode has open like `External Uri Openers`
    xdgOpenUsePortal = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # for gtk
      # xdg-desktop-portal-kde  # for kde
    ];
  };


  nix = {                                   # Nix Package Manager Settings
    settings ={
      auto-optimise-store = true;
      # Enable flakes globally
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {                                  # Garbage Collection
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 1w";
    };
  };

  nixpkgs.config.allowUnfree = true;        # Allow Proprietary Software.

  environment.variables = {
    # fix https://github.com/NixOS/nixpkgs/issues/238025
    TZ = "${config.time.timeZone}";
  };

  fonts = {
    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;
    fontDir.enable = true;

    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome

      carlito                                 # NixOS
      vegur                                   # NixOS
      corefonts                               # MS

      noto-fonts 
      noto-fonts-cjk 
      noto-fonts-emoji 
      noto-fonts-extra 

      source-sans 
      source-serif 
      source-han-sans 
      source-han-serif 

      jetbrains-mono
      # nerdfonts
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
	  "SourceCodePro" 
	  "Hack"
        ];
      })

      (pkgs.callPackage ../../fonts/icomoon-feather-icon-font.nix {})
    ];

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}


#      LC_ADDRESS = "ar_SA.UTF-8";
#      LC_IDENTIFICATION = "ar_SA.UTF-8";
#      LC_MEASUREMENT = "ar_SA.UTF-8";
#      LC_MONETARY = "ar_SA.UTF-8";
#      LC_NAME = "ar_SA.UTF-8";
#      LC_NUMERIC = "ar_SA.UTF-8";
#      LC_PAPER = "ar_SA.UTF-8";
#      LC_TELEPHONE = "ar_SA.UTF-8";
#      LC_TIME = "ar_SA.UTF-8";
