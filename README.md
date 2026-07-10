# Nixos-config

My personal NixOS configuration using Flakes.

## How to use

1. Clone this repository:
   ```bash
   git clone https://github.com/Bangkah/Nixos-config
   cd Nixos-config
   ```
2. Rebuild the system:
   ```bash
   sudo nixos-rebuild switch --flake .#your-hostname
   ```
