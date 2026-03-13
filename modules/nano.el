;;; nano --- Summary

;;; Commentary:

;;; Code: ------------------------------------------------------------

(message "[ Moss ] Loading module, nano  ... ")

(use-package nano
  :defer t  ; otherwise we load all the lisp files.
  :straight
  (nano :type git :host github :repo "rougier/nano-emacs"
        :fork (:host github :repo "ethanmoss1/nano-emacs"))

  :init
  (setq nano-font-size 10)
  (setq nano-font-family-monospaced "JetBrainsMono Nerd Font Mono")
  )

(require 'nano-base-colors)
(require 'nano-faces)

(provide 'moss-nano)
;;; moss-nano.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
