;;; moss-shell-pop.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, shell-pop  ... ")

(use-package shell-pop
  :bind
  ("M-RET" . 'shell-pop)
  :custom
  (shell-pop-shell-type '("eshell" "eshell" (lambda () (eshell))))
  ;; (shell-pop-full-span t)
  ;; (shell-pop-default-directory "/Users/kyagi/git")
  ;; (shell-pop-term-shell "/bin/bash")
  (shell-pop-universal-key "M-RET")
  (shell-pop-window-size 30)
  (shell-pop-window-position "bottom")
  (shell-pop-autocd-to-working-dir t)
  (shell-pop-restore-window-configuration t)
  (shell-pop-cleanup-buffer-at-process-exit t))

(provide 'moss-shell-pop)
;;; moss-shell-pop.el ends here ------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
