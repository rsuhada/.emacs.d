;;; Snippets make typing fun

(require 'dropdown-list)

(yas/global-mode 1)
(add-hook 'shell-script-mode-hook 'yas/minor-mode-on)


(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

(setq yas/prompt-functions '(yas/ido-prompt
                             yas/dropdown-prompt
                             yas/completing-prompt))

;; Replace yasnippets's TAB
(add-hook 'yas/minor-mode-hook
          (lambda () (define-key yas/minor-mode-map
                       (kbd "TAB") 'smart-tab))) ; was yas/expand
