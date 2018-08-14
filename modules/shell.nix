{ config, pkgs, ... }:

{
  environment = {
    shellAliases = {
      agn = "ag --nogroup";
      agq = "ag -Q";
      k = "clear";
      l = "ls -Glah";
      ll = "ls -Glh";
      ls = "ls -G";
    };

    systemPackages = with pkgs; ([
      autojump
      clang
      direnv
      gcc
      gnumake
      htop
      httpie
      indent
      keybase
      noweb
      psmisc
      ripgrep
      silver-searcher
      (texlive.combine {
        inherit (texlive) scheme-full tufte-latex;
      })
      tree
    ]) ++ (with python36Packages; [
      grip
      pygments
    ]);
  };

  programs = {
    bash.enableCompletion = true;

    fish = {
      enable = true;
      shellInit = pkgs.stdenv.lib.strings.fileContents ./shell/shellInit.fish;
    };

    # TODO
    # tmux.enable = true;
  };

  security = {
    sudo.extraConfig = ''
      yurrriq ALL=(ALL) NOPASSWD: ALL
    '';
  };

}
