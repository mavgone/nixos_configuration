{ pkgs, ... }:

{
  users.users."mavgone" = {
    isNormalUser = true;
    description = "mavgone";
    extraGroups = [ "networkmanager" "wheel" "dialout" "video" "render" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    enableCompletion = true;

    histSize = 10000;

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      update = "sudo nixos-rebuild switch";
      weather = "curl wttr.in";
    };

    interactiveShellInit = ''
      timer() {
        termdown "$@" && pw-play ~/Downloads/mixkit-achievement-bell-600.wav
      }
    '';
  };



  security.sudo.extraRules = [
    {
      users = [ "mavgone" ];

      commands = [
        {
          command = "/run/current-system/sw/bin/systemctl start toggle-cpu-boost.service";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/systemctl start toggle-power-profile.service";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/mic-led 0";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/mic-led 1";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
