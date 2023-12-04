
{
  description = "Nix and NixOS System Flake Configuration";

  outputs = inputs @ { self, nixpkgs-unstable, nixpkgs-stable, home-manager, ... }:   # Function telling flake which inputs to use
    let
        hostname = "vm"; #current system/profile
        username = "sultan";
        dotfilesConfig = "/home/sultan/nixos-config/dotfiles/config";
	userfullname = "Sultan Linjawi";
	useremail = "skorpion219@hotmail.co.uk";
	
	x64_system = "x86_64-linux";
	allSystems = [ x64_system ];

	nixosSystem = import ./hosts;

	vm_modules = {
	  nixos-modules = [
	    ./hosts/vm
	    ./modules/hyprland.nix
	  ];
	  home-module = import ./home;
	};
	
	desktop_modules = {
	  nixos-modules = [
	    ./hosts/desktop
	    ./modules/hyprland.nix
	  ];
	  home-module = import ./home;
	};

	laptop_modules = {
	  nixos-modules = [
	    ./hosts/laptop
	    ./modules/hyprland.nix
	  ];
	  home-module = import ./home;
	};

	x64_specialArgs =
          {
            inherit username userfullname useremail hostname dotfilesConfig;
            # use unstable branch for some packages to get the latest updates
            pkgs-stable = import nixpkgs-stable {
              system = x64_system; # refer the `system` parameter form outer scope recursively
              # To use chrome, we need to allow the installation of non-free software
              config.allowUnfree = true;
            };
          }
	  // inputs;
    in {
      nixosConfigurations = let
      	base_args = {
	  inherit home-manager;
	  nixpkgs = nixpkgs-unstable;
	  system = x64_system;
	  specialArgs = x64_specialArgs;
	};
      in {
        # vm with hyprland compositor
	vm = nixosSystem (vm_modules // base_args);

        # desktop with hyprland compositor
	#desktop = nixosSystem (desktop_modules // base_args);

        # laptop with hyprland compositor
	#laptop = nixosSystem (laptop_modules // base_args);
      };

    };

  inputs =                                                              # References Used by Flake
    {
      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";         	# Unstable Nix Packages (Default)
      nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";          # Stable Nix Packages 

    # home-manager, used for managing user configuration
      home-manager = {                                                      # User Environment Manager
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
      };

      # modern window compositor
      hyprland.url = "github:hyprwm/Hyprland";
    
      # community wayland nixpkgs
      nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    
      # anyrun - a wayland launcher
      anyrun = {
        url = "github:Kirottu/anyrun";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
        };
  
      # secrets management, lock with git commit at 2023/7/15
      agenix.url = "github:ryantm/agenix/0d8c5325fc81daf00532e3e26c6752f7bcde1143";
  
      ########################  Color Schemes  #########################################
  
      # color scheme - catppuccin
      catppuccin-btop = {
        url = "github:catppuccin/btop";
        flake = false;
      };
      catppuccin-fcitx5 = {
        url = "github:catppuccin/fcitx5";
        flake = false;
      };
      catppuccin-bat = {
        url = "github:catppuccin/bat";
        flake = false;
      };
      catppuccin-alacritty = {
        url = "github:catppuccin/alacritty";
        flake = false;
      };
      catppuccin-wezterm = {
        url = "github:catppuccin/wezterm";
        flake = false;
      };
      catppuccin-helix = {
        url = "github:catppuccin/helix";
        flake = false;
      };
      catppuccin-starship = {
        url = "github:catppuccin/starship";
        flake = false;
      };
      catppuccin-hyprland = {
        url = "github:catppuccin/hyprland";
        flake = false;
      };
      catppuccin-cava = {
        url = "github:catppuccin/cava";
        flake = false;
      };
      cattppuccin-k9s = {
        url = "github:catppuccin/k9s";
        flake = false;
      };
    };
  
    # the nixConfig here only affects the flake itself, not the system configuration!
    nixConfig = {
      experimental-features = ["nix-command" "flakes"];
  
      # nix community's cache server
      extra-substituters = [
        "https://nix-community.cachix.org"
        "https://nixpkgs-wayland.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      ];
    };
  }

