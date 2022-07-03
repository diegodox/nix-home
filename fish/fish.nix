{ pkgs, ... }:

let
  oh-my-fish = {
    name = "foreign-env";
    src = pkgs.fetchFromGitHub {
      owner = "oh-my-fish";
      repo = "plugin-foreign-env";
      rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
      sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
    };
  };
  fzf-fish = {
    name = "fzf.fish";
    src = pkgs.fetchFromGitHub {
      owner = "PatrickF1";
      repo = "fzf.fish";
      rev = "6d8e962f3ed84e42583cec1ec4861d4f0e6c4eb3";
      hash = "sha256-0rnd8oJzLw8x/U7OLqoOMQpK81gRc7DTxZRSHxN9YlM=";
    };
  };
in
{
  config = {
    programs.fish = {
      enable = true;
      plugins = [
        oh-my-fish
        fzf-fish
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

      interactiveShellInit = ''
        # if test -e <nix_file_path_file>
        #   fenv source <nix_file_path_file>
        # end
      '';

      functions = {
        fish_prompt = {
          description = "prompt";
          body = builtins.readFile ./functions/fish_prompt.fish;
        };
      };
    };
  };
}
