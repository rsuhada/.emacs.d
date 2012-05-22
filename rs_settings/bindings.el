;; mac disable and use the command as the meta key
(setq mac-command-modifier 'meta) ;; Sets the command (Apple) key as Meta
;; (osx-key-mode -1)
;; (setq x-select-enable-clipboard t)

;; Repeat
(global-set-key [(control z)] 'repeat) ; was suspend-frame

;; tweak for motion
(defun back-to-indentation-or-beginning ()
  (interactive)
  (if (= (point) (save-excursion (back-to-indentation) (point)))
      (beginning-of-line)
    (back-to-indentation)))

(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning) ;; was move-beginning-of-line

;; (defun move-end-of-line-or-next-line ()
;;   (interactive)
;;   (if (eolp)
;;       (next-line)
;;       (move-end-of-line nil)))
;; (global-set-key "\C-e" 'move-end-of-line-or-next-line) ; was move-end-of-line

;; Find matching parens
(global-set-key (kbd "C-'") 'goto-match-paren)

;; ibuffer > list-buffers
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-x C-b") 'switch-to-buffer)

;; save
;; (global-set-key (kbd "C-x s") 'save-buffer) ;; was save-some-buffers
(global-set-key (kbd "C-x s") 'use-emacs-keys)
(global-set-key (kbd "C-x C-s") 'use-emacs-keys)
(global-set-key (kbd "M-s") 'save-buffer) ;; was save-some-buffers

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
(setq flyspell-auto-correct-previous-word "C-+") ; flyspell messed w C-;
(global-set-key (kbd "C-\`") 'flyspell-auto-correct-previous-word)
(setq flyspell-auto-correct-word "C-M-~") ; flyspell messed w C-.
(global-set-key (kbd "C-M-\`") 'flyspell-auto-correct-word)


;; setting mark should be less clumsy
(global-set-key (kbd "M-ESC") 'cua-set-mark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbrev temporary patch

(add-hook 'abbrev-mode-hook
            (lambda ()
              (local-set-key (kbd "_") 'protect-underscore)
              (local-set-key (kbd "-") 'protect-dash)
              (local-set-key (kbd "=") 'protect-equal)
))

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
;; help me unlearn arrorw

(defun use-emacs-keys () (interactive)
"Remind me to use emacs move keys not arrows!!"
(message "Use emacs keys!!"))

(global-set-key '[up] 'use-emacs-keys)
(global-set-key '[down] 'use-emacs-keys)
(global-set-key '[left] 'use-emacs-keys)
(global-set-key '[right] 'use-emacs-keys)

(global-set-key (kbd "\C-x \C-h") 'mark-whole-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; search

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
;; (global-set-key (kbd "C-M-r") 'isearch-backward)


;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

;; Jump to a definition in the current file. (Protip: this is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)


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
;; comment paragraph
(defun comment-paragraph ()
  "Comment current region. Shortcut to C-; M-;"
  (interactive)
  (mark-paragraph)
  (comment-dwim-line)
  )

(global-set-key "\M-'" 'comment-paragraph)

(global-set-key "\M-]" 'rs-comment-line-separator-macro)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; breadcrumb
;; (global-set-key [(meta f1)] 'bc-set)
;; (global-set-key [(meta left)] 'bc-previous)
;; (global-set-key [(meta right)] 'bc-next)
;; ;; (global-set-key [(meta left)] 'bc-local-previous)
;; ;; (global-set-key [(meta right)] 'bc-local-next)
;; ;; (global-set-key [(control c)(j)] 'bc-goto-current)
;; (global-set-key [(control x)(meta j)] 'bc-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffer flipping
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; duplicate & comment

(defun djcb-duplicate-line (&optional comment line)
"Duplicate the line containing the point.
\nIf COMMENT is non-nil, also comment out the original line.
If LINE is non-nil, duplicate that line instead."
(interactive "P")
(let ((col (current-column)))
(save-excursion
(when line
(goto-line line))
(let ((line (buffer-substring (point-at-bol) (point-at-eol))))
(when comment
(comment-region (point-at-bol) (point-at-eol)))
(goto-char (point-at-eol))
(if (eobp)
(newline)
(forward-line 1))
(open-line 1)
(insert line)))
(forward-line 1)
(move-to-column col)))

(global-set-key (kbd "M-[") (lambda()(interactive)(djcb-duplicate-line t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; select parantheis with C-M-u SPC

(defun backward-up-sexp (arg)
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp)

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

;; per word movement
(global-set-key (kbd "C-M-l") 'forward-word)  ; reposition-window
(global-set-key (kbd "C-M-j") 'backward-word)   ; indent-new-comment-line

;; how to use the freed bindings:
(global-set-key (kbd "C-f") 'find-file) ; ido
;; (global-set-key (kbd "C-b") 'switch-to-buffer)
(global-set-key (kbd "C-b") 'anything)
;; (global-set-key (kbd "C-p") 'kill-whole-line)  ; unecessary after C-w moded to kill-region-or-line
(global-set-key (kbd "C-n") 'ace-jump-char-mode)

;; set the -h instead of backspace
(global-set-key "\C-h" 'backward-delete-char-untabify)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

(global-set-key (kbd "M-h") 'backward-kill-word)  ; was mark-paragraph
(global-set-key (kbd "M-H") 'backward-kill-sexp)  ; was mark-defun (only relevant for lisp)
(global-set-key (kbd "M-D") 'kill-sexp)  ; was mark-paragraph
;; (global-unset-key (kbd "M-h"))

;; more movement improvement
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-Z") 'zap-copy-up-to-char)

;; (global-set-key (kbd "M-z") 'hungry-delete-backward)

;; (global-set-key (kbd "M-enter") 'org-meta-enter) ;FIXME
;; (global-set-key [?\e (return)] 'org-meta-return)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; function keys
;; (global-unset-key [f5])
;; (global-set-key [f1]    'ace-jump-char-mode)           ;smex
;; (global-set-key [S-f1]  'ace-jump-word-mode)
;; (global-set-key [M-f1]  'ace-jump-line-mode)

(global-set-key [f1]   'er/expand-region)
(global-set-key [S-f1] 'er/contract-region)
(global-set-key [C-M-f1] 'mark-word)
(global-set-key [M-f1] 'rs-macro/mark-line)

(global-set-key (kbd "M-m")   'er/expand-region)
(global-set-key (kbd "M-M")   'er/contract-region)
(global-set-key (kbd "C-M-m")   'rs-macro/mark-line)


(global-set-key [f2]    'replace-string)
(global-set-key [M-f2]  'replace-regexp)

(global-set-key [f5]    'rgrep)
(global-set-key [f6]    'occur)

;; (global-set-key [f7]   'bookmark-set)
;; (global-set-key [S-f7] 'bookmark-bmenu-list)
;; (global-set-key [M-f7] 'bookmark-jump)

;; (global-set-key [f7]   'er/expand-region)
;; (global-set-key [M-f7] 'er/contract-region)
;; (global-set-key [C-M-f7] 'mark-word)

;; (global-set-key [f8] 'deft)
(global-set-key [f9]   'switch-to-previous-buffer)
(global-set-key [C-f9]   'next-user-buffer)
(global-set-key [C-M-f9]   'previous-user-buffer)
(global-set-key [f10]   'unexpand-abbrev)

;; (global-set-key [f10] 'rm-set-mark)
;; (global-set-key [S-f10] 'rm-kill-ring-save)
;; (global-set-key [M-f10] 'rm-kill-region)

;; (global-set-key [f11]   'orgtaby)
;; (global-set-key [S-f11] 'orguntaby)

;; (global-set-key [f12]   'switch-to-previous-buffer)

;; (global-set-key [f12] 'deft)
(global-set-key [f12] 'sunrise)
(global-set-key [S-f12] 'help)

;; defaults f3 - record macro, f4 - end macro/reply
;; (global-set-key [f9]   'start-kbd-macro)
;; (global-set-key [f10]  'end-kbd-macro)


;; (dolist (command '(yank yank-pop))
;;   (eval `(defadvice ,command (after indent-region activate)
;;            (and (not current-prefix-arg)
;;                 (member major-mode '(emacs-lisp-mode lisp-mode
;;                                                      clojure-mode    scheme-mode
;;                                                      haskell-mode    ruby-mode
;;                                                      rspec-mode      python-mode
;;                                                      c-mode          c++-mode
;;                                                      objc-mode       latex-mode
;;                                                      plain-tex-mode))
;;                 (let ((mark-even-if-inactive transient-mark-mode))
;;                   (indent-region (region-beginning) (region-end) nil))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; insert word to minibuffer ala isearch
;; credit: scottfrazer

(defun my-minibuffer-insert-word-at-point ()
  "Get word at point in original buffer and insert it to minibuffer."
  (interactive)
  (let (word beg)
    (with-current-buffer (window-buffer (minibuffer-selected-window))
      (save-excursion
        (skip-syntax-backward "w_")
        (setq beg (point))
        (skip-syntax-forward "w_")
        (setq word (buffer-substring-no-properties beg (point)))))
    (when word
      (insert word))))

(defun my-minibuffer-setup-hook ()
  (local-set-key (kbd "C-w") 'my-minibuffer-insert-word-at-point))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; copy to end of line-spacing

(defun copy-end-line (&optional arg)
  "Copy to the kill ring from point to the end of the current line.
    With a prefix argument, copy that many lines from point. Negative
    arguments copy lines backward. With zero argument, copies the
    text before point to the beginning of the current line."
  (interactive "p")
  (save-excursion
    (copy-region-as-kill
     (point)
     (progn (if arg (forward-visible-line arg)
              (end-of-visible-line))
            (1-(point))))))

(global-set-key (kbd "C-c k") 'copy-end-line) ; C-u - C-c k copies backward


(defun kill-line-backward ()
  "Kill text between the beginning of the line to the cursor position.
If there's no text, delete the previous line ending."
  (interactive)
  (if (looking-back "\n")
      (delete-char -1)
    (kill-line 0)
    )
  )

(global-set-key (kbd "C-c u") 'kill-line-backward) ; C-u - C-c k copies backward

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; misc. mode fixes (for broken bindings)

(defun idl-save-binding-fix ()
"removing the M-s binding. originally: idlwave-edit-in-idlde"
  (local-set-key (kbd "M-s") 'save-buffer))

(add-hook 'idlwave-mode-hook 'idl-save-binding-fix)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; open line

;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
    See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one.
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

;; Autoindent open-*-lines
(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

;; (global-set-key (kbd "M-o") 'open-previous-line)
;; (global-set-key (kbd "C-o") 'open-next-line)

(global-set-key [S-return]   'open-next-line)
(global-set-key [M-S-return] 'open-previous-line)


;; mark line
;; FIXME not working
;; (defun mark-line (arg)
;;   "Mark current line"
;;   (interactive "p")
;;   (save-excursion
;;   ;; (beginning-of-line)
;;     (line-beginning-position)
;;   (push-mark
;;      (if (and (eq last-command this-command) (mark t))
;; 	 (goto-char (mark)))
;;      ;; (end-of-line)
;;     (line-end-position)
;;      (point))
;;    nil t))
