{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.git = inputs.wrapper-modules.git.wrap {
      inherit pkgs;
      package = pkgs.git;
      env = rec {
        GIT_AUTHOR_NAME = "nanoplank";
        GIT_AUTHOR_EMAIL = "felixargon@protonmail.com";
        GIT_COMMITTER_NAME = GIT_AUTHOR_NAME;
        GIT_COMMITTER_EMAIL = GIT_AUTHOR_EMAIL;
      };
    };
  };
}
