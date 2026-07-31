;;; package --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, Projectile ... ")

(use-package projectile
  :custom
  (projectile-cache-file (moss-cache-dir "projectile")))

(provide 'moss-projectile)

;;; moss-projectile.el ends here



