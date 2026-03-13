;;; moss-mu4e-dashboard.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, mu4e-dashboard  ... ")

(use-package mu4e-dashboard
  ;; :straight
  ;; (mu4e-dashboard :type git :host github :repo "rougier/mu4e-dashboard")
  :init
  (use-package svg-tag-mode)
  (setq mu4e-dashboard-file (moss-dir "mu4e-side-dashboard.org")))

(provide 'moss-mu4e-dashboard)
;;; moss-mu4e-dashboard.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
