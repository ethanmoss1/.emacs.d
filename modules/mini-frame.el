;;; mini-frame --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, mini-frame  ... ")

(use-package mini-frame
  :config
  (setq mini-frame-show-parameters
        `((left . 0.5)
          (top . 1.0)
          (width . 1.0)
          (height . 9)
          (child-frame-border-width . 4)
          ;; (foreground-color . "#EBDBB2")
          ;; (background-color . "#32302F")
          ))
  (setq mini-frame-resize 'not-set)

  (add-hook 'minibuffer-setup-hook
            (lambda () (overlay-put (make-overlay (point-min) (+ (point-min) 1))
                                    'before-string
                                    (propertize "\n" 'face `(:extend t
                                                                     :height .5)))))
  (mini-frame-mode +1))

(provide 'moss-mini-frame)
;;; moss-mini-frame.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
