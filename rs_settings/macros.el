;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my saved macros


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; table data macros - better rewrite them as functions!
;; FIXME: add suport for comment lines - jump to end and search for #

(fset 'orgtaby
   [?\M-< ?\C-s ?# ?\C-d ?\C-x ?h ?\C-c ?| ?\C-x ?\C-s])

(fset 'orguntaby
   [?\M-< ?\M-x ?r ?e ?p ?l ?a ?c ?e ?- ?s ?t ?r ?i ?n ?g return ?| return return ?\M-< ?# ?\C-s ?  ?\C-s ?\C-m ?\C-d ?\M-< ?\C-x ?\C-s])


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; comment-line-separator

;; C-u 70 M-;		;; comment-dwim-line
;; LFD			;; newline-and-indent

(fset 'rs-comment-line-separator-macro
   "\C-u70\273\C-j")
   ;; "\C-u70\273")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pdf export from org mode with line separator

(fset 'rs/org2pdf
   [?\C-x ?r ?  ?p ?\M-< ?\C-s ?* ?\C-s ?* ?\C-m M-f2 ?$ return ?\\ ?\\ ?\\ ?\\ return ?\M-x ?o ?r ?g ?- ?e ?x ?p ?o ?r ?t ?- ?a ?s ?- ?p ?d ?f ?- ?a ?n ?d ?- ?o ?p ?e ?n return ?\C-/ ?\C-x ?r ?j ?p ?\M-s])
