;;; window.el --- Lisp Window commands   -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: internal emacs builtin

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
;; Lisp Window commands

;; Modifying Window function that aren't written in C.

;;; Code:
(use-package window
  :ensure nil
  :config
  (setopt window-divider-default-places t
	      window-divider-default-right-width 2
	      window-divider-default-bottom-width 2)

  ;; modified from pdf-tools/lisp/pdf-util.el
  (defun display-buffer-pop-up-window-below (buffer alist)
    "Display BUFFER by popping up a new window below current."
    (let ((window (selected-window))
          (height (cdr (assq 'window-height alist)))
          newwin)

      (when height
        (when (floatp height)
          (setq height (round (* height (frame-height)))))
        (setq height (- (max height window-min-height))))
      (setq newwin (window--display-buffer
                    buf
                    (split-window-below height)
                    'window alist))
      newwin)))

;;; window.el ends here
