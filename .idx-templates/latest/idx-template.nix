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
    mkdir -p "$out"
    cd "$out"
    echo y | timeout -k 30s 30s pnpm create astro@latest . --template ${astroTemplate} --git --no-install --skip-houston --yes &> create.log || true

    mkdir -p .idx
    cp ${./dev.nix} ".idx/dev.nix"
  '';
}
