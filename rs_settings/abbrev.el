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
                text-mode-hook))
(add-hook hook (lambda () (abbrev-mode 1))))
