;;; project.el --- Built-in project management       -*- lexical-binding: t; -*-

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

;; Non-VC-project marked was done with the help from the follow blogpost
;; https://christiantietze.de/posts/2022/03/mark-local-project.el-directories/
;; Thanks!

;;; Code:

(use-package project
  :ensure nil
  :config
  (defgroup project-local nil
    "Local, non-VC-backed project.el root directories."
    :group 'project)

  (defcustom project-local-identifier ".project"
    "You can specify a single filename or a list of names."
    :type '(choice (string :tag "Single file")
                   (repeat (string :tag "Filename")))
    :group 'project-local)

  (cl-defmethod project-root ((project (head local)))
    "Return root directory of current PROJECT."
    (cdr project))

  (defun project-local-try-local (dir)
    "Determine if DIR is a non-VC project.
  DIR must include a file with the name determined by the
  variable `project-local-identifier' to be considered a project."
    (if-let ((root (if (listp project-local-identifier)
                       (seq-some (lambda (n)
                                   (locate-dominating-file dir n))
                                 project-local-identifier)
                     (locate-dominating-file dir project-local-identifier))))
        (cons 'local root)))

  (setopt project-find-functions '(project-try-vc project-local-try-local)))

;;; project.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
