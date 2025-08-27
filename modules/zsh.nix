{ ... }: {

  programs.zsh = {
    enable = true; 
    sessionVariables = { 
	EDITOR = "neovim"; 
    }; 
  }; 
}
