{ pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.ranger ];
    xdg.configFile = {
      "ranger/scope.sh".source = ./scope.sh;
      "ranger/commands.py".source = ./commands.py;
      "ranger/commands_full.py".source = ./commands_full.py;
      "ranger/rc.conf".source = ./rc.conf;
      "ranger/rifle.conf".source = ./rifle.conf;
    };
  };
}
