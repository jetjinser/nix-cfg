{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    ./hardware-configuration.nix

    ./services
  ];

  nix = {
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = [ "/etc/nix/path" ];

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      substituters = [
        # for hyprland cache
        "https://hyprland.cachix.org"

        # "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      ];
      # for hyprland cache
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    package = pkgs.nixVersions.stable;
  };

  environment = {
    etc =
      lib.mapAttrs'
        (name: value: {
          name = "nix/path/${name}";
          value.source = value.flake;
        })
        config.nix.registry;
  };

  networking = {
    hostName = "jinser";
    proxy.default = "http://127.0.0.1:20172/";
  };

  time.timeZone = "Asia/Shanghai";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    keyMap = "us";
  };

  users.users = {
    jinser = {
      initialPassword = "123456abc";
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  system.stateVersion = "22.05";
}
