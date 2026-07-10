{ pkgs, ... }:

{
  # Mengaktifkan Hyprland & Lingkungan Wayland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Display Manager modern untuk Wayland
  services.displayManager.sddm.enable = true;

  # Variabel lingkungan agar aplikasi mendukung Wayland secara native
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Paket pendukung tampilan Hyprland
  environment.systemPackages = with pkgs; [
    # Catatan: waybar, rofi, dan dunst bisa dihapus nanti jika Anda ingin beralih total ke Caelestia
    waybar
    rofi
    dunst
    
    hyprpaper
    hyprlock
    hypridle
    grim
    slurp
    wl-clipboard
    networkmanagerapplet
  ];

  # Mengonfigurasi UWSM untuk menjalankan Caelestia Shell saat startup
  # Menggunakan aturan XDG Autostart yang didukung oleh UWSM secara native
  xdg.autostart.enable = true;
}
