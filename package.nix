{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "rtk";
  version = "0.44.0";

  src = fetchurl {
    url = "https://github.com/rtk-ai/rtk/releases/download/v${version}/rtk-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-PDMWz8Bo43JDK0Ffrqtz1G+AR3UNSI3ZTQHY2fAWoqE=";
  };

  sourceRoot = ".";

  nativeBuildInputs = [ autoPatchelfHook ];

  installPhase = ''
    install -Dm755 rtk $out/bin/rtk
  '';

  meta = {
    description = "High-performance CLI proxy to minimize LLM token consumption";
    homepage = "https://github.com/rtk-ai/rtk";
    license = lib.licenses.mit;
    mainProgram = "rtk";
    platforms = [ "x86_64-linux" ];
  };
}
