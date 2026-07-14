;; Load modules
(mapcar
 'config-module-load
 '(;;;;;; ---- List of modules to load ----
   ;; -- Pre-setup
   "host-configuration"

   ;; -- Package manager --
   "elpaca"

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

   ;; -- Compulsory Modules --
   "compat"
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
   "minions"

   ;; -- Org Modules --
   "org"

   ;; Agenda related
   "org-contrib"
   "org-protocol"
   "org-export-icalendar"
   "org-gtasks"

   ;; Links
   "org-link-man"
   "org-link-rfc"
   "org-link-pdf"

   ;; Personal Knowledge Management
   "org-roam"
   "org-roam-timestamps"
   "org-contacts"

   ;; Prettifying
   "org-fragtog"
   "org-appear"
   "adaptive-wrap"
   "olivetti"

   ;; org tools
   "el-easydraw"
   "jinx" ; Spell checking

   ;; -- Bibliography related packages --
   ;; "citar"
   ;; "citar-org-roam"
   ;; "zotra"
   ;; "pdf-tools"

   ;; -- News and Email --
   ;; "elfeed"
   "notmuch"
   ;; "ntfy"

   ;; -- Programming Modules --
   "eglot"
   "yasnippet"
   "gptel"

   ;; Full Languages
   "nix"
   "python"
   "c"

   ;; Syntax ++
   "dockerfile"
   "cisco-ios"
   "yang"
   "systemd"
   "yaml"
   "markdown"

   "rainbow"

   ;; -- Other Packages --
   "magit"
   "envrc"
   "eat"
   "nix-host"

   ;; -- Editing modules --
   "programming"
   "vundo"         ;; Visual undo history
   "hl-todo"
   "aggressive-indent"
   "ultra-scroll"
   ))
;; -- End of Modules --
