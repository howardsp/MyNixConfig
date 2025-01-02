{config, pkgs, ...}:  {

	fonts = {
    		enableDefaultPackages = true;
    		fontDir.enable = true;
    		enableGhostscriptFonts = true;
        packages = with pkgs; [		        
            meslo-lgs-nf
            nerdfonts
            liberation_ttf
            freefont_ttf
            carlito   # similar to microsoft Calibri
            noto-fonts
            noto-fonts-cjk-sans # Chinese, Japanese, Korean
            noto-fonts-emoji
            noto-fonts-extra
            fira-code # Monospace font with programming ligatures
            fira-code-symbols
            fira-mono # Mozilla's typeface for Firefox OS
            hack-font # A typeface designed for source code
            corefonts  # Microsoft free fonts
            ubuntu_font_family
            roboto # Android
            emacs-all-the-icons-fonts
            cascadia-code
            mplus-outline-fonts.githubRelease
            open-sans
            dina-font
            proggyfonts
          ];
  	};
}
