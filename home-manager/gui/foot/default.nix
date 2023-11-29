{ pkgs
, lib
, ...
}:
{
  programs = {
    foot = {
      enable = true;
      server.enable = true;
      settings = import ./settings.nix { inherit pkgs lib; };
    };
  };
}
