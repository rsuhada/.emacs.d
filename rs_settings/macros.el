;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my saved macros

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; table data macros - better rewrite them as functions!

(fset 'orgtaby
   [?\M-> ?\C-r ?# ?\C-m return return ?\C-d ?\C-d M-escape ?\M-n ?\C-c ?| ?\C-a ?\C-x ?\C-s])

(fset 'orguntaby
   [?\M-< ?\C-s ?| ?\C-m backspace backspace ?\C-d ?# ?\C-d ?\M-< ?\M-x ?r ?e ?p ?l ?a ?c ?e ?- ?s ?t ?r ?i ?n ?g return ?| return return ?\M-< ?\C-x ?\C-s?\M-l ? ?\C-s ? ?\C-d ?\M-<])

;; FIXME
(fset 'orguntaby-simple
   [?\M-< f2 ?| return ?  return ?\M-< ?# ?\C-d ?\M-w ?\M-s])

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; work macros

;; from the multiline fits XPROC0 keyword make a paramter table
;; FIXME: still leaves some debris

;; (fset 'xproc0
;;    [?\C-s ?X ?P ?R ?O ?C ?0 ?\C-m ?\M-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-s ?# ?\C-m ?\C-k ?\C-x ?\C-x f2 ?& ?\' ?\C-q ?\C-j ?C ?O ?N ?T ?I ?N ?U ?E ?  ?  ?\' return return ?\C-a ?\C-\; f2 ?  return ?\C-q ?\C-j return ?\M-p ?\M-k ?\C-e return ?\C-\; ?\M-x ?s ?o ?r ?t ?- ?l ?i ?n ?e ?s return ?\C-d ?\M-i ?\C-k ?\C-k ?\C-k ?\C-k ?\M-s])


;; (fset 'xproc0
;;    [?\C-s ?X ?P ?R ?O ?C ?0 ?\C-m ?\C-\; f2 ?& ?\' ?\C-q ?\C-j ?C ?O ?N ?T ?I ?N ?U ?E ?  ?  ?\' return return ?\C-r ?# ?\C-m ?\C-k ?\C-a ?\M-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-s ?  ?\C-m return return ?\C-d ?\C-\; f2 ?  return ?\C-q ?\C-j return ?\M-p ?\C-\; ?\M-x ?s ?o ?r ?t ?- ?l ?i ?n ?e ?s return ?\C-d ?\M-i])


;; (fset 'xproc0b
;;    [?\C-s ?x ?p ?r ?o ?c ?0 ?\C-m ?\M-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d ?\M-f return return ?\C-d ?\C-\; f2 ?& ?\' ?\C-q ?\C-j ?C ?O ?N ?T ?I ?N ?U ?E ?  ?  ?\' return return ?\C-a ?\C-\; f2 ?  return ?\C-q ?\C-j return ?\C-w ?\M-i ?\C-w ?\M-i ?\C-w ?\M-p ?\M-n ?\C-r ?t ?a ?b ?l ?e ?= ?\C-m ?\M-s])

(fset 'rs-macro/xproc0
   [?\M-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-d ?\C-\; f2 ?8 backspace ?& ?\' ?\C-d ?\C-q ?\C-d backspace ?\C-q ?\C-j ?C ?O ?N ?T ?I ?N ?U ?E ?  ?  ?\' ?\C-d return return ?\C-a ?\C-\; f2 ?  return ?\C-q ?\C-j return ?\C-w ?\M-i ?\C-w ?\M-i ?\C-w ?\M-s])

(fset 'rs-latex-comment
   [return return return return ?\M-i ?\M-i ?\C-u ?7 ?0 ?% ?\M-w return ?\M-\; ?\C-/ ?% ?  ?R ?S return ?% return ?\C-y ?\M-i ? ])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mark line (temporary solution)

(fset 'rs-macro/mark-line
   [?\C-a ?\C-a M-escape ?\C-e])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; macro for book list

(fset 'rs-macro/ebook
   [?\M-< ?\C-\; ?\C-d ?\C-d M-f2 ?: ?: ?. ?* return return ?\M-< ?\M-s ?\M-k ?\M-k ?\M-k])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; options on of

(fset 'rs-macro/opt-off
   [f2 ?= ?1 return ?= ?0 return ?\M-s])

(fset 'rs-macro/opt-on
   [f2 ?= ?0 return ?= ?1 return ?\M-s])
