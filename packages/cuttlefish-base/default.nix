{ stdenv, python3, fetchFromGitHub, ebtables, dnsmasq, kmod, iproute2 }:

stdenv.mkDerivation (finalAttrs: {
  pname = "cuttlefish-base";
  version = "git";

  src = fetchFromGitHub {
    owner = "google";
    repo = "android-cuttlefish";
    rev = "a03c58ef15aea5fd546bf8ce57bb8f1023855ac2";
    sha256 = "sha256-nGOFNw2bUnKQXWnPf0KagHK+354h3Ak8D1bqsZVzb8o=";
  };

  buildInputs = [ python3 ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,lib/udev/rules.d,etc/init.d}
    cp -av $src/base/host/deploy/capability_query.py $out/bin
    cp -av $src/base/host/deploy/unpack_boot_image.py $out/bin
    cp -av $src/base/host/deploy/install_zip.sh $out/bin

    cp -av $src/base/debian/cuttlefish-base.udev $out/lib/udev/rules.d/60-cuttlefish-base.rules

    cp -av $src/base/debian/cuttlefish-base.cuttlefish-host-resources.init $out/etc/init.d/

    substituteInPlace $out/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init --replace 'ip ' '${iproute2}/bin/ip '
    substituteInPlace $out/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init --replace '/usr/bin/nvidia-modprobe --modeset || /bin/true' ' '
    substituteInPlace $out/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init --replace '$ebtables' '${ebtables}/bin/ebtables'
    substituteInPlace $out/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init --replace 'start_dnsmasq' 'start_dnsmasq_fn'
    substituteInPlace $out/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init --replace 'dnsmasq \' '${dnsmasq}/bin/dnsmasq \'
    substituteInPlace $out/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init --replace 'modprobe' '${kmod}/bin/modprobe'
    substituteInPlace $out/etc/init.d/cuttlefish-base.cuttlefish-host-resources.init --replace '. /lib/lsb/init-functions' ' '

    runHook postInstall
  '';
})
