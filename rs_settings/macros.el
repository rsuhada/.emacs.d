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
   [?\M-< f2 ?| return ?  return ?\M-< ?# ?\C-d ?\M-w ?\C-d ?\C-d ?\M-s])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbrev temporary patch - deprecated - rewrittent o functions

;; (fset 'protect-underscore
;;    "\C-q_")

;; (fset 'protect-dash
;;    "\C-q-")

;; (fset 'protect-equal
;;    "\C-q=")

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
   [?\C-a ?\C-a M-escape ?\C-e ?\C-e ?\C-e ?\C-e ?\C-e]) ;multiple end line for long line bug

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for talks

(fset 'rs-macro/new-item
   "\C-e\M-q\M-n\C-m-\C-o ")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remove occur markup

(fset 'rs/macro-unoccur
   [?\C-k ?\C-k M-f2 ?^ ?  ?+ ?\[ ?0 ?- ?9 ?\C-e ?+ ?: return return ?\M-<])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; have an empty buffer with a single column of numbers, return it's
;; sum (see modeline + result in clipboard)
;; replaced by proper function

;; (fset 'rs-macro/sum-column
;;    [?\C-\; ?\M-x ?o ?r ?g ?t ?b ?l ?- ?m ?o ?d ?e return ?\M-x ?o ?r ?g ?t ?b ?l ?o backspace ?- ?c ?r ?e ?a ?t ?e ?- ?o ?r ?- ?e ?x ?p ?r backspace ?o ?r ?t backspace backspace backspace backspace backspace backspace ?c ?o ?n ?v ?e ?r ?t ?- ?f ?r ?o ?m ?- ?r ?e ?g ?i ?o ?n return ?\C-c ?+])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remove tex markup
;; FIXME: work on this

(fset 'rs-macro/detexify
   [?\M-< f2 ?^ backspace ?& return ?  return ?\M-< f2 ?/ backspace ?\\ ?\\ return return ?\M-< f2 ?$ return return ?\M-< f2 ?\\ ?p ?m return ?  ?  ?  return ?\M-< f2 ?^ ?\{ ?\M-l backspace return ?  ?  return ?\M-< f2 ?\} return return ?\M-< f2 ?_ ?\{ ?\C-d return ?  return ?\M-<])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; transfor selected region to anki cloze form

(fset 'rs-macro/clozeify
   [?\{ ?\M-  ?\C-\' ?\{ ?\C-\' ?\M-l ?\M-l ?c ?: ?: ?\M-j ?\M-j ?\M-s])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jclub macro
;;
;; copy from arxiv abs page everything from start of title to the Cite
;; as field (including), NO REGION SHOULD BE ACTIVE, run macro from
;; the start of the title. Can run on multiple abstracts (single space
;; between)

(fset 'rs-macro/jclub
   [?h ?2 ?. ?  ?\M-s ?\C-s ?c ?o ?m ?m ?e ?n ?t ?s ?: return ?\C-k ?\C-k ?\C-k ?\C-k ?\M-  ?\C-s ?a ?r ?x ?i ?v ?\M-b ?\C-d return ?h ?t ?t ?p ?: ?/ ?/ ?\M-f ?. ?o ?r ?g ?/ ?a ?b ?s ?/ ?\M-f ?\M-b backspace ?\M-f ?\M-f ?\C-k ?\M-k ?\C-a ?\C-k return ?V ?o ?t ?e ?s ?: ?  ?* ?0 ?* ?\M-k ?\M-k ?\C-a])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; exchanges point ana mark and switches of selection
(fset 'rs-macro/jump-to-last-mark
   "\C-x\C-x\240")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; force compile python

(fset 'rs-macro/pycompile
   [?\M-o ?\M-> return return ?\M-o ?\C-c ?\C-c])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; macros for desktop recover

(fset 'rs-macro/recover1
   [?\C-s ?\" ?/ ?s ?s ?h ?2 return ?\M-m ?\C-d ?\C-d])

(fset 'rs-macro/recover2
   [?\C-s ?s ?s ?h ?2 ?: return ?\C-\; ?\C-d ?\C-d])
