;; -*- lexical-binding: t -*-
;;; moss-personal-themeing.el --- Summary

;;; Commentary : ---------------------------------------------------------------
;; Personal theme changes

;;; Code : ---------------------------------------------------------------------
(message "[ Moss ] Loading module, personal-themeing  ... ")

;; (use-package hl-line
;;   :custom-face
;;   (hl-line ((t (:inherit fringe)))))

(use-package emacs
  :ensure nil
  :custom-face
  ;; window divider mode
  (window-divider ((t (:inherit (default) :inverse-video t))))
  (window-divider-first-pixel ((t (:inherit (default) :inverse-video t))))
  (window-divider-last-pixel ((t (:inherit (default) :inverse-video t))))

  ;; customize button
  ;; (custom-button ((t
  ;;                  (:box (:line-width (2 . 2) :color nil :style released-button)
  ;;                        :inverse-video t
  ;;                        :inherit (default)))))
  ;; (custom-button-mouse ((t
  ;;                  (:box (:line-width (2 . 2) :color nil :style released-button)
  ;;                        :inverse-video t
  ;;                        :inherit (default)))))
  ;; (custom-button-pressed ((t
  ;;                  (:box (:line-width (2 . 2) :color nil :style released-button)
  ;;                        :inverse-video t
  ;;                        :inherit (default)))))
  )

(provide 'moss-personal-themeing)
;;; moss-personal-themeing.el ends here ----------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
