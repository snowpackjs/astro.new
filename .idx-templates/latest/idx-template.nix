{
  pkgs,
  astroTemplate ? "basics",
  ...
}:
{
  packages = [
    pkgs.nodejs_20
    pkgs.nodePackages.pnpm
  ];

  bootstrap = ''
  set -x
  logfile="$PWD/create.log"
  {
    mkdir -p "$out"
    cd "$out"
    env
    which npm
    which node
    echo y | timeout -k 15s 15s npm create astro@latest . --template ${astroTemplate} --git --no-install --skip-houston --yes || true

    mkdir -p .idx
    cp ${./dev.nix} ".idx/dev.nix"
  } 2>&1 | tee "$logfile"

  mv "$logfile" "$out/create.log"
  exit 1
  '';
}
