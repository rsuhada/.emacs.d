;; mac disable and use the command as the meta key
(setq mac-command-modifier 'meta) ;; Sets the command (Apple) key as Meta
;; (osx-key-mode -1)
;; (setq x-select-enable-clipboard t)

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; Find matching parens
(global-set-key (kbd "C-'") 'match-paren)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

;; Map the window manipulation keys to meta 0, 1, 2, o
(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
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

(global-set-key (kbd "C-;") 'mark-paragraph)
(setq flyspell-auto-correct-binding "C-~") ; flyspell messed w C-;


;; setting mark should be less is clumsy
(global-set-key (kbd "M-ESC") 'cua-set-mark)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fixing ido restrict matches
(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
;;  "Add my keybindings for ido."
(define-key ido-completion-map (kbd "C-SPC") nil)
(define-key ido-completion-map (kbd "C-@") nil)
(define-key ido-completion-map (kbd "C-0") 'ido-restrict-to-matches)
)

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
;; commenting a single line
;; http://www.opensubscriber.com/message/emacs-devel@gnu.org/10971693.html
(defun comment-dwim-line (&optional arg)
"Replacement for the comment-dwim command.  If no region is selected
and current line is not blank and we are not at the end of the
line, then comment current line.  Replaces default behaviour
of comment-dwim, when it inserts comment at the end of the
line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'comment-dwim-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffer flipping
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; better basic movement - ErgoEmacs + my ideas

;; Single char cursor movement. (assuming you are on qwerty)
(global-set-key (kbd "M-j") 'backward-char) ;indent-new-comment-line
(global-set-key (kbd "M-l") 'forward-char)  ;downcase-word
(global-set-key (kbd "M-i") 'previous-line) ;tab-to-tab-stop
(global-set-key (kbd "M-k") 'next-line)     ;command kill-sentence
;; (global-set-key (kbd "M-SPC") 'set-mark-command)

;; kicking the habit
(global-unset-key (kbd "C-b")) ; backward-char
(global-unset-key (kbd "C-f")) ; forward-char
(global-unset-key (kbd "C-p")) ; previous-line
(global-unset-key (kbd "C-n")) ; next-line
;; (global-unset-key (kbd "C-SPC")) ; set-mark-command

;; how to use the freed bindings:
(global-set-key (kbd "C-f") 'find-file) ; ido
(global-set-key (kbd "C-b") 'switch-to-buffer)
(global-set-key (kbd "C-p") 'kill-whole-line)


;; set the -h instead of backspace
(global-set-key "\C-h" 'backward-delete-char-untabify)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

(global-set-key (kbd "M-h") 'backward-kill-word)  ; was mark-paragraph
;; (global-unset-key (kbd "M-h"))

;; more movement improvement
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; function keys
;; (global-unset-key [f5])
(global-set-key [f1]   'ace-jump-char-mode)           ;smex
(global-set-key [S-f1] 'help)
(global-set-key [f2]   'replace-string)
(global-set-key [M-f2] 'replace-regexp)
(global-set-key [f5]   'rgrep)
(global-set-key [f6]   'occur)
(global-set-key [f7]   'bookmark-set)
(global-set-key [f8]   'bookmark-jump)
(global-set-key [f9]   'bookmark-bmenu-list)
(global-set-key [f12]  'switch-to-previous-buffer)






;; defaults f3 - record macro, f4 - end macro/reply
;; (global-set-key [f9]   'start-kbd-macro)
;; (global-set-key [f10]  'end-kbd-macro)


