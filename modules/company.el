;;; company --- Summary

;;; Commentary:

;;; Code:

(message "[ Moss ] Loading module, company  ... ")

(use-package company
  :hook  ((python-mode . company-mode)
          (java-mode . company-mode))
  :bind
  ;; Enable indent and complete at point functionality by pressing tab.
  ("TAB" . 'company-indent-or-complete-common)
  (:map company-active-map
        ("TAB" . 'company-complete-selection))

  :config
  (setq company-begin-commands '(self-insert-command)
        company-dabbrev-downcase nil
        company-echo-delay 0.01
        company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-tooltip-limit 5

        ;; invert the navigation direction if the the completion popup-isearch-match
        ;; is displayed on top (happens near the bottom of windows)
        company-tooltip-flip-when-above nil)

  (with-eval-after-load 'orderless
    ;; We follow a suggestion by company maintainer u/hvis:
    ;; https://www.reddit.com/r/emacs/comments/nichkl/comment/gz1jr3s/
    (defun company-completion-styles (capf-fn &rest args)
      (let ((completion-styles '(basic partial-completion)))
        (apply capf-fn args)))

    (advice-add 'company-capf :around #'company-completion-styles))
  )

(provide 'moss-company)
;;; moss-company.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
