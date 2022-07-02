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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "diegodox";
    userEmail = "android.mxdiego9@gmail.com";
    delta = {
      enable = true;
    };
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };

  programs.lazygit = { enable = true; };
  programs.fzf = { enable = true; };
  programs.gh = { enable = true; };
  programs.exa = { enable = true; };
  programs.bat = { enable = true; };
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

	pkgs.ranger
  ];
}
