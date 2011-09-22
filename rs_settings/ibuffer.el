;; ibuffer settings
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("esaspi" (filename . "/esaspi/"))
               ("sh" (mode . sh-mode))
               ("python" (mode . python-mode))
               ("idl" (mode . idlwave-mode))
               ("tex" (mode . latex-mode))
               ("org" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . org-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (mode . Emacs-Lisp-Mode)))
               ("dired" (mode . dired-mode))
))))

(setq ibuffer-show-empty-filter-groups nil)

;; (setq switch-to-buffer-ignore '("^emacsclient$"))


(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))