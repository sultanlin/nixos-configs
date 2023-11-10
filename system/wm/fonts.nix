{ config, lib, pkgs, stable, inputs, ... }:

{
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
