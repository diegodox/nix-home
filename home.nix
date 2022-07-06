# Standalone home-manager module

{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = (builtins.getEnv "USER");
  home.homeDirectory = (builtins.getEnv "HOME");

  imports = [
    ./common.nix
  ];
}
