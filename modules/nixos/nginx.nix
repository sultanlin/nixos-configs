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
      # enableACME = true;
      # forceSSL = true;
      root = "/home/sultan/Documents/dev-learning/docs/index.html";
      # locations."/home/sultan/Documents/dev-learning/docs".proxyPass = "http://localhost:8000";
    };
    # appendHttpConfig = "listen 127.0.0.1:80;";
  };
  # security.acme = {
  #   acceptTerms = true;
  #   defaults.email = "foo@bar.com";
  # };

  networking.firewall.allowedTCPPorts = [80 443];
}
