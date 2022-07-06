{ pkgs, ... }:

{
  # config.services.xserver.windowManager.i3 = {
  #   enable = true;
  #   package = pkgs.i3-gaps;
  #   extraPackages = [
  #     pkgs.polybar
  #     pkgs.i3lock
  #   ];
  # };

  config.xdg.configFile = {
    "i3/config".source = ./config;
    "i3/i3lock.sh".source = ./i3lock.sh;
    "i3/i3_smart_resize".source = ./i3_smart_resize;
  };

  imports = [
    ../picom
    ../rofi
    ../polybar
  ];
}
