;;; cape.el --- Completion At Point Extensions       -*- lexical-binding: t; -*-

;; Copyright (C) 2025

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

;;; Commentary:

;; Available Capfs;
;; - ‘cape-abbrev’: Complete abbreviation (add-global-abbrev, add-mode-abbrev).
;; - ‘cape-dabbrev’: Complete word from current buffers. See also dabbrev-capf on Emacs 29.
;; - ‘cape-dict’: Complete word from dictionary file.
;; - ‘cape-elisp-block’: Complete Elisp in Org or Markdown code block.
;; - ‘cape-elisp-symbol’: Complete Elisp symbol.
;; - ‘cape-emoji’: Complete Emoji. Available on Emacs 29 and newer.
;; - ‘cape-file’: Complete file name.
;; - ‘cape-history’: Complete from Eshell, Comint or minibuffer history.
;; - ‘cape-keyword’: Complete programming language keyword.
;; - ‘cape-line’: Complete entire line from current buffer.
;; - ‘cape-rfc1345’: Complete Unicode char using RFC 1345 mnemonics.
;; - ‘cape-sgml’: Complete Unicode char from SGML entity, e.g., &alpha.
;; - ‘cape-tex’: Complete Unicode char from TeX command, e.g. \hbar.

;; See the following for more information.
;; https://github.com/minad/cape

;;; Code:

(use-package cape
  :config
  (setopt text-mode-ispell-word-completion 'nil)
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  ;; see above commentary for more available Capfs
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-history))


;;; cape.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
