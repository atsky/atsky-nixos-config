let
 pkgs = import <nixpkgs> {};
 arm = import <nixpkgs> {
  crossSystem = {
    config = "armv6l-unknown-linux-gnueabihf";
  };
 };

 r_v = import <nixpkgs> {
  crossSystem = {
    config = "riscv64-unknown-linux-gnu";
  };
 };


in

pkgs.mkShell {
  packages = [    
  ];

  buildInputs = [ 
    pkgs.file
    arm.zlib         
    arm.gcc
    r_v.gcc
  ]; 
}
