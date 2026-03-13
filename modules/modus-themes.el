;;; modus-themes.el ---   -*- lexical-binding: t; -*-

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
(use-package modus-themes
  ;; :custom-face
  ;; (fringe ((t (:background "#000000"))))
  :bind (("<f8>" . 'modus-themes-toggle))
  :config
  (setopt modus-themes-disable-other-themes t
		  modus-themes-italic-constructs t
		  modus-themes-bold-constructs t
		  modus-themes-org-blocks 'tinted-background
          modus-themes-variable-pitch-ui nil
          )
  (setopt modus-themes-common-palette-overrides
          '(;; Make the `tab-bar-mode' mode subtle while keepings its
            ;; original grey aesthetic.
            (bg-tab-bar bg-main)
            (bg-tab-current bg-active)
            (bg-tab-other bg-dim)

            ;; Make the fringe invisible
            (fringe unspecified)))

  (load-theme 'modus-vivendi t))

;;; modus-themes.el ends here -------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
