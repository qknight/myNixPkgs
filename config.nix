{
  packageOverrides = pkgs : with pkgs; rec {
    # example environment from viric
    sdlEnv = pkgs.myEnvFun {
      name = "sdl";
      buildInputs = [ stdenv doxygen SDL SDL_image SDL_ttf SDL_gfx cmake SDL_net pkgconfig ];
    };

    # a custom library NOT included in nixpkgs (maybe later it is but assume for this example it is not)
    libnoise = callPackage ./libnoise.nix {};

    # this is the needed environment for development of my spring random map generator
    # type 'load-srmg-env' to load it after installing it using 'nix-env -i env-srmg'
    srmgEnv = pkgs.myEnvFun {
      name = "srmg";
      buildInputs = [ stdenv doxygen cmake libnoise qt4 ];
    };
  };
}
