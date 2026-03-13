;;; base16 --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, base-16  ... ")

(use-package base16-theme
  :config
  (setq base16-theme-distinct-fringe-background nil)
  (defvar base16-gruvbox-material-dark-medium-theme-colors
    '(:base00 "#282828" ;; #282828
      :base01 "#3c3836" ;; #3c3836
      :base02 "#504945" ;; #504945
      :base03 "#665c54" ;; #665c54
      :base04 "#bdae93" ;; #bdae93
      :base05 "#d5c4a1" ;; #d5c4a1
      :base06 "#ebdbb2" ;; #ebdbb2
      :base07 "#fbf1c7" ;; #fbf1c7
      :base08 "#ea6962" ;; #ea6962
      :base09 "#e78a4e" ;; #e78a4e
      :base0A "#d8a657" ;; #d8a657
      :base0B "#a9b665" ;; #a9b665
      :base0C "#89b482" ;; #89b482
      :base0D "#7daea3" ;; #7daea3
      :base0E "#d3869b" ;; #d3869b
      :base0F "#d65d0e");; #d65d0e
    "All colors for Base16 Gruvbox Material Dark Medium are defined here.")

  ;; Define the theme
  (deftheme base16-gruvbox-material-dark-medium)
  (base16-theme-define 'base16-gruvbox-material-dark-medium base16-gruvbox-material-dark-medium-theme-colors)
  (provide-theme 'base16-gruvbox-material-dark-medium)
  (load-theme 'base16-gruvbox-material-dark-medium t))

(provide 'moss-base16)
;;; moss-base-16.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
