let mkVenvShell = import(
        builtins.fetchGit {
            url = "https://github.com/jali-clarke/mkVenvShell.git";
            ref = "refs/tags/0.0.0";
        }
    );
in mkVenvShell {
    projectName = "slack-emoji-scraper";
    python = "python38";
    requirements = ./requirements.txt;
}