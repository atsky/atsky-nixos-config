# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


# Here goes some basic flags
let
  use_virtualbox = true;
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = false;
    grub.configurationLimit = 16;
  };

  networking.hostName = "atsky-nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp6s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the GNOME 3 Desktop Environment.
  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = false;
      autoLogin.enable = true;
      autoLogin.user = "atsky";
      defaultSession = "gnome";
    };
    
    #desktopManager.plasma5.enable = true;
    desktopManager.gnome.enable = true;
    #desktopManager.xfce.enable = true;
    videoDrivers = [ "nvidia" ];
  };

  hardware.opengl.driSupport32Bit = true;
  

  # Configure keymap in X11
  services.xserver.layout = "us,ru";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.atsky = {
     isNormalUser = true;
     extraGroups = [ "wheel" "dialout" "docker"]; 
     shell = pkgs.fish;
  };

  nixpkgs.config.permittedInsecurePackages = [
	"ffmpeg-3.4.8"
  ]; # For processing  

  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget vim git mc htop pciutils usbutils glxinfo 
     fish zsh
     bitwarden bitwarden-cli
     wireguard-tools
     lsof
     hfsprogs exfatprogs gparted
     unrar p7zip
     gnumake gcc
     firefox dropbox gimp inkscape dosbox yandex-disk
     jdk 
     sublime
     ghc
     tdesktop
     docker
     # Programming
     python3 jupyter
     cudatoolkit
     obsidian
     libusb # for Digispark
     # Latex
     texlive.combined.scheme-full texmaker
  ];

  programs.steam.enable = true;
  programs.fish.enable = true;
 
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
  # Virtualbox
  users.extraGroups.vboxusers.members = [ "atsky" ];
  virtualisation.virtualbox.host = {
        enable = use_virtualbox;
	enableExtensionPack = true;
  };
  
  fonts.fonts = with pkgs; [
    source-code-pro    
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
  ];
  
  
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

