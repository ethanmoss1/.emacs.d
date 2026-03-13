;;; ispell.el --- Spell checking  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

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

;;; Commentary:


;;; Code:
(use-package ispell
  :init
  (let ((file (expand-file-name "cache/wordlist" user-emacs-directory)))
    (unless (file-exists-p file)
      (write-region "wordlist" nil file)))

  :ensure nil
  :config
  (setopt ispell-program-name (executable-find "enchant-2")
          ispell-dictionary "en_GB"
          ;; ispell-alternate-dictionary (expand-file-name "cache/wordlist" user-emacs-directory)
          ispell-alternate-dictionary 'nil
          ispell-local-dictionary 'nil))

;;; ispell.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
