;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.
;; tips: http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/

(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(setq ido-enable-last-directory-history t) ; forget latest selected directory names
(ido-everywhere t)

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; file at point
(setq ido-use-filename-at-point 'guess)
(setq ido-use-url-at-point nil)         ; don't use url at point (annoying)

;; virtual buffers
(setq ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      )

;; ignore these guys, typing full will open them anyway or C-a makes them visible
(setq
  ido-ignore-files
  '("\\` "  "\\.pdf" "\\.dvi" "\\.ps" "\\.eps" "\\.jpg" "\\.png" "\\.fits" "\\.fcat" "\\.fz" "\\.FIT" "\\.fak" "\\.im" "\\.fit" "\\.ftab" "\\`CVS/" "\\`#" "\\`.#" "auto-save-list" "\\.rsync-filter" "\\.org-id-locations")
)

(setq ido-file-extensions-order '( ".sh" ".py" ".pro" ".cat" ".tab" ".dat" ".tex" ".txt" ".list" ".notes" ".readme" ".org" ".log" ".bib" ".bst" ".emacs" ".html" ".aux" ".cls" ".sty"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fixing ido restrict matches
(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
;;  "Add my keybindings for ido."
(define-key ido-completion-map (kbd "C-SPC") nil)
(define-key ido-completion-map (kbd "C-@") nil)
(define-key ido-completion-map (kbd "C-0") 'ido-restrict-to-matches)
)
