	{
  pkgs,
  astronvim,
  config,
  specialArgs,
  ...
}:
###############################################################################
#
#  Neovim's configuration and all its dependencies(lsp, formatter, etc.)
#
#e#############################################################################
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
      # plugins = with pkgs.vimPlugins; [
      #   # search all the plugins using https://search.nixos.org/packages
      # ];
      # currently we use lazy.nvim as neovim's package manager, so comment this one.
    };
  };
  home = {

    packages = with pkgs;
      [
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
        go
      ];
  };
}
