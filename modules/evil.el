;;; moss-evil.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, evil  ... ")

(defconst moss/leader "SPC")


(use-package general)

(use-package which-key)

(use-package evil
  :config
  (general-define-key
   :prefix "SPC"
   :states 'normal
   "SPC" 'execute-extended-command

   ;; Help
   "h h" 'helpful-at-point
   "h f" 'helpful-callable
   "h v" 'helpful-variable
   "h k" 'helpful-key
   "h b" 'general-describe-keybindings
   "h m" 'describe-mode
   "h n" 'describe-minor-mode

   ;; find
   "f f" 'find-file
   "f t" 'dired
   "f D" 'chezmoi-find

   ;; Windows
   "w <left>"  'windmove-left
   "w <right>" 'windmove-right
   "w <up>"    'windmove-up
   "w <down>"  'windmove-down

   ;; Buffers
   "b b" 'consult-buffer
   "b B" 'ibuffer
   "b k" 'kill-current-buffer
   "b s" 'save-buffer))

(provide 'moss-evil)

;;; moss-evil.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
