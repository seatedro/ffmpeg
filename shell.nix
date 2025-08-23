# NixOS vaapi and NVENC libs
{
  pkgs ? import <nixpkgs> { },
  config ? {
    allowUnfree = true;
  },
}:

let
  pkgsUnfree = import <nixpkgs> { inherit config; };
in

pkgs.mkShell {
  buildInputs = with pkgs; [
    # VAAPI support
    libva
    libva-utils
    libdrm

    # NVENC support
    pkgsUnfree.cudatoolkit
    pkgsUnfree.cudaPackages.cuda_cudart
    pkgsUnfree.nv-codec-headers
  ];

  PKG_CONFIG_PATH = "${pkgs.libva.dev}/lib/pkgconfig:${pkgs.libdrm.dev}/lib/pkgconfig:${pkgsUnfree.nv-codec-headers}/lib/pkgconfig";
  C_INCLUDE_PATH = "${pkgs.libva.dev}/include:${pkgs.libdrm.dev}/include:${pkgsUnfree.cudatoolkit}/include:${pkgsUnfree.nv-codec-headers}/include";
  LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [
    pkgs.libva
    pkgs.libva-utils
    pkgs.libdrm
    pkgsUnfree.cudatoolkit.lib
    pkgsUnfree.cudaPackages.cuda_cudart
  ]}";

  CUDA_PATH = "${pkgsUnfree.cudatoolkit}";
  CUDA_ROOT = "${pkgsUnfree.cudatoolkit}";
}
