let
  # dotfilesConfig = specialArgs.dotfilesConfig;
  config_sym_dir = conf_path: config.lib.file.mkOutOfStoreSymlink "${specialArgs.dotfilesConfig}/${conf_path}";
in {
      #source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/nvim";
      # source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/nvim-nixos";
      config_sym_dir "nvim-nixos";
      # target = ".config/nvim";
    #file.".config/tmux" = {
      # source = config.lib.file.mkOutOfStoreSymlink "${dotfilesConfig}/tmux";
    #  source = config_sym_dir "tmux";
    #  recursive = true;
    #};
  };
}
