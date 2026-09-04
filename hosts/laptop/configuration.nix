  { config, pkgs, ... }:
  let
    tg-ws-proxy = pkgs.python3Packages.buildPythonApplication {
      pname = "tg-ws-proxy";
      version = "1.9.1";
      pyproject = true;

      src = pkgs.fetchFromGitHub {
        owner = "Flowseal";
        repo = "tg-ws-proxy";
        rev = "v1.9.1";
        hash = "sha256-uv4QYTtDiYElh0tLXg2cMlOBV6jG/p432KrZt06nipM=";
      };

      build-system = with pkgs.python3Packages; [
        hatchling
      ];

      dependencies = with pkgs.python3Packages; [
        cryptography
        customtkinter
        pillow
        psutil
        pyperclip
        pystray
        pygobject3
        tkinter
      ];

      nativeBuildInputs = with pkgs; [
        wrapGAppsHook3
        gobject-introspection
      ];

      buildInputs = with pkgs; [
        gtk3
        libappindicator-gtk3
      ];

      dontCheckRuntimeDeps = true;
      doCheck = false;

    };
  in
  {
    imports =
      [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
      ];




  networking.hostName = "mavgone_thinkpad"; 

  systemd.user.services.tg-ws-proxy = {
    description = "Telegram WS Proxy Tray";

    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${tg-ws-proxy}/bin/tg-ws-proxy-tray-linux";
      Restart = "on-failure";
      RestartSec = 5;
    };

    environment = {
      PYSTRAY_BACKEND = "appindicator";
    };
  };

  environment.pathsToLink = [
    "share/thumbnailers"
  ];


  environment.systemPackages = with pkgs; [
    tg-ws-proxy

    (writeShellScriptBin "mic-led" ''
      case "$1" in
        0|1)
          echo "$1" > /sys/class/leds/platform::micmute/brightness
          ;;
        *)
          echo "Usage: mic-led {0|1}" >&2
          exit 1
          ;;
      esac
    '')
  ];
  system.stateVersion = "26.05";
}
