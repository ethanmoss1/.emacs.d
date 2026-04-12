;;; dockerfile.el --- syntax and extras for dockerfiles  -*- lexical-binding: t; -*-

;; Copyright (C) 2026  ethan

;; Author: ethan <ethan@thinkpad>
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

;;; Commentary:
;; dockerfile-mode
;; ===============
;; Known to work with Emacs 24 and later
;;
;; If you just want to use it, you can get it via MELPA.
;;
;; A Dockerfile mode for emacs
;;
;; ``` emacs-lisp
;; (add-to-list 'load-path "/your/path/to/dockerfile-mode/")
;; (require 'dockerfile-mode)
;; ```
;;
;; Adds syntax highlighting as well as the ability to build the image
;; directly using `C-c C-b` from the buffer (`C-c M-b` to bypass docker build cache).
;;
;; You can specify the image name in the file itself by adding a line like this
;; at the top of your Dockerfile.
;;
;; ``` emacs-lisp
;; ## -*- dockerfile-image-name: "your-image-name-here" -*-
;; ```
;;
;; If you don't, you'll be prompted for an image name each time you build.
;; You may want to add the following to your emacs config:
;;
;; ``` emacs-lisp
;; (put 'dockerfile-image-name 'safe-local-variable #'stringp)
;; ```
;;
;; You can change the binary to use with
;; ```emacs-lisp
;; (setq dockerfile-mode-command "docker")
;; ```

;;; Code:

(use-package dockerfile-mode)

;;; dockerfile.el ends here
