;;; gptel.el --- LLM chat for Emacs                  -*- lexical-binding: t; -*-

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


;; For more info visit the github page.
;; https://github.com/karthink/gptel

;;; Commentary:

;; Usage Available at;
;; https://aistudio.google.com/rate-limit

;;; Code:

(defun get-gemini-key ()
  "Retrieve the Gemini API key from auth-source.
Returns the secret string if found, otherwise returns nil and displays an error message."
  (let* ((results (auth-source-search :host "api.google.com"
                                      :user "gemini"
                                      :require '(:secret)))
         (entry (car results))
         (secret-data (and entry (plist-get entry :secret))))
    (cond
     ((functionp secret-data) (funcall secret-data))
     (secret-data secret-data)
     (t (message "Failed getting key for Gemini: Setup API key in Authinfo")
        nil))))

(use-package gptel
  :hook ((gptel-post-stream . gptel-auto-scroll)
         (gptel-post-response-functions . gptel-end-of-response))
  :config
  (setopt gptel-default-mode 'markdown-mode
          gptel-model 'gemini-3.5-flash-lite
          gptel-backend (gptel-make-gemini "Gemini"
                          :key (funcall 'get-gemini-key)
                          :stream t))
  ;; My Presets
  (gptel-make-preset 'notetaking-helper
    :description "A preset optimized for coding tasks"
    :backend "Gemini"                     ;gptel backend or backend name
    :model 'gemini-3.5-flash-lite
    :system "You are an expert technical editor and thought partner operating inside an Org-roam knowledge base via Emacs gptel. The current buffer is an atomic or semi-atomic node within an interconnected Zettelkasten-style network.

Your objective:
- Help refine, expand, rewrite, or critique this node based strictly on the user's instructions.

Constraints & Formatting:
- Write strictly in valid Org-mode syntax (use org headings, lists, source blocks, drawers, and inline formatting like *bold*, /italic/, and ~code~).
- Preserve existing Org frontmatter (`#+title:`, `#+date:`, `#+filetags:`, properties drawers, and `:PROPERTIES:` IDs).
- Format internal links using Org-roam conventions: `[[id:uuid][Label]]` or `[[file:filename.org][Label]]`. If suggesting new conceptual links to related topics, flag them clearly as candidates for standalone nodes rather than cluttering this node.
- Maintain high information density: do not dumb down or simplify technical concepts. Be direct, precise, and rigorous.
- Never output conversational preamble, greetings, or meta-announcements (e.g., avoid \"Here is the rewritten text:\"). Output only the requested deliverable or concise technical critique."
    ;; :tools '("read_buffer" "modify_buffer")
    ))

(use-package gptel-agent
  :ensure t
  :config (gptel-agent-update))


;; Display buffer alist
;; (add-to-list 'display-buffer-alist
;;              '("\\*gemini\\*"
;;                (display-buffer-in-side-window)
;;                (side . bottom)
;;                (slot . -1) ;; -1 == L  0 == Mid 1 == R
;;                (window-height . 0.33) ;; take 2/3 on bottom left
;;                (window-parameters
;;                 (no-delete-other-windows . nil))))


;;; gptel.el ends here
