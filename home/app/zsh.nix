{ pkgs, username, ... }:

{
  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      #histSize = 100000;
      # Automatically goes into directory without cd
      autocd = true;

      history = {
	        ignoreAllDups = true;
		      extended = true;
		      expireDuplicatesFirst = true;
	    };

      dirHashes = {
        docs = "$(xdg-user-dir DOCUMENTS)";
        dl = "$(xdg-user-dir DOWNLOAD)";
        pics = "$(xdg-user-dir PICTURES)";
        vids = "$(xdg-user-dir VIDEOS)";
      };

      dotDir = ".config/zsh";

      #shellInit = ''
      #  # Spaceship
      #  source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
      #  autoload -U promptinit; promptinit
      #  # Hook direnv
      #  #emulate zsh -c "$(direnv hook zsh)"

      #  #eval "$(direnv hook zsh)"
      #'';                                       # Theming

      # shellAliases = {
        #   ne = "nix-env";
        #   ni = "nix-env -iA";
        #   no = "nixops";
        #   ns = "nix-shell --pure";
        #   please = "sudo";
        # };

      plugins = [
        pkgs.zsh-autopair
      ]

      initExtra = ''
        # zsh vi mode install
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

        # # zsh autopair
        # source ${pkgs.zsh-autopair}/share/zsh/zsh-autopair/autopair.zsh
        # source ~/.zsh-autopair/autopair.zsh
        # autopair-init

        # powerlevel10k
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        test -f ~/.config/zsh/.p10k.zsh && source ~/.config/zsh/.p10k.zsh
      '';

      completionInit = ''
        # Basic auto/tab complete:
        autoload -U compinit
        zstyle ':completion:*' menu select
        zmodload zsh/complist
        compinit
        _comp_options+=(globdots)		# Include hidden files.
      '';  
    };
  };
  home.packages = with pkgs; [
    zsh
    nix-zsh-completions
    bat
    fasd
    fd
    fzf
    jq
    ripgrep
    tldr
  ];
}
