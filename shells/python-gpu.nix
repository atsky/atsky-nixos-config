{ pkgs ? import <nixpkgs> 
    {
        config =
        {
            allowUnfree = true;
            cudaSupport = true;
        };
    }
}:
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
in pkgs.mkShell {
  buildInputs = with pkgs; [
    python-with-my-packages
    jetbrains.pycharm-community
    jetbrains.pycharm-professional
  ];
  
  shellHook = ''
    # Tells pip to put packages into $PIP_PREFIX instead of the usual locations.
    # See https://pip.pypa.io/en/stable/user_guide/#environment-variables.
    export PIP_PREFIX=$(pwd)/_build/pip_packages
    export PYTHONPATH="$PIP_PREFIX/${pkgs.python3.sitePackages}:$PYTHONPATH"
    export PATH="$PIP_PREFIX/bin:$PATH"
    unset SOURCE_DATE_EPOCH
  '';
}

