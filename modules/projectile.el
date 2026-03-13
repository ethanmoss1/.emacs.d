;;; package --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, Projectile ... ")

(use-package projectile
  :custom
  (projectile-cache-file (moss-cache-dir "projectile")))

(provide 'moss-projectile)

;;; moss-projectile.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
