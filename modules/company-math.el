;;; moss-company-math.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, company-math  ... ")

(use-package company-math
  :hook (org-mode . company-math-mode-setup)
  :config
  (defun company-math-mode-setup ()
    (setq-local company-backends
                (append '((company-latex-commands company-math-symbols-latex)) company-backends))))

(provide 'moss-company-math)
;;; moss-company-math.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
