;;; host-configuration.el --- Setup host specific variables  -*- lexical-binding: t; -*-

;; Copyright (C) 2026  ethan

;; Author: ethan <ethan@thinkpad>
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

;;

;;; Code:
(defun directory-file (dir regex)
  "Return the absolute filename of the first match for REGEX in DIR."
  (car (directory-files dir t regex)))

(defvar user-home-directory
  (getenv "HOME")
  "Get the users home directory")

(defvar my-documents
  (directory-file user-home-directory "^[Dd]ocuments$")
  "Location of documents folder")

(defvar my-projects
  (directory-file user-home-directory "^[Pp]rojects$")
  "Location of projects folder, matched via regex.")

(defvar my-development
  (expand-file-name "development" my-documents)
  "Location of development folder")

;;; host-configuration.el ends here
