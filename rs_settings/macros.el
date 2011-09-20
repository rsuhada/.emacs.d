;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my saved macros


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; table data macros - better rewrite them as functions!

(fset 'orgtaby
   [?\M-< ?\C-s ?# ?\C-d ?\C-x ?h ?\C-c ?| ?\C-x ?\C-s])

(fset 'orguntaby
   [?\M-x ?r ?e ?p ?l ?a ?c ?e ?- ?s ?t ?r ?i ?n ?g return ?| return return ?\M-< ?# ?\C-x ?\C-s])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbrev temporary patch

(fset 'protect-underscore
   "\C-q_")

(fset 'protect-dash
   "\C-q-")

(fset 'protect-equal
   "\C-q=")

