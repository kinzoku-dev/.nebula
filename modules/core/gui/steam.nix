{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nix-gaming.nixosModules.platformOptimizations];
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
      platformOptimizations.enable = true;
      extraCompatPackages = with pkgs; [proton-ge-bin];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        steam = pkgs.steam.override {
          extraPkgs = pkgs:
            with pkgs; [
              xorg.libXcursor
              xorg.libXi
              xorg.libXinerama
              xorg.libXScrnSaver
              libpng
              libpulseaudio
              libvorbis
              stdenv.cc.cc.lib
              libkrb5
              keyutils
            ];
        };
      };
    };
    overlays = [
      (_final: prev: {
        steam = prev.steam.override (
          {extraLibraries ? _pkgs': [], ...}: {
            extraLibraries = pkgs': (extraLibraries pkgs') ++ [pkgs'.gperftools];
          }
        );
      })
    ];
  };
}
