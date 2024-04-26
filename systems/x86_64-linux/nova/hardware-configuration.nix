# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [(modulesPath + "/installer/scan/not-detected.nix")];
  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "nvme"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/041c3424-016e-490a-ab27-1b0aad8c65ef";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/0D44-5CCD";
      fsType = "vfat";
    };

    "/home/kinzoku/storage" = {
      device = "/dev/disk/by-label/STORAGE";
      fsType = "ext4";
      options = [
        "defaults"
        "user"
      ];
    };
  };

  swapDevices = [{device = "/dev/disk/by-uuid/262833dc-94cb-40a9-acb1-e0fec360e54a";}];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp9s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp6s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp8s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
