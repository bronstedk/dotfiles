{
  pkgs,
  config,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ./alias_app.nix

    ./system_settings.nix
    ./system.nix
    ./fonts.nix

    ./packages.nix
    ./homebrew.nix
  ];
}
