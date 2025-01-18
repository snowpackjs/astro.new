{
  pkgs,
  astroTemplate ? "basics",
  ...
}:
{
  packages = [
    pkgs.which
    pkgs.nodejs_20
    pkgs.nodePackages.pnpm
  ];

  bootstrap = ''
  set -x
  logfile="$PWD/create.log"
  {
    env
    which npm
    which node
    echo y | timeout -k 15s 15s npm create astro@latest project -- --template ${astroTemplate} --git --no-install --skip-houston --yes | cat || true

    mv project "$out"
    mkdir -p .idx
    cp ${./dev.nix} ".idx/dev.nix"
  } 2>&1 | tee "$logfile"

  mv "$logfile" "$out/create.log"
  cd "$out"
  exit 0
  '';
}
