{ pkgs ? import <nixpkgs> {} }:
let
  my-python = pkgs.python39;
  python-with-my-packages = my-python.withPackages (p: with p; [
    ipykernel jupyterlab ipywidgets
    matplotlib numpy pandas seaborn scikitimage tqdm scikitlearn
    gym
    llvmlite
    hyperopt
    tokenizers
    pytorch
    nltk
    torchvision
    tornado
    flask
    flask-sockets
    sly
    tinydb
    dill
    pygame
    # moviepy
    pip     
    statsmodels
  ]);
in (pkgs.buildFHSUserEnv {
  name = "python";
  targetPkgs = pkgs: with pkgs; [
    python-with-my-packages
    jetbrains.pycharm-community
    jetbrains.pycharm-professional
  ];
  runScript = "bash";
}).env


