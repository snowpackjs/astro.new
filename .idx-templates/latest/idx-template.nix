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
    mkdir "$out"
    yes | npm create astro@latest "$out" -- --template ${astroTemplate} --git --no-install --skip-houston --yes

    mkdir -p "$out"/.idx
    cp ${./dev.nix} "$out/.idx/dev.nix"

    ( cd "$out" && npm i --package-lock-only --ignore-scripts )
  '';
}
