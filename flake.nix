# https://wiki.nixos.org/wiki/Go

{
  description = "Homemade cowsay but it's a fox and his thoughts";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    let
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems =
        f:
        nixpkgs.lib.genAttrs allSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );
    in
    {
      packages = forAllSystems (
        { pkgs }: {
          default = pkgs.buildGoModule rec {
            pname = "foxthought";
            version = "1.0.0";
            subPackages = [ "cmd/foxthought" ];
            src = ./.;
            vendorHash = null;

            meta = {
              description = "Homemade cowsay but it's a fox and his thoughts";
              homepage = "https://github.com/mushketeery/foxthought";
              license = pkgs.lib.licenses.gpl3Only;
              mainProgram = "foxthought";
            };
          };
        }
      );
    };
}
