;;; org-gtasks.el --- Sync Google Task               -*- lexical-binding: t; -*-

;; Copyright (C) 2026

;; Author:  <ethan@macbook-pro>
;; Keywords: lisp

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

;;; Commentary:

;; For more informatin see the repo;
;; https://git.sr.ht/~jmasson/org-gtasks

;; The setup for this package will be in secrets.el

;;; Code:
(use-package deferred)
(use-package request-deferred)

(use-package org-gtasks
  :after (deferred request-deferred)
  ;; :hook (elpaca-after-init . 'my/org-gtasks/setup)
  :ensure ( :repo "https://git.sr.ht/~jmasson/org-gtasks"
            :files (:defaults "*.el"))
  :config
  ;; Set up the account

  (org-gtasks-register-account :name "my-account"
                               :directory "/home/ethan/Documents/org/google/tasks/"
                               :login "cywinskimoss@gmail.com"
                               ;; TODO: Replace the following with auth source?
                               :client-id (my/org-gtask/get-password "client-id")
                               :client-secret (my/org-gtask/get-password "client-secret"))
  :init
  (defun my/org-gtasks/setup ()
    "Pull the gtasks after emacs init"
    (org-gtasks-pull (org-gtasks-find-account-by-name "my-account") 'ALL))

  (defun my/org-gtask/get-password (user)
    "Get the client id or password from the authsource"
    (let* ((login (nth 0 (auth-source-search
                          :host "gtask-client"
                          :user user
                          :require '(:secret) :secret)))
           (password (auth-info-password login)))
      password)))

;;; org-gtasks.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
