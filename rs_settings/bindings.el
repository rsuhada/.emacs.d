;; mac disable and use the command as the meta key
(setq mac-command-modifier 'meta) ;; Sets the command (Apple) key as Meta
;; (osx-key-mode -1)
;; (setq x-select-enable-clipboard t)

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was dgit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap
;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode
;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window
;; To help Unlearn C-x 0, 1, 2, o
(global-unset-key (kbd "C-x 3")) ; was split-window-horizontally
(global-unset-key (kbd "C-x 2")) ; was split-window-vertically
(global-unset-key (kbd "C-x 1")) ; was delete-other-windows
(global-unset-key (kbd "C-x 0")) ; was delete-window
(global-unset-key (kbd "C-x o")) ; was other-window


;; flyspell binds
(global-unset-key (kbd "C-\\")) ; was set-input-method
(global-set-key (kbd "C-\\") 'flyspell-auto-correct-word)  ; was M-\t = alt-tab

;; set the -h instead of backspace
(global-set-key "\C-h" 'backward-delete-char-untabify)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

(global-set-key (kbd "M-h") 'backward-kill-word)  ; was mark-paragraph
;; (global-unset-key (kbd "M-h"))
(global-set-key (kbd "C-;") 'mark-paragraph)  ; was aquamacs switching meta and command - wtf would this have a shortcut
(global-unset-key (kbd "C-;"))


;; function keys
(global-unset-key [f5])

(global-set-key [f1]  'replace-string)
(global-set-key [f2]  'replace-regexp)
(global-set-key [f3]  'rgrep)
(global-set-key [f9]  'start-kbd-macro)
(global-set-key [f10]  'end-kbd-macro)
(global-set-key [f11] 'occur)
(global-set-key [f12] 'help)
