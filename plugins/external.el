;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load in external modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; here you'll find simple .el extensions
(add-to-list 'load-path
              "~/.emacs.d/plugins/misc")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippet

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-theme

(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")

;; standard color theme installation: also use Options/Appearance/Adopt*as Default
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      ;; (color-theme-billw)))
;;      (color-theme-rs-dark01)))

(require 'zenburn)
(zenburn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; raninbow delims
(require 'rainbow-delimiters)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'text-mode-hook 'rainbow-delimiters-mode)
(add-hook 'latex-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; select/copy/cut/paste whole line if no selection
;; (require 'whole-line-or-region)
(load "tellicopy")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autopair
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rectangular
(require 'rect-mark)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flymake + pyflakes = automatic python code checking
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;      ; Make sure it's not a remote buffer or flymake would not work
;;      (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
;;       (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                          'flymake-create-temp-inplace))
;;              (local-file (file-relative-name
;;                           temp-file
;;                           (file-name-directory buffer-file-name))))
;;         (list "pyflakes" (list local-file)))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))

;; ;; less aggressive coloring
;; '(flymake-errline ((((class color)) (:background "LightPink" :foreground "black"))))
;; '(flymake-warnline ((((class color)) (:background "LightBlue2" :foreground "black"))))

;; ;; mac os doesn't have texify so try this
;; (defun flymake-get-tex-args (file-name)
;;     (list "latex" (list "-file-line-error-style" file-name)))

;; (setq flymake-gui-warnings-enabled nil)