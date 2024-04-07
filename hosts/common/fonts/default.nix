{config, pkgs, ...}:  {

	fonts = {
    		enableDefaultPackages = true;
    		fontDir.enable = true;
    		enableGhostscriptFonts = true;
        packages = with pkgs; [
		        nerdfonts
		        liberation_ttf
            noto-fonts
            noto-fonts-cjk # Chinese, Japanese, Korean
            noto-fonts-emoji
            noto-fonts-extra
            fira-code # Monospace font with programming ligatures
            hack-font # A typeface designed for source code
            fira-mono # Mozilla's typeface for Firefox OS
            corefonts  # Microsoft free fonts
            ubuntu_font_family
            roboto # Android
            emacs-all-the-icons-fonts
          ];
  	};
}
