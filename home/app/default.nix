

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
      # source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/nvim";
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/nvim-nixos";
      recursive = true;
      # target = ".config/nvim";
    };
  };
}
