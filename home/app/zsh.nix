{ pkgs, username, ... }:

{
  # home.users.${username}.shell = pkgs.zsh;

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


      #shellInit = ''
      #  # Spaceship
      #  source ${pkgs.spaceship-prompt}/share/zsh/site-functions/prompt_spaceship_setup
      #  autoload -U promptinit; promptinit
      #  # Hook direnv
      #  #emulate zsh -c "$(direnv hook zsh)"

      #  #eval "$(direnv hook zsh)"
      #'';                                       # Theming

      initExtra = ''
        # zsh vi mode install
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      ''
    };
  };
}
