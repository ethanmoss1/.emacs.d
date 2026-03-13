;;; eat.el --- Better shell in emacs                -*- lexical-binding: t; -*-

;; Copyright (C) 2024

;; Author:  <ethan@nixos>
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

(use-package eat
  :bind ("C-c t" . eat)
  :config
  ;; Eat settings
  (setopt eat-kill-buffer-on-exit t
          eat-term-name "xterm"
          eat-tramp-shells '(("docker" . "/bin/sh")
                             ("ssh" . "/bin/bash")))  ; this is a temporary fix

  ;; One of the following;
  ;; For `eat-eshell-mode'.
  (add-hook 'eshell-load-hook #'eat-eshell-mode)
  (eat-eshell-mode))

;; Set up the popup shell
(add-to-list 'display-buffer-alist
             ;; *shell*  *eshell*  *eat*
             '("\\*\\(e?shell\\|eat\\)\\*"
               (display-buffer-in-side-window)
               (side . bottom)
               (slot . -1) ;; -1 == L  0 == Mid 1 == R
               (window-height . 0.33) ;; take 2/3 on bottom left
               (window-parameters
                (no-delete-other-windows . nil))))

;;; eat.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
