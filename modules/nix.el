;;; nix.el --- Nix mode for syntax  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: emacs lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:
;; Dependencies:
(use-package reformatter)

(use-package nix-mode
  :after (reformatter)
  :hook ((nix-mode . eglot-ensure))
  :config
  ;; Eglot
  ;; (setq-default eglot-workspace-configuration
  ;;               '((nixd
  ;;                  (nixpkgs
  ;;                   (expr . "import <nixpkgs> {}"))
  ;;                  (formatting
  ;;                   (command . ["nixfmt"]))
  ;;                  (options
  ;;                   (home-manager
  ;;                    (expr . "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.thinkpad.options.home-manager.users.type.getSubOptions []"))))))
  )

(use-package emacs
  :ensure nil
  :after (embark)
  :hook (nix-mode . my/nix-setup-embark)
  :init
  (defun my/nix-open-file-or-default (file)
    "Open FILE, redirecting to default.nix if FILE is a directory containing it."
    (interactive "FFile: ")
    (let* ((expanded (expand-file-name file))
           (default-nix (expand-file-name "default.nix" expanded)))
      (if (and (file-directory-p expanded)
               (file-regular-p default-nix))
          (find-file default-nix)
        (find-file expanded))))

  ;; (define-key embark-file-map (kbd "N") #'my/nix-open-file-or-default)

  (defun my/nix-setup-embark ()
    "Locally override default embark file action for `nix-mode` buffers."
    (setq-local embark-default-action-overrides
                (cons '(file . my/nix-open-file-or-default)
                      embark-default-action-overrides))))

;;; nix.el ends here
