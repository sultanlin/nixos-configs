{
  config,
  username,
  ...
}: {
  # mount a smb/cifs share
  fileSystems."/home/${username}/SMB-Downloads" = {
    device = "192.168.1.40:/mnt/SingleHDD/Backup";
    fsType = "nfs";
    # options = [
    #   # "vers=3.0,uid=1000,gid=100,dir_mode=0755,file_mode=0755,mfsymlinks,credentials=${config.age.secrets.smb-credentials.path},nofail"
    #   "nfsvers=4.2,defaults"
    # ];
  };
}
