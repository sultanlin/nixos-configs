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
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    virtualHosts."sultanlinj.me" = {
      # default = true;
      # enableACME = true;
      # forceSSL = true;
      # root = "/home/sultan/Documents/dev-learning/docs";
      root = "/var/www/webserver";
      # locations."/home/sultan/Documents/dev-learning/docs".proxyPass = "http://localhost:8000";
    };
    # appendHttpConfig = "listen 127.0.0.1:80;";
  };
  # security.acme = {
  #   acceptTerms = true;
  #   defaults.email = "foo@bar.com";
  # };

  # services.httpd.enable = true;
  # services.httpd.adminAddr = "webmaster@example.org";
  # # services.httpd.enablePHP = true; # oof... not a great idea in my opinion
  #
  # services.httpd.virtualHosts."example.org" = {
  #   documentRoot = "/var/www/example.org";
  #   # want ssl + a let's encrypt certificate? add `forceSSL = true;` right here
  # };

  networking.firewall.allowedTCPPorts = [80 443];
}
