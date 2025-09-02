{ ... }: 
{
  programs.zsh = {
    enable = true; 
    shellAliases = { 
      vim = "nvim";
    };
    initContent = "ssh-add ~/.ssh/github 2>/dev/null || true"; 
  }; 
  programs.starship = { 
    enable = true; 
  }; 
}
