;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my saved macros


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; table data macros - better rewrite them as functions!

(fset 'orgtaby
   [?\M-< ?\C-s ?# ?\C-d ?\C-x ?h ?\C-c ?| ?\C-x ?\C-s])

(fset 'orguntaby
   [?\M-< f2 ?| return ?  return ?\M-< ?# ?\C-d ?\C-x ?\C-s])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbrev temporary patch
(fset 'protect-underscore
   "\C-q_")

(fset 'protect-dash
   "\C-q-")

(fset 'protect-equal
   "\C-q=")

