{ ... }:

{
  # config.services.picom.enable = true;
  config.xdg.configFile = {
    "polybar/launch.sh".source = ./launch.sh;
    "polybar/config".source = ./config;
    "polybar/scripts" = { source = ./scripts; recursive = true; };
    "polybar/blocks" = { source = ./blocks; recursive = true; };
  };
}
