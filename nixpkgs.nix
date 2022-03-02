let
  url = https://releases.nixos.org/nixpkgs/nixpkgs-20.03pre210728.42a195919a1/nixexprs.tar.xz;
in
  import (builtins.fetchTarball url)

