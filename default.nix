{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "home-manager-helper";
  phases = [ "installPhase" ];
  buildInputs = [ pkgs.home-manager ];
  installPhase = ''
    install -v -D -m755 ${./bin/hm} $out/bin/hm
    substituteInPlace $out/bin/hm --subst-var-by home-manager ${pkgs.home-manager}/bin/home-manager
  '';

  meta = with pkgs.stdenv.lib; {
    description = "A helpful wrapper around home-manager";
    platforms = platforms.unix;
    license = licenses.mit;
  };
}
