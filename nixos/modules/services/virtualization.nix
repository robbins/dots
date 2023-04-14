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
    environment.systemPackages = with pkgs; [ virt-manager swtpm tpm2-tools libtpms ];
    users.users.${specialArgs.username}.extraGroups = [ "libvirtd" "tss" ];
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
  };
}
