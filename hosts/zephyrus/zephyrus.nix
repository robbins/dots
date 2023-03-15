#
# Arguments passed to nixosSystem
# inputs: all flake.nix inputs
#
inputs:
rec {
  system = "x86_64-linux";
  username = "nate";
  modules' = [
    inputs.hyprland.nixosModules.default
    (./.)
  ];
  #overlays' = [ inputs.neovim-nightly.overlay (final: prev: { microsoft-edge-dev = prev.microsoft-edge-dev.overrideAttrs (old: { version = "112.0.1722.7"; } ); } ) ];
  overlays' = [
  inputs.neovim-nightly.overlay
  /*(final: prev: {
    microsoft-edge-dev = prev.microsoft-edge-dev.override {
      version = "112.0.1722.7";
    };
  })*/

  (final: prev: {
    microsoft-edge-dev = prev.microsoft-edge-dev.overrideAttrs (_: {
      src = final.fetchurl {
        url = "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-dev/microsoft-edge-dev_112.0.1722.7-1_amd64.deb";
	sha256 = "sha256:NGXr7Da5wk0iYX4JOx60o0OgCOY1VMuuSw3hprsgihA=";
      };
      buildPhase = let
    libPath = with final.pkgs; {
      msedge = final.lib.makeLibraryPath [
        glibc glib nss nspr atk at-spi2-atk xorg.libX11
        xorg.libxcb cups.lib dbus.lib expat libdrm
        xorg.libXcomposite xorg.libXdamage xorg.libXext
        xorg.libXfixes xorg.libXrandr libxkbcommon
        gtk3 pango cairo gdk-pixbuf mesa
        alsa-lib at-spi2-core xorg.libxshmfence systemd wayland
      ];
      naclHelper = lib.makeLibraryPath [
        glib nspr atk libdrm xorg.libxcb mesa xorg.libX11
        xorg.libXext dbus.lib libxkbcommon
      ];
      libwidevinecdm = lib.makeLibraryPath [
        glib nss nspr
      ];
      libGLESv2 = lib.makeLibraryPath [
        xorg.libX11 xorg.libXext xorg.libxcb wayland
      ];
      libsmartscreen = lib.makeLibraryPath [
        libuuid stdenv.cc.cc.lib
      ];
      libsmartscreenn = lib.makeLibraryPath [
        libuuid
      ];
      liboneauth = lib.makeLibraryPath [
        libuuid xorg.libX11
      ];
    };
  in ''
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      --set-rpath "${libPath.msedge}" \
      opt/microsoft/"msedge-dev"/msedge
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      opt/microsoft/"msedge-dev"/msedge-sandbox
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      opt/microsoft/"msedge-dev"/msedge_crashpad_handler
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      --set-rpath "${libPath.naclHelper}" \
      opt/microsoft/"msedge-dev"/nacl_helper
    patchelf \
      --set-rpath "${libPath.libwidevinecdm}" \
      opt/microsoft/"msedge-dev"/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so
    patchelf \
      --set-rpath "${libPath.libGLESv2}" \
      opt/microsoft/"msedge-dev"/libGLESv2.so
    patchelf \
      --set-rpath "${libPath.libsmartscreenn}" \
      opt/microsoft/"msedge-dev"/libsmartscreenn.so
    patchelf \
      --set-rpath "${libPath.liboneauth}" \
      opt/microsoft/"msedge-dev"/liboneauth.so
  '';
    });
  })

  ];
  pkgsForSystem = inputs.nixos-unstable;
}
