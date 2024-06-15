{ lib, stdenv, fetchurl, p7zip }:

stdenv.mkDerivation (finalAttrs: {
  pname = "apple-fonts";
  version = "latest";

  pro = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg";
    sha256 = "sha256-B8xljBAqOoRFXvSOkOKDDWeYUebtMmQLJ8lF05iFnXk=";
  };

  compact = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg";
    sha256 = "sha256-L4oLQ34Epw1/wLehU9sXQwUe/LaeKjHRxQAF6u2pfTo=";
  };

  mono = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg";
    sha256 = "sha256-Uarx1TKO7g5yVBXAx6Yki065rz/wRuYiHPzzi6cTTl8=";
  };

  ny = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/NY.dmg";
    sha256 = "sha256-yYyqkox2x9nQ842laXCqA3UwOpUGyIfUuprX975OsLA=";
  };

  symbols = fetchurl {
    url = "https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-6.dmg";
    sha256 = "sha256-aEOSjaezFKQ2f1BMjIeUcyLxqoWvTnOFnlHfP8CFz8M=";
  };

  nativeBuildInputs = [ p7zip ];

  sourceRoot = ".";

  dontUnpack = true;

  installPhase = ''
    7z x ${finalAttrs.pro}
    cd SFProFonts
    7z x 'SF Pro Fonts.pkg'
    7z x 'Payload~'
    mkdir -p $out/fontfiles
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${finalAttrs.mono}
    cd SFMonoFonts
    7z x 'SF Mono Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${finalAttrs.compact}
    cd SFCompactFonts
    7z x 'SF Compact Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    cd ..

    7z x ${finalAttrs.ny}
    cd NYFonts
    7z x 'NY Fonts.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles
    
    7z x ${finalAttrs.symbols}
    cd SFSymbols
    7z x 'SF Symbols.pkg'
    7z x 'Payload~'
    mv Library/Fonts/* $out/fontfiles

    mkdir -p $out/share/fonts/opentype $out/share/fonts/truetype
    mv $out/fontfiles/*.otf $out/share/fonts/opentype
    mv $out/fontfiles/*.ttf $out/share/fonts/truetype
    rm -rf $out/fontfiles
  '';

  meta = with lib; {
    description = "Apple San Francisco, New York fonts";
    homepage = "https://developer.apple.com/fonts/";
    license = licenses.unfree;
    platforms = platforms.all;
  };
})
