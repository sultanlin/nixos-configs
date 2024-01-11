{hostname, ...}: {
  # Networking
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking = {
    networkmanager.enable = true;
    hostName = hostname;
    # Local networks
    hosts = {
      "192.168.1.40" = ["truenas"];
    };
  };

  programs = {
    # The OpenSSH agent remembers private keys for you
    # so that you don’t have to type in passphrases every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent.
    ssh.startAgent = true;
    # dconf is a low-level configuration system.
    dconf.enable = true;
  };

  # Enable openssh daemon
  services.openssh = {
    # SSH
    enable = true;
    allowSFTP = true; # SFTP
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no"; # disable root login
      #PasswordAuthentication = false; # disable password login
    };
    openFirewall = true;
  };
}
