;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my saved macros


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; table data macros - better rewrite them as functions!

(fset 'orgtaby
   [?\M-< ?\C-s ?# ?\C-d ?\C-x ?h ?\C-c ?| ?\C-x ?\C-s])

(fset 'orguntaby
   [?\M-< ?\M-x ?r ?e ?p ?l ?a ?c ?e ?- ?s ?t ?r ?i ?n ?g return ?| return return ?\M-< ?# ?\C-x ?\C-s])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbrev temporary patch

(fset 'protect-underscore
   "\C-q_")

(fset 'protect-dash
   "\C-q-")

(fset 'protect-equal
   "\C-q=")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; utility macros

(fset 'untexify-table
   [?\M-< ?& ?\C-/ ?\C-x ?\C-s f2 ?& return ?  ?  ?  ?  return ?\M-< f2 ?\\ ?\\ return return ?\M-< f2 ?$ return return ?\M-< f2 ?^ ?\{ return ?  ?  ?  ?  return ?\M-< f2 ?_ ?\{ return ?  ?  ?  ?  return ?\M-< f2 ?\} return return ?\M-< f2 ?\\ ?p ?m return return ?\M-< ?\C-x ?\C-s])
