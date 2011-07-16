(load "~/.emacs.d/rs_settings/global")
(load "~/.emacs.d/rs_settings/defun")
(load "~/.emacs.d/rs_settings/env")
(load "~/.emacs.d/rs_settings/bindings")
(load "~/.emacs.d/rs_settings/ido")
(load "~/.emacs.d/rs_settings/tab")
(load "~/.emacs.d/rs_settings/delim")
;; (load "~/.emacs.d/rs_settings/network")
(load "~/.emacs.d/rs_settings/rect")
(load "~/.emacs.d/rs_settings/org")
(load "~/.emacs.d/rs_settings/spelling")
;; (load "~/.emacs.d/rs_settings/python_stuff")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load in external packages
(load "~/.emacs.d/plugins/external")

;; (require 'ipython)
;; (setq ipython-completion-command-string "print(';'.join(get_ipython().Completer.complete('%s')[1])) #PYTHON-MODE SILENT\n")


;; (add-to-list 'load-path "~/.emacs.d/plugins/misc/")

;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; ;;(eval-after-load "pymacs"
;; ;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))


;; (setq pymacs-load-path '( "/System/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/rope-0.9.3-py2.6.egg/rope"
;;                           "/System/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/rope-0.9.3-py2.6.egg/rope"
;;                           "/System/Library/Frameworks/Python.framework/Versions/2.6/lib/python2.6/site-packages/ropemacs-0.6-py2.6.egg/ropemacs"))

;; (add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
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

;; (require 'auto-complete)
;; (global-auto-complete-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; parts auto-written by custom set
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(longlines-auto-wrap t)
 '(longlines-wrap-follows-window-size t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font for mac
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1a1a1a" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Andale Mono")))))



