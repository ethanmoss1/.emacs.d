
;;; keybindings.el --- Personal keybindings  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: keybindings shortcuts windowsplit

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
;; Personal keybindings

;; This is my opinionated keybindings for GNU Emacs. Some default behaviours are
;; different from the original.

;;; Code:

(defun my/move-beginning-of-line ()
  "Go to beginning of line or to first non-whitespace character
depending on current position of point

https://www.reddit.com/r/emacs/comments/1i1sv9u/comment/m7o54ko/"
  (interactive)
  (let ((pos (current-column)))
    (back-to-indentation)
    (if (and (<= pos (current-column)) (not (= pos 0)))
        (move-beginning-of-line 1))))

(defun my/setup-dashboard-tabs ()
  "macro? it sets up notmuch, elfeed and agenda quickly"
  (interactive)
  ;; close all windows and tabs for a clean slate
  (delete-other-windows)
  (tab-bar-mode 1)
  (tab-close-other)
  ;; open new tabs and programs
  (my/org-agenda-with-groups)
  (tab-new)
  (notmuch)
  (tab-new)
  (elfeed)
  (elfeed-update))

(defun split-window-below-and-focus (&optional arg)
  (interactive "P")
  (split-window-below)
  (redisplay)           ; for exwm bug
  (windmove-down)
  (if arg
      (consult-buffer)))

(defun split-window-right-and-focus (&optional arg)
  (interactive "P")
  (split-window-right)
  (redisplay)           ; for exwm bug
  (windmove-right)
  (if arg
      (consult-buffer)))

(when (string-equal my-hostname "laptop")
  ;; Set the default keyboard state
  (setq my/laptop-keyboard-enabled t)
  ;; The name of the internal keyboard;
  (setq my/laptop-keyboard-name "Apple Inc. Apple Internal Keyboard / Trackpad")
  ;; Get the ID of the internal keyboard
  (setq my/laptop-keyboard-id (string-to-number (shell-command-to-string (format "xinput list --id-only 'keyboard:%s'" my/laptop-keyboard-name))))

  ;; Toggle keyboard function
  (defun my/toggle-laptop-keyboard ()
    "Toggles the intergrated keyboard on my Macbook Pro"
    (interactive)
    (let ((kb-enable (if my/laptop-keyboard-enabled "disable" "enable")))
      (shell-command (format "xinput %s %s"
                             kb-enable
                             my/laptop-keyboard-id
                             ))
      (setq my/laptop-keyboard-enabled (not my/laptop-keyboard-enabled))
      (message "Internal Laptop keyboard: %s" kb-enable))))

;;; -- Follow link or symbol at point --
;; OBSOLETE BY EMBARK
;; (defun my/follow-at-point ()
;;   "Performs a context-aware action based on the text at point."
;;   (interactive)
;;   ;; Thing at point? symbol, list, sexp, defun, filename, existing-filename,
;;   ;; url, email, uuid, word, sentence, whitespace, line, number, face and page.
;;   ;; Get the current thing at point.
;;   (let* ((url (thing-at-point 'url t)) ; change to `when-let*’?
;;          (email (thing-at-point 'email t))
;;          (possible-file (thing-at-point 'filename t))
;;          (file (when (and (stringp possible-file)
;;                           (file-exists-p possible-file))
;;                  possible-file))
;;          (symbol (thing-at-point 'symbol t))
;;          )
;;     (cond
;;      ;; http://example.com
;;      (url (browse-url url))
;;      ;; info@somedomain.co.uk
;;      (email (notmuch-mua-mail email))
;;      ;; /home/ethan/todo.org or todo.org
;;      (file (find-file file))
;;      (symbol (xref-find-definitions symbol))
;;      (t (message "unknown ’thing’ at point.")))))

(defun my/indent-whole-buffer ()
  "Indent the entire buffer without affecting point or mark."
  (interactive)
  (save-excursion
    (save-restriction
      (indent-region (point-min) (point-max)))))

;; Unbind suspend
(global-unset-key (kbd "C-z"))

(use-package emacs
  :ensure nil
  :bind ( :map ctl-x-map
          ("k" . 'kill-current-buffer)   ; Kill buffer without asking which one
		  ("C-b" . 'ibuffer)
          ("2" . 'split-window-below-and-focus)
          ("3" . 'split-window-right-and-focus)
          ("TAB" . #'my/indent-whole-buffer) ; replaces `indent-rigidly’.
          ))

;;; keybindings.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
