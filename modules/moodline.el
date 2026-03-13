;;; moodline.el ---   -*- lexical-binding: t; -*-

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

;;; Commentary :

;;; Code :
(use-package mood-line
  :config
  ;; Glyph style
  (setopt mood-line-glyph-alist mood-line-glyphs-fira-code)

  ;; Setup settings
  (setopt mood-line-show-eol-style t
          mood-line-show-major-mode t
          mood-line-show-cursor-point t
          mood-line-show-indentation-style t
          mood-line-show-encoding-information t
          mood-line-segment-indentation-always-show-offset t)

  ;; Setup the style of the moodline
  (setopt mood-line-format '(;; Modified version of `mood-line-format-default-extended’
                             (;; Left aligned
                              " "
                              (or (mood-line-segment-buffer-status)
                                  (mood-line-segment-client)
                                  " ")
                              " "
                              (mood-line-segment-project)
                              " | "
                              (mood-line-segment-buffer-name)
                              "  "
                              (mood-line-segment-cursor-position)
                              "  "
                              (mood-line-segment-scroll))
                             (;; Right Aligned
                              (mood-line-segment-vc)
                              "  "
                              (mood-line-segment-major-mode)
                              "  "
                              (mood-line-segment-misc-info)
                              "  "
                              (mood-line-segment-checker)
                              "  "
                              (mood-line-segment-process)
                              " ")))

  (mood-line-mode t))

;;; moodline.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
