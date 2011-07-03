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
;; (global-unset-key (kbd "C-;"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; better word-at-point search
;; http://sachachua.com/blog/2008/07/emacs-keyboard-shortcuts-for-navigating-code/

(defun sacha/isearch-yank-current-word ()
  "Pull current word from buffer into search string."
  (interactive)
  (save-excursion
    (skip-syntax-backward "w_")
    (isearch-yank-internal
     (lambda ()
       (skip-syntax-forward "w_")
       (point)))))
(define-key isearch-mode-map (kbd "C-x") 'sacha/isearch-yank-current-word)

(defun sacha/search-word-backward ()
  "Find the previous occurrence of the current word."
  (interactive)
  (let ((cur (point)))
    (skip-syntax-backward "w_")
    (goto-char
     (if (re-search-backward (concat "\\_<" (current-word) "\\_>") nil t)
	 (match-beginning 0)
       cur))))

(defun sacha/search-word-forward ()
  "Find the next occurrance of the current word."
  (interactive)
  (let ((cur (point)))
    (skip-syntax-forward "w_")
    (goto-char
     (if (re-search-forward (concat "\\_<" (current-word) "\\_>") nil t)
	 (match-beginning 0)
       cur))))
(global-set-key '[M-up] 'sacha/search-word-backward)
(global-set-key '[M-down] 'sacha/search-word-forward)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; function keys
;; (global-unset-key [f5])
(global-set-key [f1]   'smex)
(global-set-key [S-f1] 'help)
(global-set-key [f2]   'replace-string)
(global-set-key [S-f2] 'replace-regexp)
(global-set-key [f5]   'rgrep)
(global-set-key [f6]   'occur)
(global-set-key [f7]   'bookmark-set)
(global-set-key [f8]   'bookmark-jump)
(global-set-key [f9]   'bookmark-bmenu-list)


;; Defaults f3 - record macro, f4 - end macro/reply
;; (global-set-key [f9]   'start-kbd-macro)
;; (global-set-key [f10]  'end-kbd-macro)


