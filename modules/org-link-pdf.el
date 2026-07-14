;;; org-link-pdf.el --- Link within a PDF            -*- lexical-binding: t; -*-

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

;; From the following;
;; https://old.reddit.com/r/emacs/comments/1t438si/fortnightly_tips_tricks_and_questions_20260505/ok0rbh7/

;;; Code:

(use-package emacs
  :ensure nil
  :after (org pdf-tools)
  :config
  ;; Register the "pdf:" link type with Org Mode
  (org-link-set-parameters "pdf"
                           :follow #'my/org-pdf-follow-link
                           :store #'my/org-pdf-store-link)

  (defun my/org-pdf-store-link ()
    "Store a link to a PDF selection with the full highlighted text in the description."
    (when (derived-mode-p 'pdf-view-mode)
      (let* ((file (buffer-file-name))
             (page (pdf-view-current-page))
             (active-region (pdf-view-active-region-p))
             (description (file-name-nondirectory file))
             link)

        (if active-region
            ;; 1. Create the annotation and get its ID
            (let* ((raw-text (mapconcat #'identity (pdf-view-active-region-text) " "))
                   ;; Clean the text: replace newlines/tabs/multiple spaces with a single space
                   (clean-text (replace-regexp-in-string "[ \t\n\r]+" " " raw-text))
                   (annot (pdf-annot-add-highlight-markup-annotation (pdf-view-active-region)))
                   (annot-id (pdf-annot-get-id annot)))

              ;; 2. Format link: pdf:path::page;;id
              (setq link (format "pdf:%s::%d;;%s" file page annot-id))
              ;; Use the full cleaned text for the description without truncation[cite: 2]
              (setq description (format "%s (p. %d): %s"
                                        description page
                                        clean-text)))

          ;; Fallback: Just link to the current page if no region is selected
          (setq link (format "pdf:%s::%d" file page))
          (setq description (format "%s (Page %d)" description page)))

        ;; 3. Register the link in Org's store[cite: 1, 2]
        (org-link-store-props
         :type "pdf"
         :link link
         :description description))))

  (defun my/org-pdf-follow-link (link)
    "Follow a PDF link created by my/org-pdf-store-link."
    (let* ((parts (split-string link "::"))
           (file (expand-file-name (car parts)))
           (rest (cadr parts))
           (has-annot (string-match ";;" rest))
           (page (string-to-number (if has-annot (substring rest 0 (match-beginning 0)) rest)))
           (annot-id (when has-annot (substring rest (match-end 0)))))

      ;; Open file and jump to page
      (find-file file)
      (pdf-view-goto-page page)

      ;; If an annotation ID exists, jump to it specifically
      (when annot-id
        (let ((annot (pdf-info-getannot annot-id)))
          (pdf-annot-show-annotation annot t))))))

;;; org-link-pdf.el ends here
