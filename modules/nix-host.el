;;; nix-host.el --- Rebuild Nix-Host                 -*- lexical-binding: t; -*-

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

(use-package nix-host
  :ensure ( ;; :package "nix-host"
           :type git
           :protocol https
           ;; :ref nil
           ;; :depth 1
           :host "forgejo.hmsrv.uk"
           :repo "Ethan/nix-host")
  :config
  (setopt nix-hosts-config '(("thinkpad" . "sudo nixos-rebuild --flake /home/ethan/Documents/development/nixos#thinkpad switch")
                             ("strix" . "nixos-rebuild --flake /home/ethan/Documents/development/nixos#strix --target-host root@strix --build-host root@strix switch")
                             ("hp250g6" . "nixos-rebuild --flake /home/ethan/Documents/development/nixos#hp250g6 --target-host root@hp250g6 switch"))))

;;; nix-host.el ends here
