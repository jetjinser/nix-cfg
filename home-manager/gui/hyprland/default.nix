{ inputs
, pkgs
, ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  programs = {
    wlogout.enable = true;
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    # settings = import ./settings.nix;
    extraConfig = builtins.readFile ./hyprland.conf;
  };
}
