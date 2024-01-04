{
  pkgs,
  config,
  inputs,
  ...
}: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins =
          prev.vimPlugins
          // {
            own-sentiment-nvim = prev.vimUtils.buildVimPlugin {
              name = "sentiment.nvim";
              src = inputs.sentiment-nvim;
            };
          };
      })
    ];
  };
  # nixpkgs = {
  #   overlays = [
  #     (
  #       final: prev: let
  #         simplePlugin = input: name:
  #           prev.vimUtils.buildVimPlugin {
  #             inherit name;
  #             src = input;
  #           };
  #       in {
  #         vimPlugins =
  #           prev.vimPlugins
  #           // {
  #             sentiment-nvim = simplePlugin inputs.sentiment-nvim "sentiment.nvim";
  #           };
  #       }
  #     )
  #   ];
  # };
}
