(load "~/.emacs.d/rs_settings/global")
(load "~/.emacs.d/rs_settings/defun")
(load "~/.emacs.d/rs_settings/env")
(load "~/.emacs.d/rs_settings/macros")
(load "~/.emacs.d/rs_settings/bindings")
(load "~/.emacs.d/rs_settings/ido")
(load "~/.emacs.d/rs_settings/tab")
(load "~/.emacs.d/rs_settings/rect")
(load "~/.emacs.d/rs_settings/org")
(load "~/.emacs.d/rs_settings/ibuffer")
(load "~/.emacs.d/rs_settings/abbrev.el")
(load "~/.emacs.d/rs_settings/modes.el")
(load "~/.emacs.d/rs_settings/python_stuff")

;; (load "~/.emacs.d/rs_settings/network")  ;; FIXME
;; (load "~/.emacs.d/rs_settings/delim")  ;; better solution: textmate-mode
;; (load "~/.emacs.d/rs_settings/spelling") ;; is anoying atm
;; (load "~/.emacs.d/rs_settings/latex.el")  ;; auctex stuff not quite working
;; (load "~/.emacs.d/rs_settings/idl")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load in external packages
(load "~/.emacs.d/plugins/external")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; run server
(if (not (server-mode)) (server-start))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; runing shells in mac is oblivious to the shell rc files

(setenv "PATH" "$PATH:/usr/bin/:/utils/ds9/:/utils/p2pp/bin/:/utils/skycat/:~/data1/sw/zhtools/bin:~/data1/sw/misc:~/data1/sw/scripts:~/data1/sw/esaspi:~/data1/sw/esaspi/quick-spec:~/data1/sw/kapi:/usr/local/bin/:~/data1/sw/scripts/:/usr/texbin/")

(setenv "PYTHONPATH" "/usr/local/lib/python2.6/site-packages/:/Users/rs/data1/sw/pythonlibs/:/Users/rs/data1/sw/kapi/")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; parts auto-written by custom set
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(longlines-auto-wrap t)
 '(longlines-wrap-follows-window-size t)
 '(py-shell-name "/usr/bin/python"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window size

(add-to-list 'default-frame-alist '(height . 49))
(add-to-list 'default-frame-alist '(width . 77))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font for mac
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1a1a1a" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Andale Mono")))))
