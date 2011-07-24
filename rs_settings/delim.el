;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; delimiter tweaks

;; make rainbow color delims:: see external.el

(defun electric-pair ()
  "Insert character pair without sounding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;; Electric Pairs - autocomplete braces etc.
(add-hook 'python-mode-hook
     (lambda ()
      (define-key python-mode-map "\"" 'electric-pair)
      (define-key python-mode-map "\'" 'electric-pair)
      (define-key python-mode-map "(" 'electric-pair)
      (define-key python-mode-map "[" 'electric-pair)
      (define-key python-mode-map "{" 'electric-pair)))

(add-hook 'python-hook
     (lambda ()
      (define-key python-map "\"" 'electric-pair)
      (define-key python-map "\'" 'electric-pair)
      (define-key python-map "(" 'electric-pair)
      (define-key python-map "[" 'electric-pair)
      (define-key python-map "{" 'electric-pair)))

(add-hook 'emacs-lisp-mode-hook
     (lambda ()
      (define-key emacs-lisp-mode-map "\"" 'electric-pair)
      (define-key emacs-lisp-mode-map "\'" 'electric-pair)
      (define-key emacs-lisp-mode-map "(" 'electric-pair)
      (define-key emacs-lisp-mode-map "[" 'electric-pair)
      (define-key emacs-lisp-mode-map "{" 'electric-pair)))

(add-hook 'latex-mode-hook
     (lambda ()
      (define-key latex-mode-map "\"" 'electric-pair)
      (define-key latex-mode-map "\'" 'electric-pair)
      (define-key latex-mode-map "(" 'electric-pair)
      (define-key latex-mode-map "[" 'electric-pair)
      (define-key latex-mode-map "{" 'electric-pair)))

(add-hook 'text-mode-hook
     (lambda ()
      (define-key text-mode-map "\"" 'electric-pair)
      ;; (define-key text-mode-map "\'" 'electric-pair)
      (define-key text-mode-map "(" 'electric-pair)
      (define-key text-mode-map "[" 'electric-pair)
      (define-key text-mode-map "{" 'electric-pair)))

(add-hook 'org-mode-hook
     (lambda ()
      (define-key org-mode-map "\"" 'electric-pair)
      ;; (define-key org-mode-map "\'" 'electric-pair)
      (define-key org-mode-map "(" 'electric-pair)
      (define-key org-mode-map "[" 'electric-pair)
      (define-key org-mode-map "{" 'electric-pair)))

(add-hook 'idlwave-mode-hook
     (lambda ()
      (define-key idlwave-mode-map "\"" 'electric-pair)
      (define-key idlwave-mode-map "\'" 'electric-pair)
      (define-key idlwave-mode-map "(" 'electric-pair)
      (define-key idlwave-mode-map "[" 'electric-pair)
      (define-key idlwave-mode-map "{" 'electric-pair)))

(add-hook 'shell-script-mode-hook
     (lambda ()
      (define-key shell-script-mode-map "\"" 'electric-pair)
      (define-key shell-script-mode-map "\'" 'electric-pair)
      (define-key shell-script-mode-map "(" 'electric-pair)
      (define-key shell-script-mode-map "[" 'electric-pair)
      (define-key shell-script-mode-map "{" 'electric-pair)))

