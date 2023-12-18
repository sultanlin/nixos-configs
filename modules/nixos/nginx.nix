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
    virtualHosts."myblog.me" = {
      # enableACME = true;
      # forceSSL = true;
      root = "/home/sultan/Documents/dev-learning/docs/index.html";
      # locations."/".proxyPass = "http://localhost:8080";
    };
  };
  # security.acme = {
  #   acceptTerms = true;
  #   defaults.email = "foo@bar.com";
  # };

  networking.firewall.allowedTCPPorts = [80 443];
}
