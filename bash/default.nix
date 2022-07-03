{ ... }:

{
  config.programs.bash = {
    enable = true;
    profileExtra = ''
      if test -e $HOME/.nix-profile/etc/profile.d/nix.sh; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
    initExtra = builtins.readFile ./bashrc;
  };
}




