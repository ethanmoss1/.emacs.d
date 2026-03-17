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

   ;; -- Themeing Modules --
   "modus-themes"
   "nerd-icons"
   "modeline"

   ;; -- Programming Modules --
   "rainbow"
   "eglot"
   "nix"

   ;; -- Other Packages --
   "magit"
   "eat"

   ;; -- Builtin modules --
   "dired"

   ;; -- Other Builtin modules --
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
