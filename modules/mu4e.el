;;; moss-mu4e.el --- Emacs Email client  -*- lexical-binding: t; -*-

;;; Commentary : ---------------------------------------------------------------
;; Using Emacs as my Email client with MU 4 Emacs.
;; install using aur helper package manager or manually,
;; 'yay mu'

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, mu4e  ... ")

(use-package mu4e
  :ensure (:host github
                 :repo "djcb/mu"
                 :branch "release/1.10"
                 :pre-build (("./autogen.sh") ("make"))
                 :files ("build/mu4e/*.el"))

  :commands (mu4e)

  :config
  ;; (setq mu4e-maildir "/home/ethan/Mail")
  (setq mu4e-maildir "/ssh:server:/home/ethan/Mail/")

  ;; use pass to store passwords
  ;; file auth looks for is ~/.password-store/<smtp.host.tld>:<port>/<name>
  (auth-source-pass-enable)
  (add-to-list 'mu4e-bookmarks
               '("m:/cywin/INBOX or m:/wowethm/INBOX" "All Inboxes" ?i))

  (setq auth-sources '(password-store))
  (setq auth-source-debug t)
  (setq auth-source-do-cache nil)
  (setq mail-user-agent 'mu4e-user-agent)
  (setq mu4e-change-filenames-when-moving t)  ; Avoid mail sync issues w/ mbsync
  (setq mu4e-modeline-mode t)
  (setq mu4e-modeline-support t)

  (setq mu4e-update-interval (* 10 60))  ; Refresh mail using isync every 10 minutes
  (setq message-kill-buffer-on-exit t)
  (setq mu4e-use-fancy-chars t)
  (setq mu4e-get-mail-command "mbsync -a")


  (setq mu4e-contexts (list
                       ;; Cywinskimoss Gmail Account
                       (make-mu4e-context
                        :name "Cywinskimoss"
                        :match-func
                        (lambda (msg) (when msg
                                        (string-prefix-p "/cywin" (mu4e-message-field msg :maildir))))
                        :vars '((user-mail-address   . "cywinskimoss@gmail.com")
                                (user-full-name      . "Ethan Moss")
                                (mu4e-drafts-folder  . "/cywin/[Gmail]/Drafts")
                                (mu4e-sent-folder    . "/cywin/[Gmail]/Sent Mail")
                                (mu4e-refile-folder  . "/cywin/[Gmail]/All Mail")
                                (mu4e-trash-folder   . "/cywin/[Gmail]/Trash")))

                       ;; Wow.ethm Gmail account
                       (make-mu4e-context
                        :name "Wow.ethm"
                        :match-func
                        (lambda (msg) (when msg
                                        (string-prefix-p "/wowethm" (mu4e-message-field msg :maildir))))
                        :vars '((user-mail-address   . "wow.ethm@gmail.com")
                                (user-full-name      . "Ethan Moss")
                                (mu4e-drafts-folder  . "/wowethm/[Gmail]/Drafts")
                                (mu4e-sent-folder    . "/wowethm/[Gmail]/Sent Mail")
                                (mu4e-refile-folder  . "/wowethm/[Gmail]/All Mail")
                                (mu4e-trash-folder   . "/wowethm/[Gmail]/Trash"))))))

(message "mu4e loaded")
(provide 'moss-mu4e)

;;; moss-mu4e.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
