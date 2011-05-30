;; Support for the Python programming language.

;; Use Python's python-mode.el instead of Emacs' python.el
;; Replace the Python mode that comes with Emacs by the Python mode
;; supplied by the Python distribution itself.

(add-to-list 'load-path
              "~/.emacs.d/plugins/misc")

;; aquamacs claims to use it by default
;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; (setq org-babel-python-mode 'python-mode)

;; Facilitate the use of IPython
(defun python-use-ipython (cmd args)
  (setq ipython-command cmd)
  (setq py-python-command-args args)
  (require 'ipython)
  (setq ipython-completion-command-string
        "print(';'.join(__IP.Completer.all_completions('%s')))\n"))

(python-use-ipython "/usr/local/bin/ipython" '("-colors" "LightBG" "-nobanner"))

;; ;; Use Cython mode
;; (require 'cython-mode)
;; (add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
;; (add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
;; (add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))

