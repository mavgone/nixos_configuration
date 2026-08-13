{
  systemd.services.toggle-power-profile = {
    description = "Toggle ACPI Power Profile";

    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };

    script = ''
      PROFILE="/sys/firmware/acpi/platform_profile"
      CURRENT="$(cat "$PROFILE")"

      case "$CURRENT" in
        balanced)
          NEXT="performance"
          ;;
        performance)
          NEXT="low-power"
          ;;
        low-power)
          NEXT="balanced"
          ;;
        *)
          exit 1
          ;;
      esac

      echo "$NEXT" > "$PROFILE"

      /run/current-system/sw/bin/systemd-run \
        --machine=mavgone@.host --user --wait \
        /run/current-system/sw/bin/notify-send \
        "Power Profile" "$NEXT"
    '';
  };

  systemd.services.disable-cpu-boost = {
    description = "Disable CPU Boost at boot";

    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };

    script = ''
      BOOST="/sys/devices/system/cpu/cpufreq/boost"

      if [ -e "$BOOST" ]; then
        echo 0 > "$BOOST"
      fi
    '';
  };

  systemd.services.toggle-cpu-boost = {
    description = "Toggle AMD CPU Boost";

    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };

    script = ''
      BOOST="/sys/devices/system/cpu/cpufreq/boost"

      if [ "$(cat "$BOOST")" = "1" ]; then
        echo 0 > "$BOOST"

        /run/current-system/sw/bin/systemd-run \
          --machine=mavgone@.host --user \
          /run/current-system/sw/bin/notify-send \
          "CPU Boost" "Boost OFF"
      else
        echo 1 > "$BOOST"

        /run/current-system/sw/bin/systemd-run \
          --machine=mavgone@.host --user \
          /run/current-system/sw/bin/notify-send \
          "CPU Boost" "Boost ON"
      fi
    '';
  };
}
