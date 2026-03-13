;;; corfu.el ---   -*- lexical-binding: t; -*-

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
(use-package corfu
  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :hook (elpaca-after-init . global-corfu-mode)
  :config
  (require 'corfu-popupinfo)

  (setopt corfu-popupinfo-delay '(0.5 . 0.5)
          corfu-min-width 20)
  (corfu-popupinfo-mode t)

  ;; (require 'org-TBLFM-regexp)
  (setopt corfu-cycle t                ;; Enable cycling for `corfu-next/previous'
          corfu-auto t                 ;; Enable auto completion
          corfu-separator ?\s          ;; Orderless field separator
          corfu-quit-at-boundary nil   ;; Never quit at completion boundary
          corfu-quit-no-match t
          corfu-preview-current nil    ;; Disable current candidate preview
          corfu-preselect 'prompt      ;; Preselect the prompt
          corfu-on-exact-match nil     ;; Configure handling of exact matches
          corfu-scroll-margin 2))      ;; Use scroll margin

;; Additional package to make it work on terminal.
(use-package corfu-terminal
  :if (not (display-graphic-p))
  :after (corfu)
  :init (corfu-terminal-mode))

;; A few more useful configurations...
(use-package emacs
  :ensure nil
  :after (corfu)
  :init
  ;; TAB cycle if there are only few candidates
  (setopt completion-cycle-threshold nil)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  (setopt read-extended-command-predicate
          #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setopt tab-always-indent 'complete))

(use-package emacs
  :ensure nil
  :after (corfu exwm)
  :config
  (defun get-focused-monitor-geometry ()
    "Get the geometry of the monitor displaying the selected frame in EXWM."
    (let* ((monitor-attrs (frame-monitor-attributes))
           (workarea (assoc 'workarea monitor-attrs))
           (geometry (cdr workarea)))
      (list (nth 0 geometry) ; X
            (nth 1 geometry) ; Y
            (nth 2 geometry) ; Width
            (nth 3 geometry) ; Height
            )))

  (defun advise-corfu-make-frame-with-monitor-awareness (orig-fun frame x y width height)
    "Advise `corfu--make-frame` to be monitor-aware, adjusting X and Y according to the focused monitor."

    ;; Get the geometry of the currently focused monitor
    (let* ((monitor-geometry (get-focused-monitor-geometry))
           (monitor-x (nth 0 monitor-geometry))
           (monitor-y (nth 1 monitor-geometry))
           (selected-frame-position (frame-position))
           (selected-frame-x (car selected-frame-position))
           (selected-frame-y (cdr selected-frame-position))
           (new-x (+ monitor-x selected-frame-x x))
           (new-y (+ monitor-y selected-frame-y y)))

      ;; Call the original function with potentially adjusted coordinates
      (funcall orig-fun frame new-x new-y width height)))

  (advice-add 'corfu--make-frame :around #'advise-corfu-make-frame-with-monitor-awareness))

;;; corfu.el ends here ----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
