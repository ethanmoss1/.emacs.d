;;; moss-gnus.el --- Summary

;;; Commentary : ---------------------------------------------------------------

;;; Code : ---------------------------------------------------------------------
(use-package gnus
  :ensure nil
  ;; (:package "gnus"
  ;; ;; :depth 1
  ;; :inherit nil
  ;; :protocol https
  ;; :files (:defaults "lisp/gnus/*" (:exclude ".git"))
  ;; :repo "https://git.savannah.gnu.org/git/emacs.git")
  :init
  (setq user-full-name "Ethan Moss"
		user-mail-address "cywinskimoss@gmail.com"

		nnrss-directory (concat user-emacs-directory "rss/")

		gnus-select-method '(nntp "news.eternal-september.org")
		gnus-secondary-select-methods ;; Remember, no http or https
		'(;;(nnatom "learn2.open.ac.uk/blocks/news/feed.php?bi=304299")
		  ;;(nnatom "yummymelon.com/devnull/feeds/all.atom.xml")
		  (nnrss "https://xkcd.com/rss.xml")
		  (nnrss "https://emacs.org/rss/emacs.xml")
		  (nnrss "https://www.google.com/alerts/feeds/13595612812189678051/7036549150154760100")
		  (nnrss "https://www.google.com/alerts/feeds/13595612812189678051/7859550417961526637"))

		;; When we add another feed, allow subscribing to topics interactivly
		gnus-subscribe-newsgroup-method 'gnus-subscribe-interactively
		;; dont use the newsrc file, i only use gnus
		gnus-save-newsrc-file 'nil
		gnus-read-newsrc-file 'nil))

;; One thing to note, for some reason when adding devnull, it only works on
;; http. this may be an issue for the future. if that is the case modifying the
;; ‘nnatom--read-feed’ function on the line;
;;
;; (mm-url-insert-file-contents (concat "https://" feed)))
;;
;; replacing https with http will allow for adding the feed in this instance

;;
;;				  (nnrss-name "Emacs News"))

;;;; Welcome as a new user of news.eternal-september.org
;; You have successfully registered as a user of the news.eternal-september.org
;; Usenet news server.  As a registered user you may now access all newsgroups
;; and post articles to these groups.  Please configure your newsreader to
;; access
;;
;; news.eternal-september.org
;;
;; The port number is 119. This is the standard port number for news servers and
;; should be set as a default in your client. You also have to configure your
;; client to use the userid and password you will soon receive by email.  If you
;; are only able to select groups in the;
;;
;; eternal-september.* and posenet.*
;;
;; hierarchies, your news client has connected to the server without sending the
;; userid and password. Please refer to your newsreader's documentation for
;; information on how to configure server access with authentication or check
;; the FAQ In case of problems or questions don't hesitate to conatct
;; support@eternal-september.org.

;; Local Variables:
;; eval: (if config-module-managed-dotfiles (add-hook 'after-save-hook 'chezmoi-write nil t))
;; End:
