{ pkgs, ... }:

{
  languages.elixir.enable = true;
  packages = [
    pkgs.inotify-tools
  ];

  services.postgres = {
    enable = true;
    listen_addresses = "0.0.0.0";
    initialScript = ''
      CREATE ROLE postgres WITH SUPERUSER LOGIN PASSWORD 'postgres';
    '';
  };
}
