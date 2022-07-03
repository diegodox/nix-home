{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "diego";
  home.homeDirectory = "/home/diego";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  imports = [
    ./nvim-config/nvim.nix
    ./fish/fish.nix
    ./git/git.nix
    ./bat/bat.nix
    ./exa/exa.nix
    ./ranger/ranger.nix
    ./bash
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    # add libsqlite3.so to LD_LIBRARY_PATH
    LD_LIBRARY_PATH = "${pkgs.sqlite.out}/lib:$LD_LIBRARY_PATH";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  programs.lazygit = { enable = true; };
  programs.fzf = { enable = true; };
  programs.gh = { enable = true; };
  programs.jq = { enable = true; };

  home.packages = [
    pkgs.gcc
    pkgs.rustup
    pkgs.stylua
    pkgs.actionlint
    pkgs.shellcheck

    pkgs.ripgrep
    pkgs.fd
    pkgs.tldr
    pkgs.unzip
    pkgs.pkg-config
    pkgs.openssl
    pkgs.sqlite

    pkgs.ranger
  ];
}
