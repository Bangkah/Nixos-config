{ pkgs, inputs, ... }: # Tambahkan 'inputs' di sini agar bisa diakses di bawah

{
  environment.systemPackages = with pkgs; [
    # Mengambil paket Caelestia Shell dari Flake Input Anda
    inputs.caelestia-shell.packages.${pkgs.system}.default
    
    # Aplikasi Utama Anda
    vscode
    kitty

    # Utilitas Terminal & Pengembangan
    git
    fastfetch
    distrobox
    podman
  ];
}
