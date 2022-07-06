# nix-os home-manager module

{ config, pkgs, ... }:
{
  imports = [
    ./common.nix
    ./i3
  ];
}
