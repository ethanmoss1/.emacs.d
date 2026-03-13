;;; init.el --- My Personalised Emacs Configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Ethan Moss

;; Author: Ethan Moss <cywinskimoss@gmail.com>
;; Keywords: init

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

;;;; Commentary:
;; My Personalised Emacs Configuration

;; Core initalisation for my modularised Emacs. Influenced by Jimeh's .Emacs.d
;; (EmacsSiren) which was inspired by Emacs Prelude. UI and overall design by
;; Nanoemacs with some tweaks.  Some other ideas from Jerrypnz and his Hydra
;; focused emacs.

;; Taking these inital starting points I developed a modulariased approach that
;; takes each package and puts them into modules, these modules arent just
;; external packages but configuration of built in packages as well as custom
;; modules that contain my own code for a specific function.

;;;; References and Inspiration:
;; Emacs Siren .............................. https://github.com/jimeh/.emacs.d
;; Emacs Prelude ........................... https://github.com/bbatsov/prelude
;; Emacs Nano ........................... https://github.com/rougier/nano-emacs
;; Jerrypnz hydra ........................ https://github.com/jerrypnz/.emacs.d

;;;; Code:
(defgroup config nil
  "test group"
  :group 'emacs)

(defconst my-devices
  '("macbook"
    "thinkpad"
    "tablet")
  "List of devices that I run Emacs on. This effects whether certain packages,
settings, variables, ect. are set or loaded")

;; Set up module loading and creation
(defconst config-module-emacs-dir (concat user-emacs-directory "modules/")
  "Directory where the modules are located")

(defun config-module--list-modules ()
  "returns the list of modules available to the user"
  (mapcar 'file-name-sans-extension (directory-files config-module-emacs-dir nil "\\.el")))

(defun config-module--get-option ()
  "Get the module that you want to load"
  (completing-read "Name of module to load: " (config-module--list-modules)))

(defun config-module--to-load (module)
  "Load the given MODULE"
  (load (concat config-module-emacs-dir module ".el") nil nil nil nil))

(defun config-module-load (&optional module)
  "load MODULE that contains a package/elisp for a particular
purpose and its configuration. If called interactively, select
MODULE to load from the list of available modules."
  (interactive)
  (condition-case err
      (if (called-interactively-p 'interactive)
	  (config-module--to-load (config-module--get-option))
	(if (not (eq module nil))
	    (config-module--to-load module)))
    (error
     (display-warning 'config
		      (format-message "Loading %s: %s"
				      (or (concat "module " module)
					  "interactive module")
				      (error-message-string err))
		      :warning))))

(defun config-module--populate-buffer (module-name buffer-name config-module-file)
  "Open a new BUFFER-NAME with the file location of CONFIG-MODULE-FILE
 and populate with auto-insert
Provide is removed as this is not a normal lisp file."
  (find-file config-module-file)
  (with-current-buffer buffer-name
    (auto-insert)
    (mark-marker)
    (replace-regexp "\n\n\(provide '.*\)" "")
    (insert (format "(use-package %s)\n" module-name))
    (goto-char (point-max))
    (insert ";; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:")
    (goto-char (mark-marker))
    (normal-mode)))

;; Don’t ask about inserting templates into new files, for the module new
;; function.
(setq auto-insert-query nil)  ; redundant as it is in the auto-insert module.

(defun config-module-new ()
  "Create a new module file in the modules directory that allows
loading of the module"
  (interactive)
  (let* ((config-module-name (read-string "Package Name: "))
	 (buffer-name (concat config-module-name ".el"))
	 (config-module-file (concat config-module-emacs-dir "/" buffer-name)))
    (if (file-exists-p config-module-file)
	(user-error "Module %s exists already" buffer-name)
      (config-module--populate-buffer config-module-name buffer-name config-module-file)))
  (message "Don’t forget to add the module to the ‘module-list.el’ file."))

;; Set up devices specific configuration
(let ((hostname-file (expand-file-name "hostname" user-emacs-directory)))
  (if (not (file-exists-p hostname-file))
      (with-temp-file hostname-file
        (insert (completing-read "Select Device: " my-devices))))
  (setq my-hostname (with-temp-buffer
                      (insert-file-contents hostname-file)
                      (buffer-string))))

(load-file (concat user-emacs-directory "modules-list.el"))

;; Customise file - for temporary customisations
(setq custom-file (expand-file-name "custom-file.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file t)
  (make-empty-file custom-file))

;; init.el ends here
