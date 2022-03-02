{ ... }:

let
  pkgs = import ./nixpkgs.nix {};
  inherit (pkgs.lib) cleanSourceWith;

  yarn2nix = import ./yarn2nix.nix { inherit pkgs; };

  inherit (import ./gitignoreSource.nix { inherit (pkgs) lib; }) gitignoreSource;

  yarnPkg = yarn2nix.mkYarnPackage {
    name = "template-editor-pkgs";
    src = cleanSourceWith {
      src = ./.;
      filter = name: type: baseNameOf (toString name) == "package.json";
    };
    yarnLock = ./yarn.lock;
    publishBinsFor = [ "parcel-bundler" ];
  };

in
  pkgs.stdenv.mkDerivation rec {
    name = "template-editor";
    src = gitignoreSource ./.;

    buildInputs = with pkgs.elmPackages; [
      pkgs.nodejs
      elm
      yarnPkg
      pkgs.yarn
      pkgs.procps
    ];

    configurePhase = pkgs.elmPackages.fetchElmDeps {
      elmPackages = import ./elm-srcs.nix;
      registryDat = ./registry.dat;
      elmVersion = "0.19.1";
    };

    installPhase = ''
      rm -rf elm-stuff
      ln -s ${yarnPkg}/libexec/${name}/node_modules node_modules
      mkdir -p $out/assets
      yarn build -d $out/assets
    '';

    passthru.yarnPkg = yarnPkg;
  }
