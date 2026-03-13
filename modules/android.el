;;; moss-android.el --- Summary

;;; Commentary : ---------------------------------------------------------------
;; TODO: This all needs updating, it needs the old message and provide ripped out
;; as well as changing some of the code to be updated to better conventions

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, android  ... ")

;; Set up Android specific variables

(if (eq system-type 'android)
    (progn
      (message "Android system, updating paths and libs for termux")
      (setq termux-dir "/data/data/com.termux/")
      (setq shell-file-name (concat termux-dir "files/usr/bin/bash"))
      (setq user-emacs-directory "~/.config/emacs/")
      (setenv "HOME" (concat termux-dir "files/home/"))
      (setenv "PATH"
              (format "%s:%s"
                      (concat
                       termux-dir
                       "files/usr/bin"
                       ":"
                       termux-dir
                       "files/usr/bin/texlive")
					  (getenv "PATH")))
      (setenv "LD_LIBRARY_PATH" (format "%s:%s"
                                        (concat
                                         termux-dir
				                         "files/usr/lib")
										(getenv "LD_LIBRARY_PATH")))
      (push (concat termux-dir "files/usr/bin") exec-path)
      (push (concat termux-dir "files/usr/bin/texlive") exec-path))
  (message "Not android, continuing"))

(if (eq system-type 'android)
    (progn
      ;; Touchscreen specific settings
      (setq touch-screen-display-keyboard t
            touch-screen-precision-scroll t
            touch-screen-word-select t)

      ;; Nice padding to keep focus within emacs
      (setq default-frame-alist
            (append (list
    	             '(min-height . 1)
                     '(height     . 45)
    	             '(min-width  . 1)
                     '(width      . 81)
                     '(left-fringe . 9)
                     '(right-fringe . 9)
                     '(vertical-scroll-bars . nil)
                     '(internal-border-width . 12)
                     '(tool-bar-lines . 0)
                     '(Menu-bar-lines . 0))))

      ;; Vertical window divider
      (setq window-divider-default-right-width 12
            window-divider-default-places 'right-only)
      (window-divider-mode 1)))

;; (server-start)
(setq termux-dir "/data/data/com.termux/")
(push (concat "TEXMFLOCAL=" termux-dir "files/usr/share/texlive/texmf-local") process-environment)
(push (concat "TEXMFROOT=" termux-dir "files/usr/share/texlive/2024") process-environment)

;; Need US international keyboard so change needed
(global-set-key (kbd "ˆ") (kbd "^"))  ; For latex maths

(provide 'moss-android)
;;; moss-android.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
