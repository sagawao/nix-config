{ pkgs, lib, ... }:
{
  imports = [
    ./lsp.nix
    # ./theme.nix
    ./ddc.nix
    ./ddu.nix
    ./skkeleton.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      flavour = "latte";
    };
    options = {
      number = true;
      relativenumber = true;
    };

    clipboard = {
      register = "unnamedplus";
    };

    plugins.nvim-autopairs.enable = true;
    plugins.copilot-vim = {
      enable = true;
      settings = {
        filetypes = {
	  markdown = false;
	  text = false;
	};
      };
    };
    plugins.indent-blankline = {
        enable = true;
        extraOptions = {
          indent.char = "│";
         };
        debounce = 500;
    };

    extraPlugins = with pkgs.vimPlugins; [
      denops-vim
      vim-sandwich
    ];

    extraConfigLua = ''
        if vim.fn.has("wsl" == 1 then)
		vim.g.clipboard = {
		  name = "win32yank",
		  copy = {
		    ["+"] = "win32yank.exe -i --crlf",
		    ["*"] = "win32yank.exe -i --crlf",
		  },
		  paste = {
		    ["+"] = "win32yank.exe -o --lf",
		    ["*"] = "win32yank.exe -o --lf",
		  },
		  cache_enabled = 0,
		}
	end
    '';
  };
}
