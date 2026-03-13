;;; webjump.el --- Programmable Web Hotlist          -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <ethan@nixos>
;; Keywords: lisp, comm, www

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

;;

;;; Code:

(defun webjump--annotation-function (name)
  "Add annotation functions to webjump"
  (let* ((desc (alist-get name minibuffer-completion-table nil nil #'string=)))
    (format "\t%s" (cond ((stringp desc) desc)
                           ((vectorp desc) (aref desc 1))
                           (t "")))))

(use-package webjump
  :ensure nil
  :bind ("C-c j" . webjump)
  :config
  (setq webjump-use-internal-browser nil
        webjump-sites '(("My Website" . "www.ethanmoss.uk")
                        ("Open Uni" . "Student")
                        ("Google Search" . [ simple-query "www.google.co.uk"
                                             "www.google.co.uk/search?q=" ""])
                        ("Emacs Wiki" . [ simple-query "www.emacswiki.org"
		                                  "www.emacswiki.org/cgi-bin/wiki/" ""])
                        ("DuckDuckGo" . [ simple-query "www.duckduckgo.com"
		                                  "www.duckduckgo.com/?q=" ""])
                        ("Gemini" . "gemini.google.com/")
                        ("Google Drive" . "drive.google.com")
                        ))
:init
(defun webjump ()
  "Jumps to a Web site from a programmable hotlist.

See the documentation for the `webjump-sites' variable for how to customize the
hotlist.

Please submit bug reports and other feedback to the author, Neil W. Van Dyke
<nwv@acm.org>."
  (interactive)
  (let* ((completion-extra-properties '(:annotation-function
                                        webjump--annotation-function))
	     (item (assoc-string
		        (completing-read "WebJump to site: " webjump-sites nil t)
		        webjump-sites t))
	     (name (car item))
	     (expr (cdr item)))

    (browse-url (webjump-url-fix
                 (cond ((not expr) "")
                       ((stringp expr) expr)
                       ((vectorp expr) (webjump-builtin expr name))
                       ((listp expr) (eval expr t))
                       ((symbolp expr)
                        (if (fboundp expr)
                            (funcall expr name)
                          (error "WebJump URL function \"%s\" undefined"
                                 expr)))
                       (t (error "WebJump URL expression for \"%s\" invalid"
                                 name))))))))

;;; webjump.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
