with import <nixos> {};

with pkgs; (buildFHSUserEnv {
  name = "rust";
  targetPkgs = pkgs: with pkgs; [
    rustc
    cargo
    rustup
  ];
  runScript = "bash";
}).env

