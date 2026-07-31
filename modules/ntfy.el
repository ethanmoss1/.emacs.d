;;; ntfy.el --- Notification service in emacs        -*- lexical-binding: t; -*-

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

;;; Commentary:

;; Original ensure here;
;; :ensure ( :host github
;;           :repo "shombando/ntfy"
;;           :files (:defaults "*.el"))
;; This is from the original repo that I've pretty much completely rewrote;
;; https://github.com/shombando/ntfy

;; When developing use this;
;; :ensure ( :repo "/home/ethan/Projects/ntfy/"
;;           :files (defaults "*.el"))

;;; Code:

(use-package ntfy
  :ensure ( :host github
            :repo "ethanmoss1/ntfy"
            :files (:defaults "*.el"))
  :config
  (require 'ntfy-compilation)
  (setopt ntfy-server "https://ntfy.hmsrv.uk"
		  ntfy-topic "macbook"
		  ntfy-header "Notification from emacs"
          ntfy-priority 3
		  ntfy-tags '("purple_circle" "loudspeaker"))
  (ntfy-compilation t))

;; Test with: (ntfy-message "This is a test!")

;;; ntfy.el ends here


