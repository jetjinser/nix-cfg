{ lib, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.allowUnfree = true;
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
  ];

  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "nvidia-x11"
        "nvidia-persistenced"
        "nvidia-settings"
      ];
  };

}
