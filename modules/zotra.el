;;; zotra.el --- Fetch BibTeX info with Zotero Translators  -*- lexical-binding: t; -*-

;; Copyright (C) 2025  Ethan Moss

;; Author: Ethan Moss <ethan@Ethans-MacBook-Pro.local>
;; Keywords: tex, bib, lisp

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

;; For this to work correctly (with the zotra server backend) several steps are
;; needed. The first is to install the zotra-server

;; Translation server and wrapper;
;; https://github.com/mpedramfar/zotra-server
;; This requires nodejs
;; NOTE: Dont forget submodules! ’--recursive-submodules’

;; Once installed run npm install, and npm start to check it works.
;; edit the zotra-local-server-directory variable to the location of the

;; Ive also created a nix flake now, this is on my own github;
;; https://github.com/ethanmoss1/zotra-server
;;; Code:

(use-package zotra
  :ensure ( :host github
            :repo "ethanmoss1/zotra"
            :files (defaults "*.el"))
  :preface
  (defun zotra-download-attachment-for-current-entry ()
    "Automatically download attachment after adding a bibtex entry.
When the point is at a bibtex entry, the following function downloads the
attachment for it and adds the filename to a bibtex field named ’File'."
    (interactive)
    (save-excursion
      (bibtex-beginning-of-entry)
      (let* ((entry (bibtex-parse-entry t))
             (key (cdr (assoc "=key=" entry)))
             (url (cdr (assoc "url" entry)))
             (filename (concat key ".pdf"))
             (filename (when entry
                         (zotra-download-attachment
                          url nil filename))))
        (when filename
          (bibtex-make-field (list "File" nil filename) t)))))

  (defun zotra-add-entry-and-download-attachment (&optional url)
    "Download any PDF or attached files to storage when adding a reference"
    (interactive)
    (let ((zotra-after-get-bibtex-entry-hook
           (append zotra-after-get-bibtex-entry-hook
                   '(zotra-download-attachment-for-current-entry))))
      (zotra-add-entry url)))

  :config
  ;; Setup local translation server
  (pcase my-hostname
    ("mac" (setopt zotra-local-server-directory "/Users/ethan/Documents/src/zotra-server"
                   zotra-backend 'zotra-server))
    ("laptop" (setopt zotra-backend 'zotra-server
                     zotra-local-server-directory "nodir"
                     zotra-local-server-cmd "zotra"))
    (_ (message "Unknown host. Failed setting up zotra.")))

  ;; Other Settings
  (setopt zotra-download-attachment-default-directory (concat org-directory
                                                              "ref/attachments"))
  (setopt zotra-default-bibliography (concat org-directory "ref/references.bib"))
  (setopt zotra-use-curl 't))

;;; zotra.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
