;;; frame.el ---   -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords:

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
(use-package frame
  :ensure nil
  :config
  ;; Frame
  (setq frame-resize-pixelwise t)


  ;; Cursor
  ;; The blinking cursor is distracting and interferes with cursor settings in
  ;; some minor modes that try to change it buffer-locally (e.g., Treemacs).
  ;; Additionally, it can cause freezing, especially on macOS, for users with
  ;; customized and colored cursors.
  (setq blink-cursor-delay 0.3
        blink-cursor-blinks 0
        blink-cursor-interval 0.3
        ;; Reduce rendering/line scan work by not rendering cursors or regions in
        ;; non-focused windows.
        cursor-in-non-selected-windows t ;; default t,
        highlight-nonselected-windows nil)
  (add-hook 'elpaca-after-init-hook 'blink-cursor-mode)


  ;; Don't stretch the cursor to fit wide characters, it is disorienting,
  ;; especially for tabs.
  (setq x-stretch-cursor nil)


  ;; Display line number
  (setopt display-line-numbers-widen t
          display-line-numbers-width 4)
  ;;      display-line-numbers-type 'relative)


  ;; mule
  (setq truncate-string-ellipsis "…")

  ;;; Indent and formatting
  (setq-default left-fringe-width  8)
  (setq-default right-fringe-width 8)

  ;; Do not show an arrow at the top/bottomin the fringe and empty lines
  (setq-default indicate-buffer-boundaries nil)
  (setq-default indicate-empty-lines nil)

  ;; Continue wrapped lines at whitespace rather than breaking in the
  ;; middle of a word.
  (setq-default word-wrap t)

  ;; Disable wrapping by default due to its performance cost.
  (setq-default truncate-lines t)

  ;; If enabled and `truncate-lines' is disabled, soft wrapping will not occur
  ;; when the window is narrower than `truncate-partial-width-windows'
  ;; characters.
  (setq truncate-partial-width-windows nil)

  ;; Prefer spaces over tabs. Spaces offer a more consistent default compared to
  ;; 8-space tabs. This setting can be adjusted on a per-mode basis as needed.
  (setq-default indent-tabs-mode nil
				tab-width 4)

  ;; Enable indentation and completion using the TAB key
  (setq-default tab-always-indent nil)

  ;; Enable multi-line commenting which ensures that `comment-indent-new-line'
  ;; properly continues comments onto new lines, which is useful for writing
  ;; longer comments or docstrings that span multiple lines.
  (setq comment-multi-line t)

  ;; We often split terminals and editor windows or place them side-by-side,
  ;; making use of the additional horizontal space.
  (setq-default fill-column 80)

  ;; Disable the obsolete practice of end-of-line spacing from the
  ;; typewriter era.
  (setq sentence-end-double-space nil)

  ;; According to the POSIX, a line is defined as "a sequence of zero or
  ;; more non-newline characters followed by a terminating newline".
  (setq require-final-newline t)

  ;; Remove duplicates from the kill ring to reduce clutter
  (setq kill-do-not-save-duplicates t)

  ;; Ensures that empty lines within the commented region are also commented
  ;; out. This prevents unintended visual gaps and maintains a consistent
  ;; appearance, ensuring that comments apply uniformly to all lines, including
  ;; those that are otherwise empty.
  (setq comment-empty-lines t)

  ;; Eliminate delay before highlighting search matches
  (setq lazy-highlight-initial-delay 0))

;;; frame.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
