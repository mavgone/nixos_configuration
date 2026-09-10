{ ... }:

{
  home.username = "mavgone";
  home.homeDirectory = "/home/mavgone";

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  home.file = {
    ".config/fastfetch/config.jsonc".source =
      ../../dotfiles/fastfetch/config.jsonc;

    ".config/foot/foot.ini".source =
      ../../dotfiles/foot/foot.ini;

    ".config/gtk-4.0/gtk.css".source =
      ../../dotfiles/gtk-4.0/gtk.css;

    ".config/matugen/config.toml" = {
    source = ../../dotfiles/matugen/config.toml;
    force = true;
    };

    ".config/matugen/templates" = {
      source = ../../dotfiles/matugen/templates;
      recursive = true;
      force = true;
    };

    ".config/niri/config.kdl" = {
      source = ../../dotfiles/niri/config.kdl;
      force = true;
    };

    ".config/swaync/config.json".source =
      ../../dotfiles/swaync/config.json;

    ".config/walker/config.toml".source =
      ../../dotfiles/walker/config.toml;

    ".config/waybar/config.jsonc" = {
      source = ../../dotfiles/waybar/config.jsonc;
      force = true;
    };

    ".config/waybar/style.css".source =
      ../../dotfiles/waybar/style.css;

    ".config/mimeapps.list" = {
      source = ../../dotfiles/mimeapps.list;
      force = true;
    };

    ".zshrc" = {
      source = ../../dotfiles/zsh/.zshrc;
      force = true;
    };

    ".local/bin/keyboard-layout-notify" = {
      source = ../../scripts/keyboard-layout-notify;
      executable = true;
    };

    ".local/bin/mpris.sh" = {
      source = ../../scripts/mpris.sh;
      executable = true;
    };

    ".local/bin/screen-record-toggle.sh" = {
      source = ../../scripts/screen-record-toggle.sh;
      executable = true;
    };

    ".local/bin/select-theme.sh" = {
      source = ../../scripts/select-theme.sh;
      executable = true;
    };

    ".local/bin/set-wallpaper" = {
      source = ../../scripts/set-wallpaper;
      executable = true;
    };

    ".local/bin/toggle-boost" = {
      source = ../../scripts/toggle-boost;
      executable = true;
    };

    ".local/bin/toggle-profile" = {
      source = ../../scripts/toggle-profile;
      executable = true;
    };

    ".local/bin/wallpaper-theme.sh" = {
      source = ../../scripts/wallpaper-theme.sh;
      executable = true;
    };

    ".config/nvim/ftplugin" = {
      source = ../../dotfiles/nvim/ftplugin;
      recursive = true;
    };

    ".config/nvim/init.lua" = {
      source = ../../dotfiles/nvim/init.lua;
      force = true;
    };

    ".config/nvim/lazy-lock.json".source =
      ../../dotfiles/nvim/lazy-lock.json;

    ".config/nvim/lazyvim.json".source =
      ../../dotfiles/nvim/lazyvim.json;

    ".config/nvim/.neoconf.json".source =
      ../../dotfiles/nvim/.neoconf.json;

    ".config/nvim/stylua.toml".source =
      ../../dotfiles/nvim/stylua.toml;

    ".config/nvim/LICENSE".source =
      ../../dotfiles/nvim/LICENSE;

    ".config/nvim/README.md".source =
      ../../dotfiles/nvim/README.md;

    ".config/nvim/lua" = {
      source = ../../dotfiles/nvim/lua;
      recursive = true;
      force = true;
    };

    ".config/elephant/menus/wallpapers.lua" = {
      source = ../../dotfiles/elephant/menus/wallpapers.lua;
      force = true;
    };
  };
}
