;;; org-export-icalendar.el --- Export settings for icalendar  -*- lexical-binding: t; -*-

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

;;; Code:

(eval-after-load 'org
  (if (string-equal my-hostname "laptop")
      (progn
        ;; Timer for creating ICS files for my calendar.
        (defvar my/org-generate-ics-files-date nil
          "Stores the date string (\"YYYY-MM-DD\") when the daily task was last run.
  This variable ensures the task only runs once per day.")

        (defun my/org-generate-ics-files (&optional files)
          "Generate the ICS files for my CalDAV server, sending them over.

  TODO: merge all the files into one ICS file so that i dont have to edit
   the files that need to be uploaded, synced and added to my calendar on my phone"
          (interactive)
          (let (;; stops warnings of ’Repeater-type restart not currently supported
                ;; by iCalendar export’ by only setting to emegency in this let
                ;; binding.
                (warning-minimum-level :emergency)
                (org-icalendar-combined-agenda-file "/ssh:caldav:/root/calendar/emacs-agenda.ics")
                ;; Remove running of hooks to speed things up.
                (org-mode-hook nil)
                (org-agenda-files (or files org-agenda-files-and-study))
                (org-icalendar-include-todo t))
            (apply #'org-icalendar--combine-files (org-agenda-files t))))

        ;; (my/org-generate-ics-files)
        (defun my/generate-ics-daily ()
          "A gatekeeper function called by the idle timer.
  It checks if `my-daily-task` has already run today. If not, it runs it."
          (let ((today-string (format-time-string "%Y-%m-%d")))
            (unless (string-equal my/org-generate-ics-files-date today-string)
              (message "Generating ICS files...")
              (my/org-generate-ics-files)
              (setq my/org-generate-ics-files-date today-string)
              (message "Generating ICS files...Done."))))

        (run-with-idle-timer (* 10 60) t #'my/generate-ics-daily))))

;;; org-export-icalendar.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
