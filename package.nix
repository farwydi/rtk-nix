{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "rtk";
  version = "0.39.0";

  src = fetchurl {
    url = "https://github.com/rtk-ai/rtk/releases/download/v${version}/rtk-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-BuWCuhmW7wPnakQbmJarp53Rt0bOU50igpbGgbHFQBw=";
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
