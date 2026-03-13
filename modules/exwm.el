;;; exwm.el ---   -*- lexical-binding: t; -*-

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

;;; Code :

;; -- Functions;
(defun my/laptop--pre-shutdown ()
  "Perform pre-shutdown/reboot procedures ensuring no/minimal loss of data."
  (bookmark-save)
  (save-some-buffers))

(defun my/laptop-shutdown ()
  "Shutdown the Laptop, saving and closing the necessary programs first."
  (interactive)
  (when (y-or-n-p "Shutdown Laptop?")
    (my/laptop--pre-shutdown)
    (shell-command "shutdown now")))

(defun my/laptop-reboot ()
  "Reboot the Laptop, saving and closing the necessary programs first."
  (interactive)
  (when (y-or-n-p "Reboot Laptop?")
    (my/laptop--pre-shutdown)
    (shell-command "reboot")))

(defun exwm-rename-buffer-class-name ()
  "Rename the EXWM buffers with the X11 Class name"
  (if (and (string-equal exwm-class-name "firefox")
           exwm-title)
	  (let* ((page-title (car (split-string exwm-title "\\ +[-—]\\ +")))
			 (new-buffer-name (concat "*" exwm-class-name " - " page-title "*")))
	    (exwm-workspace-rename-buffer new-buffer-name))
    (exwm-workspace-rename-buffer exwm-class-name)))

(defun exwm-workspace-swap-current (num)
  "Swap the current selected workspace with NUM"
  (let* ((to      (elt exwm-workspace--list num))
         (from    exwm-workspace--current)
         (posfrom (exwm-workspace--position from))
         (posto   num)
         (count (exwm-workspace--count)))
    (if (or (< posfrom 0) (< posto 0)
            (>= posfrom count) (>= posto count)
            (= posfrom posto))
        (user-error "Bad selection: from - %s, to - %s" (+ 1 posfrom) (+ 1 posto))
      (exwm-workspace-swap from to)
      (message "Swapped workspace %s to %s" (+ 1 posfrom) (+ 1 posto)))))

;; -- EXWM Configuration
(use-package exwm
  :if (string-equal my-hostname "laptop")
  :ensure nil  ;; supplied by NixOS
  :hook ((exwm-update-title . exwm-rename-buffer-class-name)
         (exwm-manage-finsh . exwm-layout-hide-mode-line)
         ;; (exwm-manage-finish . exwm-setup-local-simulation-keys)
         (elpaca-after-init . exwm-wm-mode))
  :bind ( :map desktop-environment-mode-map
		  ;; Move around the buffers and X apps
		  ("s-<left>" . windmove-left)
		  ("s-<right>" . windmove-right)
		  ("s-<up>" . windmove-up)
		  ("s-<down>" . windmove-down)
          ("s-<tab>" . app-launcher-run-app)

          ;; EXWM functions
		  ("s-r" . exwm-reset)

          ;; TODO: This is ugly...
          ("s-1" . (lambda () (interactive) (exwm-workspace-switch-create 0)))
          ("s-2" . (lambda () (interactive) (exwm-workspace-switch-create 1)))
          ("s-3" . (lambda () (interactive) (exwm-workspace-switch-create 2)))
          ("s-4" . (lambda () (interactive) (exwm-workspace-switch-create 3)))
          ("s-5" . (lambda () (interactive) (exwm-workspace-switch-create 4)))
          ("s-6" . (lambda () (interactive) (exwm-workspace-switch-create 5)))
          ("s-7" . (lambda () (interactive) (exwm-workspace-switch-create 6)))
          ("s-8" . (lambda () (interactive) (exwm-workspace-switch-create 7)))
          ("s-9" . (lambda () (interactive) (exwm-workspace-switch-create 8)))

          ("C-s-1" . (lambda () (interactive) (exwm-workspace-swap-current 0)))
          ("C-s-2" . (lambda () (interactive) (exwm-workspace-swap-current 1)))
          ("C-s-3" . (lambda () (interactive) (exwm-workspace-swap-current 2)))
          ("C-s-4" . (lambda () (interactive) (exwm-workspace-swap-current 3)))
          ("C-s-5" . (lambda () (interactive) (exwm-workspace-swap-current 4)))
          ("C-s-6" . (lambda () (interactive) (exwm-workspace-swap-current 5)))
          ("C-s-7" . (lambda () (interactive) (exwm-workspace-swap-current 6)))
          ("C-s-8" . (lambda () (interactive) (exwm-workspace-swap-current 7)))
          ("C-s-9" . (lambda () (interactive) (exwm-workspace-swap-current 8))))

  :config
  ;; Setup the keymap to allow for keybindings in EXWM and non-EXMW buffers
  ;; https://github.com/emacs-exwm/exwm/issues/40#issuecomment-2127601569
  (set-keymap-parent exwm-mode-map desktop-environment-mode-map)
  (desktop-environment-mode t)

  ;; Dont ask to replace, if I have another WM open its probably for a reason
  (setopt exwm-replace 'nil
          exwm-workspace-number 4)

  (setopt exwm-manage-configurations
          '(( (string-equal exwm-class-name "firefox")
              workspace 1 ;; 2 in polybar
              simulation-keys (;; movement
                               ([?\C-b] . [left])
                               ([?\M-b] . [C-left])
                               ([?\C-f] . [right])
                               ([?\M-f] . [C-right])
                               ([?\C-p] . [up])
                               ([?\C-n] . [down])
                               ([?\C-a] . [home])
                               ([?\C-e] . [end])
                               ([?\M-v] . [prior])
                               ([?\C-v] . [next])
                               ([?\C-d] . [delete])
                               ([?\M-<] . [C-home])  ; top?
                               ([?\M->] . [C-end])  ; bottom?


                               ;; Selection
                               ([?\C-\S-a] . [S-home])
                               ([?\C-\S-e] . [S-end])
                               ([?\M-\S-b] . [C-S-left])
                               ([?\M-\S-f] . [C-S-right])

                               ;; cut/paste/delete
                               ([?\C-w] . [?\C-x])
                               ([?\M-w] . [?\C-c])
                               ([?\C-y] . [?\C-v])
                               ([?\C-k] . [S-end C-x])

                               ;; search
                               ([?\C-s] . [?\C-f])

                               ;; save
                               ([C-x C-s] . [C-s])

                               ;; exit
                               ([?\C-g] . [escape])
                               ([?\C-q] . [?\C-w]))))))

(if (string-equal my-hostname "laptop") (elpaca-wait))

;;; exwm.el ends here -----------------------------------------------------
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
