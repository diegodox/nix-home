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

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    # add libsqlite3.so to LD_LIBRARY_PATH
    LD_LIBRARY_PATH = "${pkgs.sqlite.out}/lib:$LD_LIBRARY_PATH";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

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

  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
          sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
        };
      }
      {
        name = "fzf.fish";
        src = pkgs.fetchFromGitHub {
          owner = "PatrickF1";
          repo = "fzf.fish";
          rev = "6d8e962f3ed84e42583cec1ec4861d4f0e6c4eb3";
          hash = "sha256-0rnd8oJzLw8x/U7OLqoOMQpK81gRc7DTxZRSHxN9YlM=";
        };
      }
    ];
    shellAbbrs = {
      ls = "exa";
      ll = "exa -l";
      la = "exa -a";
      lla = "exa -la";

      r = "ranger";
      lg = "lazygit";
      cat = "bat";
    };
    functions = {
      fish_prompt = {
        description = "prompt";
        body = builtins.readFile ./fish/functions/fish_prompt.fish;
      };
    };
  };

  programs.lazygit = { enable = true; };
  programs.fzf = { enable = true; };
  programs.gh = { enable = true; };
  programs.exa = { enable = true; };
  programs.bat = { enable = true; };
  programs.jq = { enable = true; };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;

    withPython3 = true;
    extraPython3Packages = (ps: with ps; [ pynvim ]);

    withRuby = false;

    extraConfig = "lua require('init_lua')";
  };

  xdg.configFile."nvim/lua/rc" = {
    source = ./nvim-config/lua/rc;
    recursive = true;
  };
  xdg.configFile."nvim/lua/init_lua.lua".source = ./nvim-config/init.lua;
  xdg.configFile."nvim/ftplugin".source = ./nvim-config/ftplugin;
  xdg.configFile."nvim/winresize.vim".source = ./nvim-config/winresize.vim;

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
