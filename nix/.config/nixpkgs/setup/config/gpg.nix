{ ... }:

{

  programs.gpg = {
    enable = true;
    settings = {
      default-key = "EFD6F1EDC84D2FA935E38570462054AB8B682702";
      no-emit-version = true;
    };
  };

}