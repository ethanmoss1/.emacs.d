;;; sitesearch.el --- Browse and search with your favorite browser  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
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

(use-package sitesearch
  :ensure (:repo "~/documents/dev/elisp/sitesearch")
  :config
  (setq sitesearch-browser      "firefox"
		sitesearch-browser-args "--new-window"
		sitesearch-bookmarks    '(("google" :url "https://google.com/"))
		sitesearch-search       '(("google" :url "https://google.com/search?q=%s"))))

;;; sitesearch.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
