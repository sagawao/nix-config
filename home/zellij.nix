{
  programs.zellij = {
    enable = true;
    settings = {
    	default_shell = "zsh";
	copy_command = "xclip -selection clipboard";
	default_mode = "locked";
	simplified_ui = true;
	pane_frames = false;
	ui = {
	  pane_frames = {
	    hide_session_name = true;
	    session_serialization = false;
	  };
	};
	theme = "catppuccin-latte";
    };
  };
}
