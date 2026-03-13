;;; moss-org-noter.el --- Summary

;;; Commentary : ---------------------------------------------------------------
;; Org noter allows you to have a specific org file for your notes on pdf
;; documents
;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, org-noter  ... ")

(use-package org-noter
  :init
  (require 'moss-pdf-tools)
  )

(provide 'moss-org-noter)
;;; moss-org-noter.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
