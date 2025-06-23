{
  programs.git = {
    enable = true;
    signing = {
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgSign = true;
      tag.gpgSign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
    };
  };
  home.file."./.config/git/allowed_signers".text = ''
    ChristopherBStocks ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIkf9hadS4vqIFqEWzxJeFkI/rfaWkkOQfP2wd2A4iRj
    ChristopherBStocks ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILcbcqr/Qvw8FtcSW0xSa6e/MJ4mw5IbRntBMLkz6ZoB
  '';
}
