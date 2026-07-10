{
  description = "Atha's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Tambahkan baris ini
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, caelestia-shell, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Sesuaikan dengan arsitektur Anda
      
      # PENTING: Lewatkan inputs ke semua modul agar bisa diakses
      specialArgs = { inherit inputs; }; 
      
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./modules/dev.nix
        ./modules/hyprland.nix
        ./modules/packages.nix
        ./modules/users.nix
      ];
    };
  };
}
