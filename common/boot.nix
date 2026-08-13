{ ... }:

let
  grubTheme = ../assets/grub/crt-tv/1920x1080/CRT-TV;
in
{
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";

    theme = grubTheme;
  };
}
