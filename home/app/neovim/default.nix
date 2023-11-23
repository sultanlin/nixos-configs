{
  pkgs,
  config,
  ...
}:

{
  #xdg.configFile = {
    # astronvim's config
    #"nvim".source = astronvim;

    # my custom astronvim config, astronvim will load it after base config
    # https://github.com/AstroNvim/AstroNvim/blob/v3.32.0/lua/astronvim/bootstrap.lua#L15-L16
    #"astronvim/lua/user".source = ./astronvim_user;
  #};

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./nvim;
    # source = ../../dotfiles/.config/nvim;
    # source = /home/sultan/dotfiles/.config/nvim;
    recursive = true;
  };

  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;

      withPython3 = true;
      withNodeJs = true;
      extraPackages = with pkgs; [];

      #configFile.source = ../../dotfiles/.config/nvim;

      # currently we use lazy.nvim as neovim's package manager, so comment this one.
      plugins = with pkgs.vimPlugins; [
        # search all the plugins using https://search.nixos.org/packages
	{
        plugin = gruvbox-nvim;
        config = "colorscheme gruvbox";
	}
      ];
    };
  };
  home.packages = with pkgs; [
        #-- c/c++
        cmake
        gnumake
        checkmake
        gcc # c/c++ compiler, required by nvim-treesitter!

        #-- Optional Requirements:
        gdu # disk usage analyzer, required by AstroNvim
        ripgrep # fast search tool, required by AstroNvim's '<leader>fw'(<leader> is space key)
	      verible
        fd

        # https://github.com/LongerHV/nixos-configuration/blob/48c8052cb47c8d83f14adbd5c2c142ebef142dd3/home-manager/config/neovim.nix#L246
          
        # Essentials
        nodePackages.npm
        nodePackages.neovim

        # Python
        (python3.withPackages (ps: with ps; [
          setuptools # Required by pylama for some reason
          pylama
          black
          isort
          yamllint
          debugpy
        ]))
        nodePackages.pyright

        # Lua
        lua-language-server
        selene

        # Nix
        statix
        nixpkgs-fmt
        nil

        # C, C++
        clang-tools
        cppcheck

        # Shell scripting
        shfmt
        shellcheck
        shellharden

        # JavaScript
        nodePackages.prettier
        nodePackages.eslint
        nodePackages.typescript-language-server

        # Go
        go
        gopls
        golangci-lint
        delve

        # Additional
        nodePackages.bash-language-server
        nodePackages.yaml-language-server
        nodePackages.dockerfile-language-server-nodejs
        nodePackages.vscode-langservers-extracted
        nodePackages.markdownlint-cli
        taplo-cli
        codespell
        gitlint
        terraform-ls
        actionlint
      ];
}
