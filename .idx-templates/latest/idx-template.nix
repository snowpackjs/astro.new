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
    # npm create astro@latest "$out" -- --template ${astroTemplate} --git --no-install --no-houston --yes

    mkdir -p "$out"/.idx
    cp ${./dev.nix} "$out/.idx/dev.nix"
    cp ${./icon.png} "$out/.idx/icon.png"

    ( cd "$out" && npm i --package-lock-only --ignore-scripts )
  '';
}
