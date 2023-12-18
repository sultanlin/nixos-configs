{
  config,
  lib,
  pkgs,
  stable,
  inputs,
  hostname,
  ...
}: {
  services.nginx = {
    enable = true;
    virtualHosts."blog.example.com" = {
      enableACME = true;
      forceSSL = true;
      root = "/var/www/blog";
    };
  };
}
