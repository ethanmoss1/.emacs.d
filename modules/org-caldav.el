;;; org-caldav.el --- Sync of Calendars between devices using a server to do so.  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: caldav calendar sync org agenda

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
;; Sync of Calendars between devices using a server to do so.

;;; Code:

(use-package org-caldav
  :if (string-equal my-hostname "laptop")
  :config
  (setq org-caldav-url "http://192.168.0.226/dav.php/calendars/ethan"
		org-caldav-calendar-id "emacs_calendar"
		org-caldav-inbox (concat org-directory "calendar/imported_events.org")
		org-caldav-files org-agenda-files
		org-icalendar-timezone "Europe/London"
		;; We get an error when using ‘org-caldav-sync’ when we encounter urls.
		org-export-with-broken-links t))

;;; org-caldav.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
