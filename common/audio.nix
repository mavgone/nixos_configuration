{ pkgs, spicetify-nix, ... }:

let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in
{
  hardware.alsa.enablePersistence = true;

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      fullScreen
      keyboardShortcut
      autoSkipVideo
      loopyLoop
    ];

    theme = spicePkgs.themes.text;
    colorScheme = "RosePine";

    enabledSnippets = with spicePkgs.snippets; [
      oneko
      roundedThickerBars
      newHoverPanel
      removeTopSpacing
      removeTheArtistsAndCreditsSectionsFromTheSidebar
    ];
  };
}
