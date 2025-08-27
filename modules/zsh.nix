{ ... }: {

  programs.zsh = {
    enable = true; 
    initExtra = ''
	export EDITOR="nvim"

	function vim() {
	    if [ -z "$@" ]; then
		nvim .
	    else
		nvim $@
	    fi
	}
    ''; 
  };
  programs.starship = { 
    enable = true; 
  }; 
}
