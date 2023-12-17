{
  config,
  pkgs,
  username,
  lib,
  ...
}: {
  xdg.userDirs.enable = true;
  xdg.userDirs.createDirectories = true;
  # Packages that should be installed to the user profile.
  home = {
    sessionVariables = {
      XDG_CACHE_HOME = lib.mkForce "$HOME/.cache";
      XDG_CONFIG_HOME = lib.mkForce "$HOME/.config";
      XDG_DATA_HOME = lib.mkForce "$HOME/.local/share";
      XDG_STATE_HOME = lib.mkForce "$HOME/.local/state";
      XDG_BIN_HOME = lib.mkForce "$HOME/.local/bin"; # Not technically in the official xdg specification
      XDG_DESKTOP_DIR = lib.mkForce "$HOME/Desktop";
      XDG_DOWNLOAD_DIR = lib.mkForce "$HOME/Downloads";
      # AJLOW_OCAML_TOOLS = "dune merlin ocaml-lsp-server odoc ocamlformat utop
      # dune-release core core_unix base";
    };
    sessionPath = [
      "$XDG_BIN_HOME"
    ];
  };
}
