;;; solaire --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, solaire  ... ")

(use-package solaire-mode
  :config
  ;; By default, solaire-mode remaps the mode-line faces.
  ;; This interferes with certain mode-line packages like
  ;; telephone-line or powerline, but works fine for doom-modeline.
  ;; To disable this behavior use:
  (dolist (face '(mode-line mode-line-active mode-line-inactive))
    (setf (alist-get face solaire-mode-remap-alist) nil))
  ;; (add-to-list 'solaire-mode-themes-to-face-swap 'gruvbox)
  (solaire-global-mode +1))

(provide 'moss-solaire)
;;; moss-solaire.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
