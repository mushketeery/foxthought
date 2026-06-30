{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  # https://devenv.sh/basics/
  env.GREET = "Oofity Loofity!";

  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  # https://devenv.sh/languages/
  languages.go = {
    enable = true;
    delve.enable = true;
    lsp.enable = true;
  };

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo $GREET
  '';

  # https://devenv.sh/basics/
  enterShell = ''
    hello         # Run scripts directly
  '';

  # See full reference at https://devenv.sh/reference/options/
}
