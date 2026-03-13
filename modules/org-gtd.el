;;; moss-org-gtd.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, org-gtd  ... ")

(use-package org-gtd
  :ensure (org-gtd.el :host github :repo "Trevoke/org-gtd.el")
  :after org
  :custom
  ;;; GTD Meta
  (org-gtd-directory "~/Org")
  ;; (org-gtd-areas-of-focus ’("list of strings"))
  ;; (org-gtd-)

  ;;; GTD Capture
  ;; (org-gtd-capture-templates) ;; see org capture templates

  ;;; GTD Process

  ;;; GTD Clarify
  )

(provide 'moss-org-gtd)
;;; moss-org-gtd.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
