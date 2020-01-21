{ lib, pkgs, ... }:

let

  gpgKey = "0CBFCE8BC161F36E2E156A526E5EAB98B1F77A17";

in

{

  imports = [
    ../../config/bat.nix
    ../../config/browserpass.nix
    ../../config/direnv.nix
    ../../config/emacs
    ../../config/firefox.nix
    ../../config/fish
    ../../config/fzf.nix
    ../../config/git
    (import ../../config/gpg.nix { inherit gpgKey; })
    ../../config/htop.nix
    ../../config/i3
    ../../config/jq.nix
    ../../config/kitty
    ../../config/man.nix
    ../../config/nixpkgs
    ../../config/rebar3.nix
    # TODO: ../../config/taskwarrior
    # TODO: ../../config/vim.nix
  ];

  home.packages = with pkgs; [
    carla
    reaper
  ];

  _module.args.pkgs = lib.mkForce pkgs;

}
