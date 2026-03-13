;;; moss-steam.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, steam  ... ")

(use-package steam
  :custom
  (steam-username "thesoftwarex"))

(provide 'moss-steam)
;;; moss-steam.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
