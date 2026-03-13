;;; mouse.el --- Mouse support in Emacs  -*- lexical-binding: t;-*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: mouse X11

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
;; Mouse support in Emacs

;;

;;; Code:
(use-package mouse
  :ensure nil
  :config
  (setq mouse-yank-at-point t)

  ;; Emacs 29
  (when (and (display-graphic-p) (fboundp 'context-menu-mode))
    (add-hook 'elpaca-after-init-hook 'context-menu-mode))

  (setq hscroll-margin 2
		hscroll-step 1
		;; Emacs spends excessive time recentering the screen when the cursor
		;; moves more than N lines past the window edges (where N is the value of
		;; `scroll-conservatively`). This can be particularly slow in larger files
		;; during extensive scrolling. If `scroll-conservatively` is set above
		;; 100, the window is never automatically recentered. The default value of
		;; 0 triggers recentering too aggressively. Setting it to 10 reduces
		;; excessive recentering and only recenters the window when scrolling
		;; significantly off-screen.
		scroll-conservatively 10
		scroll-margin 0
		scroll-preserve-screen-position t
		;; Reduce cursor lag by preventing automatic adjustments to
		;; `window-vscroll' for unusually long lines. Setting
		;; `auto-window-vscroll' it to nil also resolves the issue of random
		;; half-screen jumps during scrolling.
		auto-window-vscroll nil
		;; Mouse
		mouse-wheel-scroll-amount '(1 ((shift) . hscroll))
		mouse-wheel-scroll-amount-horizontal 1
		mouse-wheel-progressive-speed t
        mouse-wheel-follow-mouse 't)

  ;; Scrolling
  ;; Enables faster scrolling through unfontified regions. This may result in
  ;; brief periods of inaccurate syntax highlighting immediately after scrolling,
  ;; which should quickly self-correct.
  (setq fast-but-imprecise-scrolling t)

  ;; Move point to top/bottom of buffer before signalling a scrolling
  ;; error.
  (setq scroll-error-top-bottom t)

  ;; Keeps screen position if the scroll command moved it vertically out
  ;; of the window.
  (setq scroll-preserve-screen-position t)

  ;; Mac only for now, set precision scrolling, this makes Emacs feel more
  ;; modern and makes is easier to see content as is scrolls.
  (if (string= my-hostname "mac")
      (pixel-scroll-precision-mode)))

;;; mouse.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
