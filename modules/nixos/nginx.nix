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
  security.acme = {
    acceptTerms = true;
    defaults.email = "foo@bar.com";
  };
}
