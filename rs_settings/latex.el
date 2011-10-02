;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic setup

(add-to-list 'load-path
             "~/emacs/plugins/auctex-11.86")
(load "auctex.el" nil t t)

(add-to-list 'load-path
             "~/emacs/plugins/auctex-11.86/preview")
(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq TeX-save-query nil)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode nil)
(setq preview-image-type (quote dvipng))

