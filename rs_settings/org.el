;; clean install of org.7.7
(add-to-list 'load-path
              "~/.emacs.d/plugins/org-7.7/lisp")
(require 'org-install)
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; bindings
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)


;; Make TAB the yas trigger key in the org-mode-hook and enable flyspell mode and autofill
(add-hook 'org-mode-hook
          (lambda ()
            (make-variable-buffer-local 'yas/trigger-key)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field)
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
(setq org-agenda-files (list
                        "~/Dropbox/org/work.org"
                        "~/Dropbox/org/job.org"
                        ;; "~/Dropbox/org/personal.org"
                        ;; "~/Dropbox/org/refile.org"
                        ;; "~/Dropbox/org/emacs.org"
                        ;; "~/Dropbox/org/xxl.org"
                        ;; "~/w/notes/spt.org"
                        ))

;; tags
(setq org-tag-alist (quote ((:startgroup)
                            ("python" . ?p)
                            ("bash" . ?b)
                            ("work" . ?w)
                            ("spt" . ?s)
                            ("xbcs" . ?x)
                            ("xdcp" . ?d)
                            ("xxl" . ?l)
                            ("coding" . ?c)
                            ("emacs" . ?e)
                            ("computer" . ?C)
                            (:endgroup)
                            ("note" . ?n)
                            ("idea" . ?i)
                            ("quote" . ?q)
                            ("link" . ?L)
                            ("read" . ?r)
                            ("write" . ?t)
                            ("wiki" . ?W)
                            ("mac" . ?m)
                            ("movie" . ?o)
                            ("visual" . ?v)
                            ("FLAGGED" . ??))))

;; todo keywords
;; (setq org-todo-keywords (quote ((sequence "TODO(t)" "|" "DONE(d!/!)"))))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "|" "WAITING(w)")
        (sequence "|" "CANCELED(c)")))

(setq org-use-fast-todo-selection t)    ; C-c C-t KEY

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; capture
(setq org-default-notes-file "~/Dropbox/org/refile.org")

;; I use C-M-r to start capture mode
(global-set-key (kbd "C-M-r") 'org-capture)

;; quick todo
(define-key global-map "\C-ct"
        (lambda () (interactive) (org-capture nil "t")))

;; quick todo
(define-key global-map "\C-cw"
        (lambda () (interactive) (org-capture nil "w")))

;; Capture templates
(setq org-capture-templates
    (quote (("t" "todo" entry (file+headline "~/Dropbox/org/work.org" "agenda")
             "* TODO %?" :prepend :empty-lines 1)
            ;; ("W" "work" entry (file+datetree "~/Dropbox/org/work.org") "* %?\n%U" :empty-lines 1)
            ("W" "work" entry (file "~/Dropbox/org/work.org") "* %?\n%U" :empty-lines 1)
            ("n" "note" entry (file "~/Dropbox/org/refile.org")
             "* %? :note:\n%U" :empty-lines 1)
            ("i" "idea" entry (file "~/Dropbox/org/refile.org")
             "* %? :idea:\n%U\n%a\n" :empty-lines 1)
            ("p" "personal" entry (file "~/Dropbox/org/personal.org") "* %?\n%U" :empty-lines 1)
            ("w" "wiki" entry (file "~/Dropbox/org/wiki.org") "* %? \n%U\n######################################################################")
            )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; refile

(setq org-refile-targets (quote ((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5))))
(setq org-refile-use-outline-path (quote file))
(setq org-outline-path-complete-in-steps t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; solving the paragraph problem: solution from phils of stackoverflow

(defmacro with-default-paragraph-definition (&rest body)
  "Evaluate body forms using the default definition of a paragraph."
  `(let ((paragraph-start (default-value 'paragraph-start))
         (paragraph-separate (default-value 'paragraph-separate)))
     ,@body))

(defalias 'my-org-mark-paragraph 'mark-paragraph)
(defadvice my-org-mark-paragraph
  (around my-org-mark-paragraph-advice activate)
  (with-default-paragraph-definition ad-do-it))

(defalias 'my-org-forward-paragraph 'forward-paragraph)
(defadvice my-org-forward-paragraph
  (around my-org-forward-paragraph-advice activate)
  (with-default-paragraph-definition ad-do-it))

(defalias 'my-org-backward-paragraph 'backward-paragraph)
(defadvice my-org-backward-paragraph
  (around my-org-backward-paragraph-advice activate)
  (with-default-paragraph-definition ad-do-it))

(defun my-org-paragraph-overrides ()
  "Use the default paragraph definitions in org-mode
        when marking or moving by paragraph."
  (local-set-key [remap mark-paragraph] 'my-org-mark-paragraph)
  (local-set-key [remap forward-paragraph] 'my-org-forward-paragraph)
  (local-set-key [remap backward-paragraph] 'my-org-backward-paragraph))

(add-hook 'org-mode-hook 'my-org-paragraph-overrides)