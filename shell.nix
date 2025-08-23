# NixOS vaapi lib
{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    libva
    libva-utils
    libdrm
  ];

  PKG_CONFIG_PATH = "${pkgs.libva.dev}/lib/pkgconfig:${pkgs.libdrm.dev}/lib/pkgconfig";
  C_INCLUDE_PATH = "${pkgs.libva.dev}/include:${pkgs.libdrm.dev}/include";
  LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [
    pkgs.libva
    pkgs.libva-utils
    pkgs.libdrm
  ]}";
}

