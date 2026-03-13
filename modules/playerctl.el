;;; playerctl.el --- control music through Emacs     -*- lexical-binding: t; -*-

;; Copyright (C) 2026

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

(use-package playerctl
  :if (string-equal my-hostname "laptop")
  :bind ( :map desktop-environment-mode-map
          ("<XF86AudioNext>" . 'playerctl-next-song)
          ("<XF86AudioPrev>" . 'playerctl-previous-song)
          ("<XF86AudioStop>" . 'playerctl-stop-song)
          ("<XF86AudioPlay>" . 'playerctl-play-pause-song)))

;;; playerctl.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
