{
  imports = [
    # Core system
    ./boot.nix
    ./nix.nix
    ./hardware.nix
    ./networking.nix
    ./locale.nix

    # Desktop
    ./desktop.nix
    ./sddm.nix
    ./fonts.nix

    # Audio / Gaming
    ./audio.nix
    ./gaming.nix

    # Packages / User
    ./packages.nix
    ./users.nix

    # Services
    ./systemd.nix
  ];
}
