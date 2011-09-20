;; clean install of org.7.7
(add-to-list 'load-path
              "~/.emacs.d/plugins/org-7.7/lisp")
(require 'org-install)
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; Make TAB the yas trigger key in the org-mode-hook and enable flyspell mode and autofill
(add-hook 'org-mode-hook
          (lambda ()
            (make-variable-buffer-local 'yas/trigger-key)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)
            (auto-fill-mode 1)
            (flyspell-mode 0)))

;; Various preferences
(setq org-log-done t
      org-completion-use-ido t
      org-edit-timestamp-down-means-later t
      org-agenda-start-on-weekday 1
      org-agenda-ndays 14
      org-agenda-include-diary t
      org-agenda-window-setup 'current-window
      org-fast-tag-selection-single-key 'expert
      org-tags-column 50)

;; my agendas
(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/personal.org"
                             "~/Dropbox/org/refile.org"
                             "~/Dropbox/org/emacs.org"
))


;; tags
(setq org-tag-alist (quote ((:startgroup)
                            ("work" . ?w)
                            ("spt" . ?s)
                            ("xbcs" . ?x)
                            ("xdcp" . ?d)
                            ("xxl" . ?l)
                            ("coding" . ?c)
                            ("emacs" . ?e)
                            ("computer" . ?C)
                            ("bureaucracy" . ?b)
                            (:endgroup)
                            ("note" . ?n)
                            ("idea" . ?i)
                            ("personal" . ?p)
                            ("quote" . ?q)
                            ("link" . ?L)
                            ("read" . ?r)
                            ("write" . ?t)
                            ("wiki" . ?W)
                            ("music" . ?m)
                            ("movie" . ?o)
                            ("visual" . ?v)
                            ("FLAGGED" . ??))))

;; todo keywords
;; (setq org-todo-keywords (quote ((sequence "TODO(t)" "|" "DONE(d!/!)"))))
(setq org-use-fast-todo-selection t)    ; C-c C-t KEY

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; capture
(setq org-default-notes-file "~/Dropbox/org/refile.org")

;; I use C-M-r to start capture mode
(global-set-key (kbd "C-M-r") 'org-capture)

;; Capture templates
(setq org-capture-templates
    (quote (("t" "todo" entry (file "~/Dropbox/org/refile.org")
             "* TODO %?\n%U\n%a\n  %i" :empty-lines 1)
            ;; ("w" "work" entry (file+datetree "~/Dropbox/org/work.org") "* %?\n%U" :empty-lines 1)
            ("w" "work" entry (file "~/Dropbox/org/work.org") "* %?\n%U" :empty-lines 1)
            ("n" "note" entry (file "~/Dropbox/org/refile.org")
             "* %? :note:\n%U" :empty-lines 1)
            ("i" "idea" entry (file "~/Dropbox/org/refile.org")
             "* %? :idea:\n%U\n%a\n" :empty-lines 1)
            ("p" "personal" entry (file "~/Dropbox/org/personal.org") "* %?\n%U" :empty-lines 1)
            ("W" "wiki" entry (file "~/Dropbox/org/wiki.org") "* %? :wiki:\n\nTAGS: \n\n%U" :empty-lines 1)
            )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; refile

(setq org-refile-targets (quote ((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5))))
(setq org-refile-use-outline-path (quote file))
(setq org-outline-path-complete-in-steps t)


;; (defvar org-journal-file "~/Dropbox/org/journal.org"
;;   "Path to OrgMode journal file.")
;; (defvar org-journal-date-format "%Y-%m-%d"
;;   "Date format string for journal headings.")

;; (defun org-journal-entry ()
;;   "Create a new diary entry for today or append to an existing one."
;;   (interactive)
;;   (switch-to-buffer (find-file org-journal-file))
;;   (widen)
;;   (let ((today (format-time-string org-journal-date-format)))
;;     (beginning-of-buffer)
;;     (unless (org-goto-local-search-headings today nil t)
;;       ((lambda ()
;;          (org-insert-heading)
;;          (insert today)
;;          (insert "\n\n  \n"))))
;;     (beginning-of-buffer)
;;     (org-show-entry)
;;     (org-narrow-to-subtree)
;;     (end-of-buffer)
;;     (backward-char 2)
;;     (unless (= (current-column) 2)
;;       (insert "\n\n  "))))

;; (global-set-key (kbd "C-c j") 'org-journal-entry)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; diary setup
;; (require 'diary-lib)
;; (add-hook 'diary-display-hook 'fancy-diary-display)

;; (custom-set-variables
;;  '(diary-file "~/Dropbox/org/diary.org"))

;; ;;; bindings for org mode

;; ;; The latest version of yasnippets doesn't play well with Org-mode, the
;; ;; following function allows these two to play nicely together

;; (require 'org-install)
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)

;; ;; my agendas
;; (setq org-agenda-files (list "~/Dropbox/org/agenda-work.org"
;;                              "~/Dropbox/org/agenda-read.org"
;;                              ;; "~/org/home.org"
;; ))



;;   (defun yas/org-very-safe-expand ()
;;     (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

;;   (add-hook 'org-mode-hook
;;             (lambda ()
;;               (local-set-key "\M-\C-n" 'outline-next-visible-heading)
;;               (local-set-key "\M-\C-p" 'outline-previous-visible-heading)
;;               (local-set-key "\M-\C-u" 'outline-up-heading)
;;               ;; table
;;               (local-set-key "\M-\C-w" 'org-table-copy-region)
;;               (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
;;               (local-set-key "\M-\C-l" 'org-table-sort-lines)
;;               ;; display images
;;               (local-set-key "\M-I" 'org-toggle-iimage-in-org)
;;               ;; yasnippet (using the new org-cycle hooks)
;;               (make-variable-buffer-local 'yas/trigger-key)
;;               (setq yas/trigger-key [tab])
;;               (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
;;               (define-key yas/keymap [tab] 'yas/next-field)
;;               ))
