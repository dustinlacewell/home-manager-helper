{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "home-manager-helper";
  phases = [ "installPhase" ];
  buildInputs = [ pkgs.home-manager ];
  installPhase = ''
    mkdir -p $out/bin
    substitute ${./bin/hm} $out/bin/hm --replace @homeManager@ ${pkgs.home-manager}/bin/home-manager
    chmod +x $out/bin/hm
  '';

  meta = with pkgs.stdenv.lib; {
    description = "A helpful wrapper around home-manager";
    platforms = platforms.unix;
    license = licenses.mit;
  };
}
