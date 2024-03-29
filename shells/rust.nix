with import <nixos> {};

with pkgs; (buildFHSUserEnv {
  name = "rust";
  targetPkgs = pkgs: with pkgs; [
    jetbrains.clion
    rustc
    cargo
    clang
    rustup
    vscode
  ];
  runScript = "bash";
}).env

