{ pkgs ? import <nixpkgs> {} }:

  pkgs.mkShell {
    packages = [ ];
    nativeBuildInputs = [ pkgs.cmake ];
    buildInputs = with pkgs; [
      libcxx
      libcxxabi
      clang
      mesa
      glew
      glfw3
      
      glm
      vulkan-headers
      vulkan-loader
      vulkan-tools
      vulkan-extension-layer
      vulkan-validation-layers
      shaderc
      jetbrains.clion    
    ];
}

