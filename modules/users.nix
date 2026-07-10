{ pkgs, ... }:

{
  users.users.atha = {
    isNormalUser = true;
    description = "atha";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Aktifkan Firefox secara global untuk user
  programs.firefox.enable = true;
}
