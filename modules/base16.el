;;; base16.el --- Base16 Theme                        -*- lexical-binding: t; -*-

;; Copyright (C) 2026  ethan

;; Author: ethan <ethan@thinkpad>
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

(use-package base16-theme
  :config
  ;; (setq base16-theme-distinct-fringe-background nil)

  ;; -- Gruvbox Material Dark Medium
  (defvar base16-gruvbox-material-dark-medium-theme-colors
    '( :base00 "#282828" ;; #282828
       :base01 "#3c3836" ;; #3c3836
       :base02 "#504945" ;; #504945
       :base03 "#665c54" ;; #665c54
       :base04 "#bdae93" ;; #bdae93
       :base05 "#d5c4a1" ;; #d5c4a1
       :base06 "#ebdbb2" ;; #ebdbb2
       :base07 "#fbf1c7" ;; #fbf1c7
       :base08 "#ea6962" ;; #ea6962
       :base09 "#e78a4e" ;; #e78a4e
       :base0A "#d8a657" ;; #d8a657
       :base0B "#a9b665" ;; #a9b665
       :base0C "#89b482" ;; #89b482
       :base0D "#7daea3" ;; #7daea3
       :base0E "#d3869b" ;; #d3869b
       :base0F "#d65d0e");; #d65d0e
    "All colors for Base16 Gruvbox Material Dark Medium are defined here.")

  ;; Define the theme
  (deftheme base16-gruvbox-material-dark-medium)
  (base16-theme-define 'base16-gruvbox-material-dark-medium base16-gruvbox-material-dark-medium-theme-colors)

  ;; -- Modus Vivendi Tinted
  (require 'base16-theme)
  (defvar base16-modus-vivendi-tinted-theme-colors
    '( :base00 "#18262F"
       :base01 "#222E38"
       :base02 "#586875"
       :base03 "#667581"
       :base04 "#85939E"
       :base05 "#A6AFB8"
       :base06 "#E8E9ED"
       :base07 "#F5F7FA"
       :base08 "#EF5253"
       :base09 "#E66B2B"
       :base0A "#E4B51C"
       :base0B "#7CC844"
       :base0C "#52CBB0"
       :base0D "#33B5E1"
       :base0E "#A363D5"
       :base0F "#D73C9A")
    "All colors for Base16 0x96f are defined here.")
  (deftheme base16-modus-vivendi-tinted)
  (base16-theme-define 'base16-modus-vivendi-tinted base16-modus-vivendi-tinted-theme-colors)
  (provide-theme 'base16-modus-vivendi-tinted)

  ;;
  (load-theme 'base16-modus-vivendi-tinted t))

;;; base16.el ends here



(require 'base16-theme)
(defvar base16-0x96f-theme-colors
  '(:base00 "#262427"
            :base01 "#3b393c"
            :base02 "#514f52"
            :base03 "#676567"
            :base04 "#7c7b7d"
            :base05 "#fcfcfc"
            :base06 "#eae9eb"
            :base07 "#fcfcfc"
            :base08 "#ff7272"
            :base09 "#fc9d6f"
            :base0A "#ffca58"
            :base0B "#bcdf59"
            :base0C "#aee8f4"
            :base0D "#49cae4"
            :base0E "#a093e2"
            :base0F "#ff8787")
  "All colors for Base16 0x96f are defined here.")
(deftheme base16-0x96f)
(base16-theme-define 'base16-0x96f base16-0x96f-theme-colors)
(provide-theme 'base16-0x96f)
