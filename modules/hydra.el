;;; hydra --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, hydra  ... ")

(use-package hydra
  )
;; (use-package pretty-hydra)

;; (use-package major-mode-hydra
;; :bind
;; ("M-SPC" . 'major-mode-hydra))


;; (use-package hydra-posframe
;; :straight (:package "hydra-posframe" :host github :type git
;; :repo "Ladicle/hydra-posframe")
;; :hook (after-init . hydra-posframe-enable))

(provide 'moss-hydra)
;;; moss-hydra.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
