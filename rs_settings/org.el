;;; bindings for org mode

;; The latest version of yasnippets doesn't play well with Org-mode, the
;; following function allows these two to play nicely together

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; my agendas
(setq org-agenda-files (list "~/org/agenda-work.org"
                             "~/org/agenda-read.org"
                             ;; "~/org/home.org"
))



  (defun yas/org-very-safe-expand ()
    (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

  (add-hook 'org-mode-hook
            (lambda ()
              (local-set-key "\M-\C-n" 'outline-next-visible-heading)
              (local-set-key "\M-\C-p" 'outline-previous-visible-heading)
              (local-set-key "\M-\C-u" 'outline-up-heading)
              ;; table
              (local-set-key "\M-\C-w" 'org-table-copy-region)
              (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
              (local-set-key "\M-\C-l" 'org-table-sort-lines)
              ;; display images
              (local-set-key "\M-I" 'org-toggle-iimage-in-org)
              ;; yasnippet (using the new org-cycle hooks)
              (make-variable-buffer-local 'yas/trigger-key)
              (setq yas/trigger-key [tab])
              (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
              (define-key yas/keymap [tab] 'yas/next-field)
              ))

