{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    packages = [ ];
    nativeBuildInputs = [ pkgs.cmake ];
    buildInputs = with pkgs; [
      libcxx
      libcxxabi
      clang
      thonny
      pico-sdk
    ];
}

