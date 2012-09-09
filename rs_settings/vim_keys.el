;; vim style - problem: it breaks things in buffer/anything etc...
(global-set-key (kbd "M-h") 'backward-char) ;indent-new-comment-line
(global-set-key (kbd "M-l") 'forward-char)  ;downcase-word
(global-set-key (kbd "M-k") 'previous-line) ;tab-to-tab-stop
(global-set-key (kbd "M-j") 'next-line)     ;command kill-sentence
;; (global-set-key (kbd "M-i") 'backward-kill-word)
(global-set-key (kbd "M-i") 'use-emacs-keys)
(global-set-key (kbd "S-<backspace>") 'backward-kill-word)
;; (global-set-key (kbd "M-SPC") 'set-mark-command)


(define-key anything-map (kbd "M-k") 'anything-previous-line)
(define-key anything-map (kbd "M-l") 'anything-next-source)
(define-key anything-map (kbd "M-h") 'anything-previous-source)
(define-key anything-map (kbd "M-j") 'anything-next-line)
;; (define-key anything-map (kbd "M-i") 'anything-previous-line)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; reset

;; ;; Single char cursor movement. (assuming you are on qwerty)
;; (global-set-key (kbd "M-j") 'backward-char) ;indent-new-comment-line
;; (global-set-key (kbd "M-l") 'forward-char)  ;downcase-word
;; (global-set-key (kbd "M-i") 'previous-line) ;tab-to-tab-stop
;; (global-set-key (kbd "M-k") 'next-line)     ;command kill-sentence
;; ;; (global-set-key (kbd "M-SPC") 'set-mark-command)
;; (global-set-key (kbd "M-h") 'backward-kill-word)  ; was mark-paragraph

;; (define-key anything-map (kbd "M-k") 'anything-next-line)
;; (define-key anything-map (kbd "M-i") 'anything-previous-line)
;; (define-key anything-map (kbd "M-l") 'anything-next-source)
;; (define-key anything-map (kbd "M-j") 'anything-previous-source)
