{
  programs.zellij = {
    enable = true;

    settings = {
    	default_shell = "zsh";
	copy_command = "xclip -selection clipboard";

	default_mode = "locked";
	simplified_ui = true;
	pane_frames = false;
	# THEME
        theme = "solarized_light";
        themes.solarized_light.fg = "#657B83";
        themes.solarized_light.bg = "#FDF6E3";
        themes.solarized_light.black = "#EEE8D5";
        themes.solarized_light.white = "#073642";
        themes.solarized_light.red = "#DC322F";
        themes.solarized_light.green = "#859900";
        themes.solarized_light.yellow = "#B58900";
        themes.solarized_light.blue = "#268BD2";
        themes.solarized_light.magenta = "#D33682";
        themes.solarized_light.cyan = "#2AA198";
        themes.solarized_light.orange = "#CB4B16";

	ui = {
	  pane_frames = {
	    hide_session_name = true;
	    session_serialization = false;
	  };
	};
    };
  };
}
