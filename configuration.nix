# configuration.nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/users.nix
    ./modules/packages.nix
    ./modules/hyprland.nix
    ./modules/dev.nix
  ];

  #################
  # NIX
  #################

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  #################
  # BOOT
  #################

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #################
  # HOSTNAME
  #################

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  #################
  # LOCALE
  #################

  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "id_ID.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT    = "id_ID.UTF-8";
    LC_MONETARY       = "id_ID.UTF-8";
    LC_NAME           = "id_ID.UTF-8";
    LC_NUMERIC        = "id_ID.UTF-8";
    LC_PAPER          = "id_ID.UTF-8";
    LC_TELEPHONE      = "id_ID.UTF-8";
    LC_TIME           = "id_ID.UTF-8";
  };

  #################
  # GRAPHICS
  #################

  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [
    "nvidia"
  ];

  boot.blacklistedKernelModules = [
    "nouveau"
  ];

  boot.kernelParams = [
    "module_blacklist=nouveau"
    "nvidia-drm.modeset=1"
  ];

  hardware.nvidia = {
    modesetting.enable = true;

    # RTX 4050 (Ada Lovelace)
    open = true;

    nvidiaSettings = true;

    powerManagement = {
      enable = true;
      finegrained = true;
    };

    prime = {
      offload.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };

  #################
  # AUDIO
  #################

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
  };

  #################
  # SERVICES
  #################

  services.printing.enable = true;

  virtualisation.podman.enable = true;

  #################
  # PACKAGES
  #################

  nixpkgs.config.allowUnfree = true;

  #################
  # VERSION
  #################

  system.stateVersion = "26.05";
}