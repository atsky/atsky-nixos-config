with import <nixos> {};

(pkgs.python39.withPackages (ps: with ps; [
    ipykernel jupyterlab ipywidgets
    cudatoolkit
    matplotlib numpy pandas seaborn scikitimage tqdm scikitlearn
    gym
    hyperopt
    tokenizers
    pytorchWithCuda 
    # pytorch
    # torchvision
    jetbrains.pycharm-community
    # moviepy
    # pip
  ])).env
