{
  pkgs,
  config,
  ...
}:
let
  configPath = builtins.toString ../../dotfiles/.config/nvim;
in
{
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  programs = {
    neovim = {
      #let
      #  toLua = str: "lua << EOF\n${str}\nEOF\n";
      #  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
      #in
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
	#{
		#plugin = gruvbox-nvim;
		#plugin = tokyonight;
		#type = "lua";
        	#config = ''
          	#	require("plugins.theme")
        	#'';
	#}
      gruvbox-nvim
      tokyonight-nvim
      #gruvbox-nvim
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      telescope-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-path
      cmp-buffer
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp_luasnip
      nvim-autopairs
      luasnip
      friendly-snippets
      lspkind-nvim
      null-ls-nvim
      plenary-nvim
      nvim-web-devicons
      which-key-nvim
      comment-nvim
      nvim-surround
      gitsigns-nvim
      indent-blankline-nvim
      lualine-nvim
      dressing-nvim
      refactoring-nvim
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

	# Clipboard
	xclip
	wl-clipboard
      ];
}
