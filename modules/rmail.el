;;; moss-rmail.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------

(message "[ Moss ] Loading module, rmail  ... ")

(use-package rmail
  :ensure nil
  :custom
  (read-mail-command 'rmail)
  (mail-user-agent 'sendmail-user-agent)

  (rmail-primary-inbox-list '("pop://cywinskimoss%40gmail.com@smtp.gmail.com"))
  (rmail-preserve-inbox t)
  (rmail-mail-new-frame 1) ; Compose in a full frame
  (rmail-delete-after-output 1 ) ; Delete original mail after copying
  (rmail-mime-prefer-html nil ) ; Prefer plaintext when possible
  (rmail-file-name "~/mail/inbox" ) ; The path to our inbox file
  (rmail-secondary-file-directory "~/mail" ) ; The path to our other mbox files
  (message-default-headers "Fcc: ~/mail/sent" ) ; Copy sent mail to the "sent" file

  (user-full-name "Ethan moss")
  (user-mail-address "cywinskimoss@gmail.com")

  (message-signature "Sent from my Emacs")

  (shr-use-fonts nil)  ; Don't load fancy fonts
  (shr-indentation 2)  ; A left-margin of 2 columns
  (shr-use-colors nil) ; Don't load special colors
  (shr-width 70)       ; Fix width to 70 columns
  (shr-bullet " - ")   ; A bullet character for <li> elements
  )


(provide 'moss-rmail)
;;; moss-TEMP.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
