let
  owner = "moretea";
  repo = "yarn2nix";
  rev = "9e7279edde2a4e0f5ec04c53f5cd64440a27a1ae";
in
  import (builtins.fetchTarball {
    url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
    sha256 = "0zz2lrwn3y3rb8gzaiwxgz02dvy3s552zc70zvfqc0zh5dhydgn7";
  })


