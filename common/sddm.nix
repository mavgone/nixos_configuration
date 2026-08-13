{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };

    defaultSession = "niri";
  };

  services.displayManager.sddm.settings = {
    Theme = {
      FacesDir = "/var/lib/sddm/faces";
    };
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
  };
}
