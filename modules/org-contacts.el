
;;; org-contacts.el --- Manage contacts in Org-mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Ethan Moss

;; Author: Ethan Moss <ethan@Ethans-MacBook-Pro.local>
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

;;; Code:

;; (defun my/get-capture-filename ()
;;   "Get the Contacts name and create a file with that name"
;;   (let* ((name (read-string "Full Name: "))
;;          (capitalized-name (mapcar #'capitalize (split-string name)))
;;          (hyphenated-string (mapconcat 'identity capitalized-name "_"))
;;          (time-string (format-time-string "%Y%m%d%H%M%S-"))
;;          (file-name (concat time-string hyphenated-string ".org")))
;;     (expand-file-name file-name org-contacts-directory)))

(use-package org-contacts
  :after org
  ;; Because of the UK Online Safety act, I have to use a mirror...
  :ensure ( :host github
            :repo "emacsmirror/org-contacts"
            :files (:defaults "*.el"))
  :config
  ;; (setq org-contacts-directory (concat org-directory "contacts/"))
  ;; (setopt org-contacts-directory (concat org-directory "roam"))
  ;; (setopt org-contacts-files (directory-files org-contacts-directory t "\\.org$")))
  (setopt org-contacts-files (list (concat org-roam-directory
                                           "20250903120720-contacts.org")))
  (add-to-list 'org-capture-templates `("c"
                                        "Contacts"
                                        entry
                                        (file ,(nth 0 org-contacts-files))
                                        ,(s-join "\n" '("* %(org-contacts-template-name)"
                                                        ":PROPERTIES:"
                                                        ":EMAIL: %(org-contacts-template-email)"
                                                        ":PHONE:"
                                                        ":ALIAS:"
                                                        ":NICKNAME:"
                                                        ":IGNORE:"
                                                        ":ICON:"
                                                        ":NOTE:"
                                                        ":ADDRESS:"
                                                        ":BIRTHDAY:"
                                                        ":END:"))
                                        :empty-lines 1)))

;;; org-contacts.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
