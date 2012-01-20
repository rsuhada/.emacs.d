;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbreviations setup

(setq abbrev-file-name             ;; tell emacs where to read abbrev
        "~/.emacs.d/abbrev_defs")

(setq save-abbrevs t)              ;; save abbrevs when files are saved
(if (file-exists-p abbrev-file-name)
        (quietly-read-abbrev-file))

;; (setq default-abbrev-mode t)    ;; always on

(dolist (hook '(erc-mode-hook
                emacs-lisp-mode-hook
                text-mode-hook
                latex-mode-hook
                python-mode-hook
                sh-mode-hook
                ess-mode-hook
))
(add-hook hook (lambda () (abbrev-mode 1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; comment/code abbrev switching

(defun python-mode-abbrev-expand-function (expand)
  (if (not (save-excursion (forward-line 0) (eq (char-after) ?#)))
      ;; Performs normal expansion.
      (funcall expand)
    ;; We're inside a comment: use the text-mode abbrevs.
    (let ((local-abbrev-table text-mode-abbrev-table))
      (funcall expand))))

(add-hook 'python-mode-hook
          #'(lambda ()
              (add-hook 'abbrev-expand-functions
                        'python-mode-abbrev-expand-function
                        nil t)))

(add-hook 'sh-mode-hook
          #'(lambda ()
              (add-hook 'abbrev-expand-functions
                        'python-mode-abbrev-expand-function
                        nil t)))