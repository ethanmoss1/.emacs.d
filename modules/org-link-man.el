;;; org-man.el --- Add the ability to link to man pages  -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <ethan@nixos>
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

;; This code is from the org-mode manual.
;; https://orgmode.org/manual/Adding-Hyperlink-Types.html

;;; Code:

(use-package emacs
  :ensure nil
  :after (org)
  :config
  (org-link-set-parameters "man"
                           :follow #'org-man-open
                           :export #'org-man-export
                           :store #'org-man-store-link)

  (defcustom org-man-command 'man
    "The Emacs command to be used to display a man page."
    :group 'org-link
    :type '(choice (const man) (const woman)))

  (defun org-man-open (path _)
    "Visit the manpage on PATH.
PATH should be a topic that can be thrown at the man command."
    (funcall org-man-command path))

  (defun org-man-store-link (&optional _interactive?)
    "Store a link to a man page."
    (when (memq major-mode '(Man-mode woman-mode))
      ;; This is a man page, we do make this link.
      (let* ((page (org-man-get-page-name))
             (link (concat "man:" page))
             (description (format "Man page for %s" page)))
	    (org-link-store-props
	     :type "man"
	     :link link
	     :description description))))

  (defun org-man-get-page-name ()
    "Extract the page name from the buffer name."
    ;; This works for both `Man-mode' and `woman-mode'.
    (if (string-match " \\(\\S-+\\)\\*" (buffer-name))
	    (match-string 1 (buffer-name))
      (error "Cannot create link to this man page")))

  (defun org-man-export (link description format)
    "Export a man page link from Org files."
    (let ((path (format "http://man.he.net/?topic=%s&section=all" link))
          (desc (or description link)))
      (message "%s" format)
      (pcase format
	    (`html (format "<a target=\"_blank\" href=\"%s\">%s</a>" path desc))
	    (`latex (format "\\href{%s}{%s}" path desc))
	    (`texinfo (format "@uref{%s,%s}" path desc))
	    (`ascii (format "%s (%s)" desc path))
	    (_ path))))

  (add-to-list 'display-buffer-alist
               ;; *Man test*
               '("^\\*[Mm]an [a-z0-9]+\\*$"
                 (display-buffer-reuse-window display-buffer-at-bottom)
                 (window-height . 0.70) ;; take 2/3 on bottom left
                 (window-parameters
                  (no-delete-other-windows . nil)))))

;;; org-man.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
