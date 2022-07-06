{ ... }:
{
  config.services.picom = {
    enable = true;
  };

  #TODO: use nix picom config
  config.xdg.configFile."picom/picom.conf".source = ./picom.conf;
}
