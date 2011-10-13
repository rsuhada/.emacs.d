;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my custom functions

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; comment line separator


;; (defun rs-insert-comment-line-separator ()
;;   "Inserts a comment line separator"
;;   (interactive)
;;   (insert-char `comment-start `fill-column)
;;   (forward-char)
;; )
;; ;; not working yet



(defun rs-insert-comment-line-separator ()
  "Inserts a comment line separator"
  (interactive)
  (insert-char comment)         ; works for insertion

  ;; ;; (insert-char (comment-start fill-column))
  ;; (self-insert-command (comment-start fill-column))
  ;; (insert (comment-start))
  (forward-char)
)
