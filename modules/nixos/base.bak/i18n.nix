{config, ...}: {
  # Time zone and Internationalisation
  time.timeZone = "Asia/Riyadh";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ar_SA.UTF-8";
      LC_IDENTIFICATION = "ar_SA.UTF-8";
      LC_MEASUREMENT = "ar_SA.UTF-8";
      LC_MONETARY = "ar_SA.UTF-8";
      LC_NAME = "ar_SA.UTF-8";
      LC_NUMERIC = "ar_SA.UTF-8";
      LC_PAPER = "ar_SA.UTF-8";
      LC_TELEPHONE = "ar_SA.UTF-8";
      #      LC_TIME = "ar_SA.UTF-8";
      #      LC_ADDRESS = "en_US.UTF-8";
      #      LC_IDENTIFICATION = "en_US.UTF-8";
      #      LC_MEASUREMENT = "en_US.UTF-8";
      #      LC_MONETARY = "en_US.UTF-8";
      #      LC_NAME = "en_US.UTF-8";
      #      LC_NUMERIC = "en_US.UTF-8";
      #      LC_PAPER = "en_US.UTF-8";
      #      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    environment.variables = {
      # fix https://github.com/NixOS/nixpkgs/issues/238025
      TZ = "${config.time.timeZone}";
    };
  };
}
#      LC_ADDRESS = "ar_SA.UTF-8";
#      LC_IDENTIFICATION = "ar_SA.UTF-8";
#      LC_MEASUREMENT = "ar_SA.UTF-8";
#      LC_MONETARY = "ar_SA.UTF-8";
#      LC_NAME = "ar_SA.UTF-8";
#      LC_NUMERIC = "ar_SA.UTF-8";
#      LC_PAPER = "ar_SA.UTF-8";
#      LC_TELEPHONE = "ar_SA.UTF-8";
#      LC_TIME = "ar_SA.UTF-8";

