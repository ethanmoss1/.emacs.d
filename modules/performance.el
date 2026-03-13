;; Performance
;; GCMH is loaded now we have a package manager set up.

;; [[file:../emacsconfig.org::*Performance][Performance:1]]
(message "[ Moss ] Loading core performance  ... ")

;; Tweaks from
;; https://reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; (setq gc-cons-threshold-original gc-cons-threshold)
;; (setq gc-cons-threshold (* 100 1024 1024))
;; (setq file-name-handler-alist-original file-name-handler-alist)
;; (setq file-name-handler-alist nil)
;; (set-frame-parameter nil 'fullscreen 'fullboth)
;; (run-with-idle-timer
;;  5 nil
;;  (lambda ()
;;    (setq gc-cons-threshold gc-cons-threshold-original)
;;    (setq file-name-handler-alist file-name-handler-alist-original)
;;    (makunbound 'gc-cons-threshold-original)
;;    (makunbound 'file-name-handler-alist-original)
;;    (message "[ Init File ] gc-cons-threshold and file-name-handler-alist restored")))

(use-package gcmh
  :hook
  (focus-out-hook . gcmh-idle-garbage-collect)

  :custom
  (gcmh-idle-delay 10)
  (gcmh-high-cons-threshold 104857600)

  :config
  (gcmh-mode +1))

(provide 'moss-performance)
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
