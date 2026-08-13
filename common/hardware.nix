{ pkgs, ... }:

{
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.gpu-screen-recorder.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      xorg.libxcb
      wayland
      gtk3
      glib
      gdk-pixbuf
      pango
      cairo
      atk
      libappindicator-gtk3
      xkeyboard-config
    ];
  };
}
