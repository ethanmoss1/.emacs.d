;; Load modules
(mapcar
 'config-module-load
 '(;;;;;; ---- List of modules to load ----
   ;; -- Package manager --
   "elpaca"

   ;; -- Compulsory Modules --
   "vertico"
   "orderless"
   "marginalia"
   "consult"
   "embark"
   "helpful"

   ;; -- Inbuffer Completion --
   "corfu"
   "cape"

   ;; -- Themeing Modules --
   "modus-themes"
   "nerd-icons"
   "modeline"

   ;; -- Org Modules --
   "org"

   ; Agenda relatec
   "org-contrib"
   "org-protocol"
   "org-export-icalendar"
   "org-gtasks"

   ; Links
   "org-link-man"
   "org-link-rfc"

   ; Personal Knowledge Management
   "org-roam"
   "org-roam-timestamps"
   "org-contacts"

   ; Prettifying
   "org-fragtog"
   "org-appear"
   "adaptive-wrap"
   "olivetti"

   ; org tools
   "el-easydraw"

   ;; -- Bibliography related packages --
   ;; "citar"
   ;; "citar-org-roam"
   ;; "zotra"
   ;; "pdf-tools"

   ;; -- News and Email --
   ;; "elfeed"
   ;; "notmuch"
   ;; "ntfy"

   ;; -- Programming Modules --
   "eglot"

   "nix"
   "python"
   "c"

   "dockerfile" ; syntax for dockerfiles

   "rainbow"

   ;; -- Other Packages --
   "magit"
   "envrc"
   "eat"

   ;; -- Editing modules --
   "programming"
   "vundo"         ;; Visual undo history
   "hl-todo"
   ;; "adaptive-wrap" ;; Emacs lisp
   ;; "jinx"
   ;; "aggressive-indent"
   ;; "markdown"


   ;; -- Builtin modules --
   "dired"
   "keybindings"
   "repeat"
   "c-code"
   "startup"
   "frame"
   "mouse"
   "widget"
   "simple"
   "electric"
   "font-core"
   "saveplace"
   "subr"
   "files"
   "delsel"
   "paren"
   "uniquify"
   "recentf"
   "savehist"
   "auto-insert"
   "ibuffer"
   "window"
   "tramp"
   "minibuffer"
   "calendar"
   "winner"
   "ediff"
   "dictionary"
   "project"
   )) ;; -- End of Modules --
