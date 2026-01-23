{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  buildInputs = with pkgs; [
    
  ];

  FOO = "bar";

  shellHook = ''
    echo "entering nix shell"
  '';

}

