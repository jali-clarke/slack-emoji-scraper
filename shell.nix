let nixpkgs = import <nixpkgs> {};

    stdenv = nixpkgs.stdenv;
    python38Packages = nixpkgs.python38Packages;
in nixpkgs.mkShell {
    name = "slack-emoji-scraper";
    buildInputs = [
        nixpkgs.python38Full
        python38Packages.pip
    ];

    shellHook = "
        unset SOURCE_DATE_EPOCH
        export PIP_PREFIX=\"/tmp/slack-emoji-scraper/pip_packages\"
        export PATH=\"$PIP_PREFIX/bin:$PATH\"
        export PYTHONPATH=\"$PIP_PREFIX/lib/python3.8/site-packages:$PYTHONPATH\"
    ";
}