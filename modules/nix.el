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

(defun nixos-edit-config ()
  "Edit the nixos config file"
  (interactive)
  (if (string= my-hostname "mac")
      (find-file "/Users/ethan/.config/nix-darwin")
    (find-file "/home/ethan/.config/nixos")))

;; Run a nice buffer with the output of the nix rebuild
;; TODO: move the directory of the nix files to a variable that can change
(defun nixos-rebuild-config ()
  "Rebuild the system nixos rebuild"
  (interactive)
  (pcase my-hostname
    ("mac"   (compile "darwin-rebuild switch --flake /Users/ethan/.config/nix-darwin" t))
    ("laptop" (let ((default-directory "/sudo::"))
                (compile "nixos-rebuild switch --flake /home/ethan/.config/nixos")))
    (_       (message "No compile command for this host: %s" my-hostname))))

(add-to-list 'display-buffer-alist
			 '("^*comp"
               (display-buffer-reuse-window display-buffer-below-selected)
               (window-height . 0.33)
               (window-parameters
                (no-delete-other-windows . t))))

(use-package nix-mode
  ;; :hook (nix-mode . lsp-deferred) ;; So that envrc can load
  :hook ((nix-mode . eglot-ensure))
  ;; :custom
  ;; (lsp-disabled-clients '((nix-mode . nix-nil))) ;; Disable nil so that nixd will be used as lsp-server
  :config
  (setq lsp-nix-nixd-server-path "nixd"
        lsp-nix-nixd-formatting-command [ "nixfmt" ]
        lsp-nix-nixd-nixpkgs-expr "import <nixpkgs> { }"
        lsp-nix-nixd-nixos-options-expr "(builtins.getFlake \"/home/ethan/.config/nixos\").nixosConfigurations.macbook-pro.options"
        lsp-nix-nixd-home-manager-options-expr "(builtins.getFlake \"home/ethan/.config/nixos\").nixosConfigurations.macbook-pro.options.home-manager.users.type.getSubOptions []")
  )

;;; nix.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
