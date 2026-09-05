{ pkgs, zen-browser, ... }:

{
  environment.systemPackages = with pkgs; [
    # CLI
    wget
    tree
    btop
    fzf
    git
    lazygit
    ripgrep
    fd
    unzip
    gcc
    gum
    lm_sensors
    linuxPackages.turbostat
    termdown
    jq
    fastfetch

    # Shell
    zsh
    starship

    # Wayland / Desktop
    foot
    waybar
    fuzzel
    walker
    elephant
    xwayland-satellite
    hyprlock
    swaynotificationcenter
    wl-clipboard
    libnotify

    # Media
    playerctl
    ffmpeg-headless
    ffmpegthumbnailer
    celluloid

    # Graphics / Theming
    matugen
    imagemagick
    adwaita-icon-theme
    awww

    # Applications
    telegram-desktop
    nautilus
    clash-verge-rev
    zeal
    pavucontrol
    blueman
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    obsidian
    libreoffice

    # Development
    neovim
    neovide
    python3
    python3Packages.pip
    live-server
    jdk21
    nodejs

    # Spell checking
    aspell
    aspellDicts.ru
    aspellDicts.en

    # Screen recording
    gpu-screen-recorder

    # Networking
    networkmanager_dmenu
  ];
}
