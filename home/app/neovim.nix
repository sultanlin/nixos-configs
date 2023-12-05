{
  pkgs,
  config,
  ...
}:
{
  nixpkgs.config = {
    programs.npm = {
      enable = true;
      npmrc = ''
        prefix = ''${HOME}/.npm-global
        color = true
      '';
    };
  };

  programs = {
    neovim =
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;
      defaultEditor = true;

      viAlias = true;
      vimAlias = true;

      withPython3 = true;
      withNodeJs = true;
      extraPackages = with pkgs; [];

      plugins = with pkgs.vimPlugins; [
      
      # COLORSCHEMES
      gruvbox-nvim
      gruvbox-material
      tokyonight-nvim
      oceanic-next
      catppuccin-nvim
      nightfox-nvim
      onehalf
      kanagawa-nvim
      onedark-nvim
      #onedarkpro-nvim
      nord-nvim
      onenord-nvim
      neovim-ayu
      papercolor-theme
      iceberg-vim
      nightfly
      sonokai
      everforest
      monokai-pro-nvim
# bamboo-nvim not yet available

      # TREESITTER
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      nvim-ts-context-commentstring
      nvim-ts-autotag

      # TELESCOPE
      telescope-nvim
      telescope-fzf-native-nvim

      # COMPLETION
      nvim-cmp
      luasnip
      cmp-path
      cmp-buffer
      cmp-nvim-lsp
      cmp_luasnip
      cmp-cmdline
      friendly-snippets
      lspkind-nvim
      cmp-nvim-lua

      nvim-lspconfig
      nvim-autopairs
      null-ls-nvim
      which-key-nvim
      comment-nvim
      {
        plugin = gitsigns-nvim;
        config = "require('gitsigns').setup()";
      }
      nvim-surround
      indent-blankline-nvim   # DONE
      lualine-nvim            # DONE
      refactoring-nvim        
      nvim-autopairs

      # CORE
      plenary-nvim
      nvim-web-devicons
      dressing-nvim
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

        # C#
        omnisharp-roslyn

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
