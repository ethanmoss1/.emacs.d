;;; moss-godmode.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, godmode  ... ")

(use-package god-mode
  :bind
  ("C-x C-0" . 'delete-window)
  ("C-x C-1" . 'delete-other-windows)
  ("C-x C-2" . 'split-window-below)
  ("C-x C-3" . 'split-window-right)
  (:keymaps 'god-local-mode-map
            "[" 'backward-paragraph
            "]" 'forward-paragraph)
  :init
  (defun my-god-mode-update-cursor-type ()
    (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

  (add-hook 'post-command-hook #'my-god-mode-update-cursor-type)
  )

(provide 'moss-godmode)
;;; moss-godmode.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
