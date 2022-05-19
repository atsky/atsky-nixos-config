{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    packages = [ ];
    nativeBuildInputs = [ pkgs.cmake ];
    buildInputs = with pkgs; [
      qemu
      nasm
      llvmPackages_13.clang
      llvmPackages_13.libllvm
    ];
}

