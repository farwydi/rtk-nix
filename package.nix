{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
}:

stdenv.mkDerivation rec {
  pname = "rtk";
  version = "0.41.0";

  src = fetchurl {
    url = "https://github.com/rtk-ai/rtk/releases/download/v${version}/rtk-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-kK4Q9cdt6brK7F7u77YBL3TdR/TigOxhQpVVW2Taa1c=";
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
