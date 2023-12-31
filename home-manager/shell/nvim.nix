{ inputs
, pkgs
, ...
}:
{
  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlay
    ];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
  };
}
