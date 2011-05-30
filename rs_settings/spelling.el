;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flyspell settings

;; don't sort alphabetically but based on similarity
(setq flyspell-sort-corrections nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; add mode hooks

;; (setq flyspell-text-modes t)

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(dolist (hook '(org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable flyspell for comments in source code
(add-hook 'c++-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            ; ...
          ))

(add-hook 'python-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            ; ...
          ))

(add-hook 'idlwave-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            ; ...
          ))

(add-hook 'fortran-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            ; ...
          ))

(add-hook 'r-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            ; ...
          ))