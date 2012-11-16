;; ;; Turn off mouse interface early in startup to avoid momentary display
;; (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
;;     (when (fboundp mode) (funcall mode -1)))

;; load in setups from files
(load "~/.emacs.d/rs_settings/bindings")
(load "~/.emacs.d/rs_settings/global")
(load "~/.emacs.d/rs_settings/defun")
(load "~/.emacs.d/rs_settings/env")
(load "~/.emacs.d/rs_settings/macros")
(load "~/.emacs.d/rs_settings/ido")
(load "~/.emacs.d/rs_settings/tab")
(load "~/.emacs.d/rs_settings/rect")
(load "~/.emacs.d/rs_settings/org")
(load "~/.emacs.d/rs_settings/ibuffer")
(load "~/.emacs.d/rs_settings/abbrev.el")
(load "~/.emacs.d/rs_settings/modes.el")

;; (load "~/.emacs.d/rs_settings/python_stuff")
;; (load "~/.emacs.d/rs_settings/scratch")
;; (load "~/.emacs.d/rs_settings/network")  ;; FIXME
;; (load "~/.emacs.d/rs_settings/delim")  ;; better solution: textmate-mode
;; (load "~/.emacs.d/rs_settings/spelling") ;; is anoying atm
;; (load "~/.emacs.d/rs_settings/latex.el")  ;; auctex stuff not quite working
;; (load "~/.emacs.d/rs_settings/idl")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load in external packages
(load "~/.emacs.d/plugins/external")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; has to come *after external*
(load "~/.emacs.d/rs_settings/terminal")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; vim keys
;; (load "~/.emacs.d/rs_settings/vim_keys.el")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; run server
;; (if (not (server-mode)) (server-start))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; parts auto-written by custom set
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ediff-diff-options "-w")
 '(jabber-auto-reconnect nil)
 '(jabber-avatar-verbose nil)
 '(jabber-chat-buffer-format "*-jab-%n-*")
 '(jabber-history-enabled t)
 '(jabber-mode-line-mode nil)
 '(jabber-roster-buffer "*-jab-*")
 '(jabber-roster-line-format " %c %-25n %u %-8s (%r)")
 '(jabber-show-offline-contacts t)
 '(jabber-vcard-avatars-retrieve nil)
 '(longlines-auto-wrap t)
 '(longlines-wrap-follows-window-size t)
 '(mediawiki-site-alist (quote (("spt-chan" "https://pole.uchicago.edu/spt-chandra/" "Rsuhada" "" "The XMM-Newton sample"))))
 '(minimap-window-location (quote left))
 '(pomodoro-break-cycle "b "))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window size

(add-to-list 'default-frame-alist '(height . 49))
(add-to-list 'default-frame-alist '(width . 77))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font for mac
;; good fonts: Andale Mono, Inconsolata, Consolas

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#121212" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Andale Mono"))))
 '(bm-fringe-persistent-face ((((class color) (background dark)) (:background "#d0bf8f" :foreground "#d0bf8f"))))
 '(my-linum-hl ((t (:inherit linum :background "#259185"))))
 '(org-level-1 ((t (:foreground "#dfaf8f"))))
 '(org-todo ((t (:foreground "03181F")))))
(put 'ido-exit-minibuffer 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; theme
(load "~/.emacs.d/rs_settings/theme.el")
(set-cursor-color "brown3")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; recursive minibuffer

(setq enable-recursive-minibuffers t)


;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#121212" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Envy Code R")))))
;; (put 'ido-exit-minibuffer 'disabled nil)

;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#121212" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Deja Vu Sans Mono")))))
;; (put 'ido-exit-minibuffer 'disabled nil)

;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#121212" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "apple" :family "Inconsolata")))))
;; (put 'ido-exit-minibuffer 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; works, but has some really crappy features

;; (add-to-list 'load-path "~/.emacs.d/plugins/python-mode.el-6.0.5/")
;; (setq py-install-directory "~/.emacs.d/plugins/python-mode.el-6.0.5/")
;; (require 'python-mode)
;; (setq ipython-command "/usr/local/bin/ipython")
;; (setq python-command "ipython")
;; (setq py-shell-name "ipython")
