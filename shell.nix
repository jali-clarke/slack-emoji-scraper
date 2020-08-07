let nixpkgs = import <nixpkgs> {};

    name = "slack-emoji-scraper";
    pythonAttr = "python38";

    python = nixpkgs."${pythonAttr}Full";
    pythonPackages = nixpkgs."${pythonAttr}Packages";
    pip = pythonPackages.pip;

    requirementsTxt = ./requirements.txt;
in nixpkgs.mkShell {
    name = name;
    buildInputs = [
        python
        pip
        requirementsTxt
    ];

    shellHook = "
        unset SOURCE_DATE_EPOCH
        export PIP_PREFIX=\"/tmp/${name}/pip_packages\"
        export PATH=\"$PIP_PREFIX/bin:$PATH\"
        export PYTHONPATH=\"$PIP_PREFIX/lib/python$(${python}/bin/python --version | ${nixpkgs.gnugrep}/bin/grep -o '[0-9]\\.[0-9]')/site-packages:$PYTHONPATH\"
        ${pip}/bin/pip install -r ${requirementsTxt}
    ";
}