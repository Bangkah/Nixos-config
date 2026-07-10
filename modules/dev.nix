{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs_22
    bun

    php83
    php83Packages.composer

    gh

    ollama
  ];


  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };


  services.mysql = {
    enable = true;

    package = pkgs.mariadb;

    ensureDatabases = [
      "laravel_app"
    ];

    ensureUsers = [
      {
        name = "atha";

        ensurePermissions = {
          "*.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}