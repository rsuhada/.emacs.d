;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.
;; tips: http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history t) ; forget latest selected directory names

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; file at point
(setq ido-use-filename-at-point 'guess)
(setq ido-use-url-at-point nil)         ; don't use url at point (annoying)

;; ignore these guys, typing full will open them anyway or C-a makes them visible
(setq
  ido-ignore-files
  '("\\` "  "\\.pdf" "\\.dvi" "\\.ps" "\\.eps" "\\.jpg" "\\.png" "\\.fits" "\\.fcat" "\\.fz")
)

(setq ido-file-extensions-order '( ".sh" ".py" ".pro" ".cat" ".tab" ".dat" ".tex" ".txt" ".bib" ".list" ".notes" ".readme" ".org" ".log" ".emacs" ".html" ".aux"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fixing ido restrict matches
(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
;;  "Add my keybindings for ido."
(define-key ido-completion-map (kbd "C-SPC") nil)
(define-key ido-completion-map (kbd "C-@") nil)
(define-key ido-completion-map (kbd "C-0") 'ido-restrict-to-matches)
)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sample code


;; ;; ido makes competing buffers and finding files easier
;; ;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
;; (require 'ido)
;; (ido-mode 'both) ;; for buffers and files
;; (setq
;;   ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

;;   ido-ignore-buffers ;; ignore these guys
;;   '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"

;;      "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
;;   ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
;;   ido-case-fold  t                 ; be case-insensitive

;;   ido-enable-last-directory-history t ; remember last used dirs
;;   ido-max-work-directory-list 30   ; should be enough
;;   ido-max-work-file-list      50   ; remember many
;;   ido-use-filename-at-point nil    ; don't use filename at point (annoying)
;;   ido-use-url-at-point nil         ; don't use url at point (annoying)

;;   ido-enable-flex-matching nil     ; don't try to be too smart
;;   ido-max-prospects 8              ; don't spam my minibuffer
;;   ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; ;; when using ido, the confirmation is rather annoying...
;;  (setq confirm-nonexistent-file-or-buffer nil)