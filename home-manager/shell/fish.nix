{
  programs = {
    fish = {
      enable = true;
      shellAliases = {
        cdtmp = "cd (mktemp -d /tmp/jinser-XXXXXX)";
        g = "git";
        rbsw = "sudo nixos-rebuild switch --flake .#jinser";
        nf = "nix flake";

        nb = "nom build";
        ns = "nom shell";
        np = "nom develop";
      };
    };

  };
}
