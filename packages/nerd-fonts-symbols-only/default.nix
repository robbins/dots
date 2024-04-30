{ lib, stdenv, fetchurl }:

stdenv.mkDerivation (finalAttrs: {
  pname = "nerd-fonts-symbols-only";
  version = "3.2.1";

  src = fetchurl {
    url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${finalAttrs.version}/NerdFontsSymbolsOnly.tar.xz";
    hash = "sha256-t6Pu4k0rCRDzoHcF8eBTIh0lNfB8WhNhTE3q0mIOmXg=";
  };

  sourceRoot = ".";

  installPhase = ''
    find -name \*.ttf -exec mkdir -p $out/share/fonts/truetype/NerdFonts \; -exec mv {} $out/share/fonts/truetype/NerdFonts \;
  '';

  meta = {
    description = "Nerd Fonts Symbols Only";
    homepage = "https://nerdfonts.com/";
  };
})
