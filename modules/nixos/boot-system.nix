{
  config,
  lib,
  pkgs,
  stable,
  inputs,
  hostname,
  ...
}: {
  # supported file systems, so we can mount any removable disks with these filesystems
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "xfs"
    #"zfs"
    "ntfs"
    "fat"
    "vfat"
    "exfat"
    "cifs" # mount windows share
  ];

  # Bootloader, grub vs systemd-boot. Grub better for dual booting
  boot.loader = lib.mkDefault {
    grub = {
      enable = true;
      device = "/dev/sda";
      configurationLimit = lib.mkDefault 10;
      useOSProber = true;
    };
    timeout = 1;
    # UEFI settings
    # efi = {
    #     canTouchEfiVariables = true;
    #     efiSysMountPoint = "/boot";
    #   }
  };
}
