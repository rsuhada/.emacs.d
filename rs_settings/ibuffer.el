;; ibuffer settings
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("tramp"   (or (filename . "ssh2:")
                              (name . "tramp")
                              ))
               ("data" (or
                           (name . ".dat$")
                           (name . ".cat$")
                           (name . ".tab$")
                           (name . ".csv$")
                           (name . ".table$")
                           ))
               ("kapi" (filename . "/kapi/"))
               ("esaspi" (filename . "/esaspi/"))
               ("sh" (mode . sh-mode))
               ("python" (or
                          (name . "^\\*Python\\*")
                          (mode . python-mode)))
               ("html" (mode . xhtml-mode))
               ("c" (mode . c-mode))
               ("r" (mode . ess-mode))
               ("fortran" (mode . fortran-mode))
               ("idl" (mode . idlwave-mode))
               ("tex" (or
                       (name . ".bib$")
                       (name . ".bbl$")
                       (mode . latex-mode)))
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
(setq ibuffer-default-sorting-mode 'alphabetic)
(setq ibuffer-expert t)                 ; no promt on saved files

;; (setq switch-to-buffer-ignore '("^emacsclient$"))


(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for a running session it works but not after restart...

;; ;; Use human readable Size column instead of original one
;; (define-ibuffer-column size-h
;;   (:name "Size" :inline t)
;;   (cond
;;    ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
;;    ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
;;    (t (format "%8d" (buffer-size)))))

;; ;; Modify the default ibuffer-formats
;;   (setq ibuffer-formats
;; 	'((mark modified read-only " "
;; 		(name 18 18 :left :elide)
;; 		" "
;; 		(size-h 9 -1 :right)
;; 		" "
;; 		(mode 16 16 :left :elide)
;; 		" "
;; 		filename-and-process)))