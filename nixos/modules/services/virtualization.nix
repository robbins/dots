{ config, pkgs, lib, specialArgs, ...}:

with lib;
let cfg = config.modules.services.virtualization;
in {
  options.modules.services.virtualization = {
    enable = mkOption { default = false; };
  };
  config = mkIf cfg.enable {
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;
#    virtualisation.libvirtd.qemu.ovmf.packages = [ pkgs.OVMF ];
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ virt-manager swtpm tpm2-tools libtpms looking-glass-client ];
    users.users.${specialArgs.username}.extraGroups = [ "libvirtd" "tss" "virt-viewer" "kvm" ];
    security.tpm2.enable = true;
    security.tpm2.pkcs11.enable = true;  # expose /run/current-system/sw/lib/libtpm2_pkcs11.so
    security.tpm2.tctiEnvironment.enable = true;  # TPM2TOOLS_TCTI and TPM2_PKCS11_TCTI env variables
    environment.etc = {
  	"ovmf/edk2-x86_64-secure-code.fd" = {
    	source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
  	};

  	"ovmf/edk2-i386-vars.fd" = {
    	source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
    	mode = "0644";
    	user = "libvirtd";
  	};
		};
		boot.kernelModules = [ "vfio-pci" "kvmfr" ];
		boot.extraModprobeConfig = "options vfio-pci ids=10de:2520,10de:228e";
		boot.kernelParams = [ "iommu=pt" "amd_iommu=on" "vfio-pci.ids=10de:2520,10de:228e" "kvmfr.static_size_mb=32" ];
		boot.blacklistedKernelModules = [ "xpad" ];
		environment.etc."supergfxd.conf" = {
      mode = "0644";
      source = (pkgs.formats.json { }).generate "supergfxd.conf" {
        mode = "Integrated";
        vfio_enable = true;
        vfio_save = true;
        always_reboot = false;
        no_logind = true;
        logout_timeout_s = 180;
        hotplug_type = "None";
      };
    };
	 systemd.services.supergfxd.path = [ pkgs.kmod pkgs.pciutils ];
  services.udev.extraRules = ''
      SUBSYSTEM=="kvmfr", OWNER="nate", GROUP="kvm", MODE="0600"
  '';
	virtualisation.libvirtd.qemu.verbatimConfig = ''
	  namespaces = []
	  cgroup_device_acl = [
      "/dev/null", "/dev/full", "/dev/zero",
      "/dev/random", "/dev/urandom", "/dev/ptmx",
      "/dev/kvm", "/dev/rtc", "/dev/hpet", "/dev/kvmfr0"
		]
	'';
	boot.initrd.kernelModules = [ "kvmfr" ]; # I think this gets it to always load
	boot.extraModulePackages = with config.boot.kernelPackages; [ kvmfr ];
  };
}
