;;; org-link-rfc.el --- Org link extension for RFCs  -*- lexical-binding: t; -*-

;; Copyright (C) 2025

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

;; Using org links library, allow for easy adding of RFC’s that link to the
;; website

;; TODO: Move to a buffer version of the RFC, as they are only text.
;; TODO: error handling on the RFC number in the open command
;; TODO: do the export, store and any other parameters required for org links


;;; Code:
(use-package emacs
  :ensure nil
  :after org
  :config
  (org-link-set-parameters "rfc"
                           :follow #'org-rfc-open)

  ;; Functions for RFC links
  (defun org-rfc-open (rfc-num)
    "The RFC that we want to view"
    (browse-url (format "https://datatracker.ietf.org/doc/html/rfc%s"
                        rfc-num))))


;;; org-link-rfc.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
