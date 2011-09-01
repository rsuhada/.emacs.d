;; ibuffer settings
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ;; ("dired" (mode . dired-mode))
               ("sh" (mode . sh-mode))
               ("python" (mode . python-mode))
               ("idl" (mode . idlwave-mode))
               ("tex" (mode . latex-mode))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . org-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (mode . Emacs-Lisp-Mode)))
))))

(setq ibuffer-show-empty-filter-groups nil)

;; (setq switch-to-buffer-ignore '("^emacsclient$"))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))