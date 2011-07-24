;; Support for the Python programming language.

;; Use Python's python-mode.el instead of Emacs' python.el
;; Replace the Python mode that comes with Emacs by the Python mode
;; supplied by the Python distribution itself.

;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/misc")

;; ;; aquamacs claims to use it by default
;; ;; (require 'python-mode)
;; ;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; ;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; ;; (setq org-babel-python-mode 'python-mode)

;; ;; Facilitate the use of IPython
;; (defun python-use-ipython (cmd args)
;;   (setq ipython-command cmd)
;;   (setq py-python-command-args args)
;;   (require 'ipython)
;;   (setq ipython-completion-command-string
;;         "print(';'.join(__IP.Completer.all_completions('%s')))\n"))

;; (python-use-ipython "/usr/local/bin/ipython" '("-colors" "LightBG" "-nobanner"))

;; ;; Use Cython mode
;; (require 'cython-mode)
;; (add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
;; (add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
;; (add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))

;; (require 'ipython)


(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'ipython)
(setq py-python-command-args '("-pylab" "-colors" "LightBG"))
;; (add-to-list 'load-path “~/.emacs.d/plugins/misc”)
;; (require 'ipython)
(setq python-command "ipython")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; try 1
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'py-smart-indentation nil)
                    (set-variable 'indent-tabs-mode nil)
                    ;;(highlight-beyond-fill-column)
                    (define-key python-mode-map "\C-m" 'newline-and-indent)
                    (pabbrev-mode)
                    (abbrev-mode)
         )
      )
)

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(eval-after-load "pymacs"
  '(add-to-list 'pymacs-load-path ~/data1/sw/Pymacs"))
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; try 2
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; (require 'python-mode)
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; (eval-after-load "pymacs"
;;   '(add-to-list 'pymacs-load-path ~/data1/sw/Pymacs"))

