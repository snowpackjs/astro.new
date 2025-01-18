{
  pkgs,
  astroTemplate ? "basics",
  ...
}:
{
  packages = [
    pkgs.nodejs_20
  ];

  bootstrap = ''
    mkdir -p "$out"
    cd "$out"
    echo y | npm create astro@latest . -- --template ${astroTemplate} --git --no-install --skip-houston --yes

    mkdir -p .idx
    cp ${./dev.nix} ".idx/dev.nix"
  '';
}
