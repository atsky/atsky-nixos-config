with import <nixpkgs> {
  crossSystem = {
    config = "armv6l-unknown-linux-gnueabihf";
  };
};

mkShell {
  packages = [
    file
  ];

  buildInputs = [ 
    zlib         
  ]; 
}
