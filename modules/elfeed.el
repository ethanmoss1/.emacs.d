;;; elfeed.el --- RSS and ATOM feed manager and viewer  -*- lexical-binding: t; -*-

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

;;; Code:


;; Allow capturing of elfeed entry in org capture
;; https://yiming.dev/blog/2016/01/28/add-org-store-link-entry-for-elfeed/

(use-package elfeed
  :ensure ( :package "elfeed"
            ;; Inherited from elpaca-order-functions.
            :depth treeless
            :inherit t
            :protocol https
            ;; Inherited from elpaca-menu-item.
            :source "MELPA"
            :files (:defaults "README.md" "web/*")
            :fetcher github
            :repo "skeeto/elfeed")
  :config
  (setopt elfeed-sort-order 'ascending)  ;; Oldest first.
  (setopt elfeed-search-filter "+unread")

  (setopt elfeed-feeds
          '(("https://learn2.open.ac.uk/blocks/news/feed.php?bi=304299" uni news)
		    ("https://learn2.open.ac.uk/blocks/news/feed.php?bi=299153" uni news)
            ("https://learn2.open.ac.uk/blocks/news/feed.php?bi=311531" uni news)
            ("https://learn2.open.ac.uk/blocks/news/feed.php?bi=321500" uni news)
            ("https://learn2.open.ac.uk/blocks/news/feed.php?bi=321501" uni news)
            ("https://learn2.open.ac.uk/blocks/news/feed.php?bi=321489" uni news)
            ("https://learn2.open.ac.uk/blocks/news/feed.php?bi=321494" uni news)
		    ("yummymelon.com/devnull/feeds/all.atom.xml" emacs blog)
		    ("https://xkcd.com/rss.xml" humour cartoon)
		    ("https://www.google.com/alerts/feeds/13595612812189678051/7036549150154760100" news medical)
		    ("https://www.google.com/alerts/feeds/13595612812189678051/7859550417961526637" news medical)
            ("https://planet.emacslife.com/atom.xml" emacs news)
            ("https://themkat.net/feed/by_tag/emacs.xml" emacs news)
            ("https://arialdomartini.github.io/feed.xml" emacs blog)
            ("https://www.ncsc.gov.uk/api/1/services/v1/all-rss-feed.xml" cyber-security news)
            ("https://daryl.wakatara.com/posts/index.xml" emacs blog)
            ("https://www.jeffgeerling.com/blog.xml" blog linux dev)
            ("https://medium.com/feed/mitre-attack" cyber-security news)
            ("https://martinfowler.com/feed.atom" software blog)
            ("https://frame.work/gb/en/blog.rss" blog hardware news)
            ("https://www.tomscott.com/updates.xml" blog news)
            ("https://joshblais.com/index.xml" blog emacs)
            ("duncanbritt.com/feed.xml" blog emacs)
            ("https://tsawyer87.github.io//index.xml" nix blog))))

;; (use-package elfeed-goodies
;;   :after elfeed
;;   :init (elfeed-goodies/setup))

;;; elfeed.el ends here
;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
