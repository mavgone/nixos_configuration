{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.gvfs.enable = true;

  xdg.portal.enable = true;

  programs.niri.enable = true;

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
    variant = "";
  };
}
