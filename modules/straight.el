;; Straight Package management with use-package
;; Easy, and reproducable Emac configuration with straight and use-package

;; [[file:../emacsconfig.org::*Straight Package management with use-package][Straight Package management with use-package:1]]
(message "[ Moss ] Loading Package manager, Straight ... ")

;; Set up some things before we install straight.
(setq straight-use-package-by-default t)
(setq straight-base-dir moss-cache-dir)


;; Script that sets up Straight if not on the system already
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" moss-cache-dir))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; set up use-package to wrap packages nicely.
(straight-use-package 'use-package)

(provide 'moss-package-manager)
;; Straight Package management with use-package:1 ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
