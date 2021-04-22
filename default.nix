{ pkgs ? import <nixpkgs> {} }:

with pkgs;
with stdenv.lib;

stdenv.mkDerivation rec {
  pname = "i3blocks-contrib";
  version = "1.4";

  src = fetchFromGitHub {
    owner = "vivien";
    repo = pname;
    rev = "f2024b16c59432c3a65d92fff1952cbbe7c15c75";
    sha256 = "1nmw4rzbzfqi0mym9pz8d471faiws97vyqrbv3zf8jfzlcj2cn0r";
  };

  patches = [
    ./0001-add-configure-script.patch 
    # pending upstreaming: https://github.com/vivien/i3blocks-contrib/pull/363
  ];

  meta = {
    description = "Set of scripts (a.k.a. blocklets) for i3blocks, contributed by the community";
    homepage = "https://github.com/vivien/i3blocks-contrib";
    license = licenses.gpl3;
    platforms = with platforms; freebsd ++ linux;
  };
}

# TODO: why does configure end up in the final package? o.0
# TODO: add this to my pkgs
# TODO: how to handle stable path?
# TODO: contribute this to nixpkgs
