;;; org.el ---   -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Ethan Moss

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

;;; Code :

;;;; Org Related functions -----------------------------------------------------

(defun org-latex-generate-previews-buffer ()
  "Generate the previews of all latex fragments in the buffer"
  (interactive)
  (org-latex-preview '(16)))

(defun my/reload-org-agenda-files ()
  "Reloads the agenda file list"
  (interactive)
  (setopt org-agenda-files (directory-files org-directory t "\\.org$"))
  (setopt org-agenda-files-and-study
          (append (directory-files org-directory t "\\.org$")
                  (directory-files-recursively "~/Documents/study" "\\.org$")
                  ;; (directory-files (concat org-directory "google/tasks") t "\\.org$")
                  ))
  (setopt org-agenda-files-all (directory-files-recursively "~/Documents" "\\.org$")))

(defun my/load-minor-modes-for-org ()
  "Loads all the minor modes for use with Org mode"
  (toggle-truncate-lines 0)
  (toggle-word-wrap 1)
  ;; Make word wrapping indent sensitive
  (if (fboundp 'adaptive-wrap-prefix-mode)
      (adaptive-wrap-prefix-mode))
  ;; Maximium visual width
  (if (fboundp 'olivetti-mode)
      (olivetti-mode t))
  ;; Visability of emphasis and other markers. eg *bold* or /italics/.
  (if (fboundp 'org-appear-mode)
      (org-appear-mode t)))

(defun my/org-agenda-group-by-category ()
  "Insert project category headers dynamically into the agenda buffer."
  (save-excursion
    (goto-char (point-min))
    (when (search-forward "Project" nil t)
      (forward-line 1)
      (let ((inhibit-read-only t)
            (last-cat ""))
        (while (not (eobp))
          (let ((cat (get-text-property (point) 'org-category)))
            (when (and cat (not (string= cat last-cat)))
              (setq last-cat cat)
              (insert (propertize (format "\n  %s\n" (capitalize cat))
                                  'face '(:weight bold :inherit org-agenda-structure)))))
          (forward-line 1))))))

(defun my/org-agenda-indent-todos ()
  "Indent todos under categories based on their outline level.
Level 3 is the base level, each level after is indented further."
  (save-excursion
    (goto-char (point-min))
    (let ((inhibit-read-only t))
      (while (not (eobp))
        (let* ((target (or (get-text-property (point) 'org-marker)
                           (get-text-property (point) 'org-hd-marker)))
               (level (when target
                        (with-current-buffer (marker-buffer target)
                          (save-excursion
                            (goto-char target)
                            (org-outline-level))))))
          (when (and level (>= level 3))
            (let ((indent (make-string (+ 4 (* 2 (- level 3))) ?\s)))
              (beginning-of-line)
              (skip-chars-forward " ")
              (insert (delete-and-extract-region (line-beginning-position) (point))
                      indent))))
        (forward-line 1)))))

;; TODO: Make sure this is correct and runs as expected.
(defun my/org-mode-hook ()
  "My custom org-mode hook."
  (unless
      (and
       org-refile-targets
       (bound-and-true-p org-agenda-mode)
       org-agenda-files)
    ;; Your hooks here (e.g., enable specific modes, set variables, etc.)
    (message "Running my org-mode hooks.")
    (my/load-minor-modes-for-org)
    ))

(defun my/org-agenda-with-groups ()
  "Open org-agenda and all TODOs"
  (interactive)
  (org-agenda nil "n"))

(defun my/org-clean-tags ()
  "Visit last refiled headline and remove inherited tags from tag string.
Inspiration from:
https://www.reddit.com/r/orgmode/comments/ae2ak0/orgmode_clean_tag_string_on_refile/"
  (save-window-excursion
    (org-refile-goto-last-stored)
    (org-set-tags "")))

(defun my/org-agenda-skip-tags (tags)
  "Return T if any string in the list TAGS is in the headers tags.
Otherwise will return NIL"
  ;; (org-back-to-heading t)
  (and (not (null (cl-intersection tags (org-get-tags) :test 'string=)))
       (org-entry-end-position)))

(defun my/org-files-grep ()
  "Search the files in the Org directory to find what you need!"
  (interactive)
  (consult-grep org-directory))

(defvar my/org-selected-project nil
  "Temporarily holds the selected project name during capture.")

(defun my/org-get-project-headlines ()
  "Return a list of top-level project titles from projects.org."
  (with-current-buffer (find-file-noselect (expand-file-name "projects.org" org-directory))
    (org-element-map (org-element-parse-buffer 'headline) 'headline
      (lambda (hl)
        (when (= (org-element-property :level hl) 1)
          (org-element-property :raw-value hl))))))

(defun my/org-capture-select-project ()
  "Prompt user to select a project and store it."
  (let ((headlines (my/org-get-project-headlines)))
    (unless headlines
      (error "No projects found in projects.org"))
    (setq my/org-selected-project
          (completing-read "Select Project: " headlines nil t))))

(defun my/org-capture-project-target-heading (heading)
  "Position point at the end of HEADING under the selected project in projects.org."
  (let ((proj my/org-selected-project))
    (widen)
    (goto-char (point-min))
    (unless (re-search-forward (format "^\\* %s" (regexp-quote proj)) nil t)
      (error "Project %s not found in projects.org" proj))
    (org-narrow-to-subtree)
    (goto-char (point-min))
    (unless (re-search-forward (format "^\\*\\* %s" (regexp-quote heading)) nil t)
      (error "Heading %s not found under project %s" heading proj))
    (beginning-of-line)))

(defun my/org-capture-project-insert (heading)
  "Select a project and navigate to the specified HEADING under it."
  (my/org-capture-select-project)
  (my/org-capture-project-target-heading heading))

(defun my/org-capture-project-insert-notes ()
  "Select a project and navigate to its Notes heading for capture."
  (my/org-capture-project-insert "Notes"))

(defun my/org-capture-project-insert-todos ()
  "Select a project and navigate to its Todos heading for capture."
  (my/org-capture-project-insert "Todos"))

;;;; Use-package ---------------------------------------------------------------

(use-package s)

(use-package org
  :ensure nil
  :after s
  :hook ((org-mode . my/org-mode-hook)
         (org-agenda-mode  . hl-line-mode)
         ;; (org-agenda-finalize-hook . my/org-agenda-group-by-category)
         ;; (org-agenda-finalize-hook . my/org-agenda-indent-todos)
         )

  :bind (("C-c o a" . 'my/org-agenda-with-groups)
		 ("C-c o c" . 'org-capture)
         ("C-c o s" . 'my/org-files-grep)
         :map org-mode-map
         ("C-," . nil) ;; Conflicts with embark
         )
  :config
   ;;; -- GENERAL ORG SETUP --
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((python . t)
                                 (emacs-lisp . t)
								 ;; (gnuplot . t)
								 ;; (maxima . t)
								 (shell . t)
								 (C . t)))

  ;; Org Export
  (setopt org-odt-preferred-output-format "docx")  ; Make ODT export as docx


  ;; Colour the output of org babel bash results using the escape codes.
  (defun my/org-babel-ansi-color-filter ()
    "Apply ANSI colour codes to Org Babel output."
    (when (string-match-p "bash" (car (org-babel-get-src-block-info)))
      (ansi-color-apply-on-region (point-min) (point-max))))

  (add-hook 'org-babel-after-execute-hook 'my/org-babel-ansi-color-filter)

  ;; Org Visuals
  (setopt org-hide-emphasis-markers nil
          org-pretty-entities nil
          org-ellipsis " ⌄")

  ;; Org Feel
  (setopt org-src-fontify-natively t
	      org-src-tab-acts-natively t
          org-edit-src-content-indentation 2
          org-src-window-setup 'split-window-below)

  ;;;; -- Other Org settings
  ;; Scale latex to size based on the hostname
  (pcase my-hostname
    ("laptop" (progn (setopt org-format-latex-options
                             '( :foreground default
                                :background "Transparent"
                                :scale 1.8
                                :html-foreground "Black"
                                :html-background "Transparent"
                                :html-scale 1.0
                                :matchers '("begin" "$1" "$" "$$" "\\(" "\\[")))
                     (setopt org-preview-latex-default-process 'dvisvgm
                             org-latex-to-mathml-convert-command
                             "latexmlmath %i --presentationmathml=%o")))

    ;; Thinkpad Latex Setup
    ("thinkpad" (setopt org-format-latex-options '( :scale 1.2 )
                        org-preview-latex-default-process 'dvisvgm
                        org-latex-to-mathml-convert-command "latexmlmath %i --presentationmathml=%o"))

    ("mac" (progn (setopt org-format-latex-options
                          '( :foreground default
                             :background "Transparent"
                             :scale 1.4
                             :html-foreground "Black"
                             :html-background "Transparent"
                             :html-scale 1.0
                             :matchers '("begin" "$1" "$" "$$" "\\(" "\\[")))
                  (setopt org-preview-latex-default-process 'dvisvgm)
                  (setopt org-latex-to-mathml-convert-command
                          "latexmlmath %i --presentationmathml=%o")))

    ("linux" (setopt org-format-latex-options '( :scale 0.5 )
                     org-preview-latex-default-process 'dvisvgm
                     org-latex-to-mathml-convert-command
                     "latexmlmath %i --presentationmathml=%o"))
    (_ (plist-put org-format-latex-options :scale 1.0)))

  ;; ;; TODO: Automatically setup the org folder if it is not present?
  ;; (dolist (docs '("~/Documents" "~/Documents"))
  ;;   (when (f-directory-p docs)
  ;;     (message docs))
  ;;   (let ((org-dir (expand-file-name "org" docs) t))
  ;;     (when (make-directory org-dir t)
  ;;       (message "Org Directory created: %s" org-dir))
  ;;     (setopt org-directory org-dir)))

  ;;; -- ORG AGENDA CONFIGURATION --
  (setopt org-directory "~/Documents/org/"
          org-default-notes-file (concat org-directory "notes.org")
          org-agenda-files (directory-files org-directory t "\\.org$")
          org-agenda-files-and-study (append
                                      (directory-files org-directory t "\\.org$")
                                      (directory-files-recursively "~/Documents/study" "\\.org$"))
          org-agenda-files-all (directory-files-recursively "~/Documents" "\\.org$")
          org-agenda-breadcrumbs-separator " ❯ "
          org-agenda-current-time-string "── now ─────────"
          org-agenda-time-grid '((daily today require-timed)
                                 (0800 1000 1200 1400 1600 1800 2000)
                                 "......" "────────────────")
          org-agenda-tags-column -100
          org-agenda-block-separator ?─
          org-agenda-compact-blocks t
          org-enforce-todo-dependencies t
          org-agenda-dim-blocked-tasks 'invisible
          org-agenda-show-future-repeats 'next
          org-agenda-include-diary nil
          org-agenda-span 10
          org-agenda-start-on-weekday nil
          org-agenda-window-setup 'only-window)

  ;; Agenda Habits
  (add-to-list 'org-modules 'org-habit t)
  (setopt org-habit-show-habits t)

  ;; Only show TODO’s that dont have a set date.
  ;; Once that date has come, show the TODO.
  (setopt org-agenda-tags-todo-honor-ignore-options t
          org-agenda-todo-ignore-scheduled 'future
          org-agenda-todo-ignore-deadlines 'all)

  ;; Setting up the agenda views
  (setopt org-agenda-custom-commands
          '(("n" "Dashboard"
             ((agenda "")

              (tags "LEVEL=1"
                    ((org-agenda-overriding-header "\n Inbox (Refile)\n")
                     (org-agenda-files '("inbox.org"))))

              (tags-todo "-someday-project/-TODO"
                         ((org-agenda-overriding-header "\n General Todos\n")
                          (org-agenda-skip-function
                           '(org-agenda-skip-entry-if 'scheduled 'deadline))))

              (tags "LEVEL>=2+project"
                    ((org-agenda-overriding-header "\n Projects\n")
                     (org-agenda-sorting-strategy '(category-keep))
                     (org-agenda-prefix-format "")
                     (org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'nottodo '("TODO" "NEXT")))))

              (tags "note"
                    ((org-agenda-overriding-header "\n Notes\n")
                     (org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'todo 'any)))))
             ((org-agenda-remove-tags t)))

            ("d" "Agenda (old)"
             ((agenda ""
                      ((org-agenda-remove-tags t)))
              (tags-todo "+new"
                         ((org-agenda-overriding-header "Inbox")
                          (org-agenda-prefix-format '((tags . " %i ")))
                          (org-agenda-remove-tags t)))
              (todo "NEXT"
                    ((org-agenda-overriding-header "\nNext Actions")
                     (org-agenda-block-separator nil)
                     (org-agenda-remove-tags t)
                     (org-agenda-skip-function
                      ;; Skip the heading if it has any of the tags
                      '(my/org-agenda-skip-tags '("new" "habit")))))
              (todo "TODO"
                    ((org-agenda-overriding-header "\nTODO Tasks")
                     (org-agenda-block-separator nil)
                     (org-agenda-remove-tags t)
                     (org-agenda-skip-function
                      ;; Skip the heading if it has any of the tags
                      '(my/org-agenda-skip-tags '("new" "habit"))))))
             ((org-agenda-files org-agenda-files-and-study)))

            ;; Default - show all org files in ‘~/Documents’ recursively.
            ("b"
             "Agenda - All Org Files"
             ((agenda "")
              (alltodo ""))
             ((org-agenda-files org-agenda-files-all)))))

  ;; Refiling options
  (setopt org-outline-path-complete-in-steps nil
          org-refile-use-outline-path 'file
          org-refile-targets '((org-agenda-files :maxlevel . 2)
                               ;; (org-agenda-files-all :maxlevel . 1)
                               ))

  ;; -- ORG CAPTURE CONFIGURATION --
  (setopt org-todo-keywords '("TODO(t)" "NEXT(n!/!)" "|" "DONE(d@)" "CANCELLED(c@)"))

  (setopt org-capture-templates
          `(("i" "Quick Task" entry
             (file "inbox.org")
             ,(s-join "\n"
                      '("* TODO %?"
                        ":PROPERTIES:"
                        ":FILE: [[%f]]"
                        ":LINK: %a"
                        ":END:"
                        "%U"))
             :immediate-finish t)

            ("n" "Quick Note" entry
             (file "notes.org")
             ,(s-join "\n"
                      '("* %? :note:"
                        ":PROPERTIES:"
                        ":FILE: [[%f]]"
                        ":LINK: %a"
                        ":END:"
                        "%U"
                        " %i"))
             :immediate-finish t)

            ("a" "Calendar Appointment" entry
             (file "calendar.org")
             ,(s-join "\n"
                      '("* %?"
                        "SCHEDULED: %^T"
                        ":PROPERTIES:"
                        ":END:"
                        "%U"
                        "Context: %i")))

            ("t" "Detailed Task" entry
             (file "todo.org")
             ,(s-join "\n"
                      '("* TODO %?"
                        "SCHEDULED: %^t"
                        ":PROPERTIES:"
                        ":EFFORT: %^{Effort (mins)|15|30|60}"
                        ":FILE: [[%f]]"
                        ":LINK: %a"
                        ":END:"
                        "%U"
                        "%i"
                        "%a")))

            ("p" "Project Management Submenu")

            ("pp" "New Project" plain
             (file "projects.org")
             ,(s-join "\n"
                      '("* %^{Project Name}"
                        ":PROPERTIES:"
                        ":CATEGORY: %^{Category/Slug}"
                        ":ORDERED:  t"
                        ":END:"
                        "%U"
                        "%^{Description}"
                        "** Notes"
                        "** Todos [%]"))
             :empty-lines 1)

            ("pt" "Project Task" entry
             (file+function "projects.org" my/org-capture-project-insert-todos)
             ,(s-join "\n"
                      '("* TODO %?"
                        "%U"
                        "%a"
                        "%i"))
             :empty-lines 1)

            ("pn" "Project Note" entry
             (file+function "projects.org" my/org-capture-project-insert-notes)
             ,(s-join "\n"
                      '("* %? :note:"
                        ":PROPERTIES:"
                        ":FILE: [[%f]]"
                        ":LINK: %a"
                        ":END:"
                        "%U"
                        "%i"))
             :empty-lines 1)

            ("s" "Someday / Maybe Idea" entry
             (file "someday.org")
             ,(s-join "\n"
                      '("* %?"
                        ":PROPERTIES:"
                        ":CREATED:  %U"
                        ":FILE: [[%f]]"
                        ":LINK: %a"
                        ":END:"
                        "%U"
                        "%i")))

            ("j" "Journal Entry" entry
             (file+olp+datetree
              ,(format-time-string "journal/%Y_journal.org" (current-time)))
             "* %?\n%U")

            ;; This is for Org-protocol. It allows for taking the links and
            ;; highlighted text and putting it into my inbox notes.
            ("w" "Web site" entry
             (file+headline "inbox.org" "notes")
             ,(s-join "\n" '("* LINK %?"
                             ":PROPERTIES:"
                             ":LINK: %a"
                             ":END:"
                             "%U"
                             "%:initial")))))

  ;;; -- ORG REFERENCING ---
  (setopt org-cite-global-bibliography (list (expand-file-name
                                              "ref/references.bib"
                                              org-directory)))

  ;;; -- ORG UI AND DISPLAY CONFIGURATION --
  ;; Set up org buffer views:
  (add-to-list 'display-buffer-alist
               ;; If the buffer is one of the following; (case insensitive)
               ;; *Org Note*
               ;; *Org Select*
               ;; CAPTURE-...
               '("^\\(*org \\(note\\|select\\)\\*\\|capture\\)"
                 (display-buffer-in-side-window)
                 (side . bottom)
                 (slot . 0)
                 (window-height . 0.33)
                 (window-parameters
                  (no-delete-other-windows . t))))

  ;; Follow links in the same window, not the other window.
  (setf (cdr (assoc 'file org-link-frame-setup)) 'find-file)

  ;; show just the subtree I’m interested in, lowers visual clutter.
  (advice-add 'org-agenda-goto :after
              (lambda (&rest args)
                (org-narrow-to-subtree))))

;;; org.el ends here
