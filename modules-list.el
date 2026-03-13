;; Load modules
(mapcar
 'config-module-load
 '(;;;;;; ---- List of modules to load ----
   ;; -- Package manager --
   "elpaca"
   "wait" ;; special wait and install.

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

   ;; -- Version Control --
   "magit"
   )) ;; -- End of Modules --
