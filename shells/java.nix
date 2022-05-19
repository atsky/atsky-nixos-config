with import <nixos> {};

with pkgs; (buildFHSUserEnv {
  name = "java";
  targetPkgs = pkgs: with pkgs; [
    jdk
    jdk11
    jetbrains.idea-community
  ];
  runScript = "bash";
}).env

