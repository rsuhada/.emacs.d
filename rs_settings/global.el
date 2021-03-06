;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; line numbering
(global-linum-mode 1)
(setq column-number-mode  t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; highlight current line
(global-hl-line-mode 1)

;; undelrine instead of highlighting
;; (set-face-attribute hl-line-face nil :underline t)

;; ;; To customize the background color
;; (set-face-background 'hl-line "#330")   ; original yellow
;; (set-face-background 'hl-line "#0a2832")  ; original blue for solarized
(set-face-background 'hl-line "#0d3340") ; brighter blue for solarized
(set-face-foreground 'highlight nil)
(set-face-foreground 'hl-line nil)

;; alternative
;; (require 'hl-line+)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color current line in the left border - from stackowerflow

;; FIXME: could be refactored wo hl-line for my purposes

;; If the foreground and background don't match nicely, you can assign a
;; foreground colour explicitly with M-x customize-face RET my-linum-hl
;; RET

(require 'hl-line)
(defface my-linum-hl
  `((t :inherit linum :background ,(face-background 'hl-line nil t)))
  "Face for the current line number."
  :group 'linum)

(defvar my-linum-format-string "%3d")

(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

(defun my-linum-get-format-string ()
  (let* ((width (1+ (length (number-to-string
                             (count-lines (point-min) (point-max))))))
         (format (concat "%" (number-to-string width) "d")))
    (setq my-linum-format-string format)))

(defvar my-linum-current-line-number 1)

(setq linum-format 'my-linum-format)

(defun my-linum-format (line-number)
  (propertize (format my-linum-format-string line-number) 'face
              (if (eq line-number my-linum-current-line-number)
                  'my-linum-hl
                'linum)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autosave sessions
(setq desktop-dirname             "~/"
      desktop-base-file-name      ".emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil)
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; higlhlight parens

(show-paren-mode t)
(setq show-paren-delay 0)           ; how long to wait?
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'
;; (set-face-background 'show-paren-match-face "#333")
;; (set-face-foreground 'show-paren-match-face "#eee")

(set-face-attribute 'show-paren-match-face t
        :weight 'bold :underline nil :overline nil :slant 'normal)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; no menu
;; (menu-bar-mode -1)
;; (tool-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; no scratch blurb

;; Disable startup message in scratch buffer
(setq-default initial-scratch-message nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-revert
;; (global-auto-revert-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; zsh mode
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set transient mark mode (needed for hippie-expand/smart tab)
(setq transient-mark-mode t)
(setq deactivate-mark nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text mode will be default
(setq default-major-mode 'text-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; isearch tweaks

;; (add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
;; (defun my-goto-match-beginning ()
;;   (when isearch-forward (goto-char isearch-other-end)))
;; (defadvice isearch-exit (after my-goto-match-beginning activate)
;;   "Go to beginning of match."
;;   (when isearch-forward (goto-char isearch-other-end)))


;; (defadvice isearch-search (after isearch-no-fail activate)
;;   (unless isearch-success
;;     (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
;;     (ad-activate 'isearch-search)
;;     (isearch-repeat (if isearch-forward 'forward))
;;     (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
;;     (ad-activate 'isearch-search)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add smooth scrolling

;; this didn't quite work
;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/")
;; (require 'smooth-scroll)
;; (smooth-scroll-mode t)


(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; mouse scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed t)

;; faster scrolling?
;; (setq jit-lock-defer-time 0.05)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; kill the bell
(setq ring-bell-function 'ignore)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 500)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(global-set-key "\C-x\ \C-r" 'ido-recentf-open)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; unique file names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator ":")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; frame title
;; (setq frame-title-format '("Emacs @ " system-name ": %b %+%+ %f"))
(setq frame-title-format '("%f"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cursor shape

(setq-default cursor-type 'bar)         ; defult: box


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emerge setting

(setq emerge-diff-options "--ignore-all-space")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make scripts executable

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; calendar setting
(setq calendar-week-start-day 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; moving text
;; (defun move-text-internal (arg)
;;   (cond
;;    ((and mark-active transient-mark-mode)
;;     (if (> (point) (mark))
;;         (exchange-point-and-mark))
;;     (let ((column (current-column))
;;           (text (delete-and-extract-region (point) (mark))))
;;       (forward-line arg)
;;       (move-to-column column t)
;;       (set-mark (point))
;;       (insert text)
;;       (exchange-point-and-mark)
;;       (setq deactivate-mark nil)))
;;    (t
;;     (let ((column (current-column)))
;;       (beginning-of-line)
;;       (when (or (> arg 0) (not (bobp)))
;;         (forward-line)
;;         (when (or (< arg 0) (not (eobp)))
;;           (transpose-lines arg))
;;         (forward-line -1))
;;       (move-to-column column t)))))

;; (defun move-text-down (arg)
;;   "Move region (transient-mark-mode active) or current line
;;   arg lines down."
;;   (interactive "*p")
;;   (move-text-internal arg))

;; (defun move-text-up (arg)
;;   "Move region (transient-mark-mode active) or current line
;;   arg lines up."
;;   (interactive "*p")
;;   (move-text-internal (- arg)))


;; (global-set-key [M-up] 'move-text-up)
;; (global-set-key [M-down] 'move-text-down)


(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(defun move-line-region-up (start end n)
  (interactive "r\np")
  (if (region-active-p) (move-region-up start end n) (move-line-up n)))

(defun move-line-region-down (start end n)
  (interactive "r\np")
  (if (region-active-p) (move-region-down start end n) (move-line-down n)))

(global-set-key [M-S-up] 'move-line-region-up)
(global-set-key [M-S-down] 'move-line-region-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq next-line-add-newlines t)
;; move newline ads newline


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ediff

;; ignore whitespace
(custom-set-variables
 '(ediff-diff-options "-w"))

(setq ediff-split-window-function (lambda (&optional arg)
(if (> (frame-width) 70)
    (split-window-horizontally arg)
  (split-window-vertically arg))))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Use command as the meta key
; (setq ns-command-modifier (quote meta))

; Don't show the startup screen
; (setq inhibit-startup-message t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; redefine zap-to-char to zap-up-to-char

(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
  "Kill up to the ARG'th occurence of CHAR, and leave CHAR. If
  you are deleting forward, the CHAR is replaced and the point is
  put before CHAR"
  (insert char)
  (if (< 0 arg) (forward-char -1)))


;; inserts an additional character
(defun zap-copy-up-to-char (arg char)
  "Zap to a character, but save instead of kill."
  (interactive "p\ncZap to char: ")
  (save-excursion
    (zap-to-char arg char)
    (yank)
    (delete-char 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; kill-line-or-region

(put 'kill-ring-save 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))
(put 'kill-region 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; re-builder

(require 're-builder)
(setq reb-re-syntax 'string)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; comments

(setq-default comment-start "#")

(add-hook 'text-mode-hook (lambda () (setq comment-start "#")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbrevs for comments

;; FIXME: won't work for inline comments
;; expand function for languages with
(defun hash-comment-mode-abbrev-expand-function (expand)
  (if (not (save-excursion (back-to-indentation) (eq (char-after) ?#)))
      ;; Performs normal expansion.
      (funcall expand)
    ;; We're inside a comment: use the text-mode abbrevs.
    (let ((local-abbrev-table text-mode-abbrev-table))
      (funcall expand))))

;; hooks
(add-hook 'python-mode-hook
          #'(lambda ()
              (add-hook 'abbrev-expand-functions
                        'hash-comment-mode-abbrev-expand-function
                        nil t)))

;; ;; FIXME: not working
;; (add-hook 'shell-script-mode-hook
;;           #'(lambda ()
;;               (add-hook 'abbrev-expand-functions
;;                         'hash-comment-mode-abbrev-expand-function
;;                         nil t)))

;; FIXME: not working
(add-hook 'ess-mode-hook
          #'(lambda ()
              (add-hook 'abbrev-expand-functions
                        'hash-comment-mode-abbrev-expand-function
                        nil t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto pair paren/quotes - currently supperior to electric pair ans also to
;; textmate-mode

;; enable skeleton-pair insert globally
(setq skeleton-pair t)
(setq skeleton-pair-on-word 0) ; apply skeleton trick even in front of a word.
(global-set-key (kbd "(")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "[")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "{")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "*") 'skeleton-pair-insert-maybe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dired settings

;; How to make dired use the same buffer for viewing directory,
;; instead of spawning many?

(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "<return>")
    'dired-find-alternate-file) ; was dired-advertised-find-file
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))


(defun open-in-external-app ()
  "Open the current file or dired marked files in external app.
Works in Microsoft Windows, Mac OS X, Linux."
  (interactive)
  (let ( doIt
         (myFileList
          (cond
           ((string-equal major-mode "dired-mode") (dired-get-marked-files))
           (t (list (buffer-file-name))) ) ) )

    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files?") ) )

    (when doIt
      (cond
       ((string-equal system-type "windows-nt")
        (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList)
        )
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "open" fPath)) )  myFileList) )
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath)) ) myFileList) ) ) ) ) )

(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
                '("\\.zip\\'" ".zip" "unzip")))

(defun dired-mouse-find-alternate-file (event)
  "In dired, visit the file or directory you click on instead of
the dired buffer."
  (interactive "e")
  (let (file)
    (save-excursion
      (set-buffer (window-buffer (posn-window (event-end event))))
      (save-excursion
        (goto-char (posn-point (event-end event)))
        (setq file (dired-get-filename))))
    (select-window (posn-window (event-end event)))
    (find-alternate-file (file-name-sans-versions file t))))

;; (require 'dired-isearch)
;; (eval-after-load "dired"
;;   '(progn
;;      (define-key dired-mode-map (kbd "C-s") 'dired-isearch-forward)
;;      (define-key dired-mode-map (kbd "C-r") 'dired-isearch-backward)
;;      (define-key dired-mode-map (kbd "ESC C-s") 'dired-isearch-forward-regexp)
;;      (define-key dired-mode-map (kbd "ESC C-r")
;;        'dired-isearch-backward-regexp)))

;; e no longer does RET, instead does C-c C-x or whatever
(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map (kbd "C-s") 'dired-isearch-filenames)
             (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)
             (define-key dired-mode-map "/" 'dired-isearch-filenames)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; send buffer path to kill ring

(defun filename-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name: %s" filename))))

;; (global-set-key [f12] 'filename-to-clipboard)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; google stuff - there ius also a hel module but this is
;; faster/slimmer

(defun google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
       (read-string "Google: "))))))
(global-set-key (kbd "C-c g") 'google)

(require 'webjump)
(global-set-key (kbd "C-c j") 'webjump)

;; (setq webjump-sites
;;       (append '(
;;   ("Wikipedia" .
;;      [simple-query "en.wikipedia.org" "en.wikipedia.org/w/index.php?title=Special:&search=" ""])
;;   ("stackoverflow" .
;;      [simple-query "stackoverflow.com" "stackoverflow.com/search?q=" ""])
;;   ("Reddit Search" .
;;    [simple-query "www.reddit.com" "http://www.reddit.com/searccs"])
;;   ("Google Image Search" .
;;    [simple-query "images.google.com" "images.google.com/images?hl=en&q=" ""])
;;   ("Flickr Search" .
;;    [simple-query "www.flickr.com" "flickr.com/search/?q=" ""])
;;   )
;;        webjump-sample-sites))


(setq webjump-sites
      '(
  ("Wikipedia" .
     [simple-query "en.wikipedia.org" "en.wikipedia.org/w/index.php?title=Special:&search=" ""])
  ("stackoverflow" .
     [simple-query "stackoverflow.com" "stackoverflow.com/search?q=" ""])
  ("Reddit Search" .
   [simple-query "www.reddit.com" "http://www.reddit.com/search?q=" ""])
  ("Emacs Wiki" .
     [simple-query "www.emacswiki.org"
		   "www.emacswiki.org/cgi-bin/wiki/" ""])
  ("Google" .
     [simple-query "www.google.com"
		   "www.google.com/search?q=" ""])
  ("gm google maps" . [simple-query "maps.google.com" "https://maps.google.com/maps?q=" ""])
  ("gi Google Image Search" .
   [simple-query "images.google.com" "images.google.com/images?hl=en&q=" ""])
  ("Flickr Search" .
   [simple-query "www.flickr.com" "flickr.com/search/?q=" ""])
  )
       webjump-sample-sites)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python path

(setenv "PYTHONPATH" "/usr/local/lib/python2.6/site-packages/:/Users/rs/data1/sw/pythonlibs/rs:/Users/rs/data1/sw/kapi:/Users/rs/data1/sw/esaspi/py/:/Users/rs/data1/sw/kapi:/Users/rs/data1/sw/esaspi/sb/:/Users/rs/data1/sw/esaspi/py/test/:/Users/rs/data1/sw/esaspi/sb/:")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; irc

;; (erc :server "irc.freenode.net" :port 6667 :nick "rs")
(setq erc-autojoin-channels-alist
          '(("freenode.net" "#emacs" "#wiki")))
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-input-line-position -2)

(provide 'erc-nick-colors)

(define-minor-mode ncm-mode "" nil
  (:eval
   (let ((ops 0)
         (voices 0)
         (members 0))
     (maphash (lambda (key value)
                (when (erc-channel-user-op-p key)
                  (setq ops (1+ ops)))
                (when (erc-channel-user-voice-p key)
                  (setq voices (1+ voices)))
                (setq members (1+ members)))
              erc-channel-users)
     (format " %S/%S/%S" ops voices members))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; builtin winner mode

(when (fboundp 'winner-mode)
  (winner-mode 1))

(windmove-default-keybindings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setup windows

(defun rs/window-setup-debuging ()
  "Prepare windows for debuging"
  (interactive)
  (split-window-vertically)
  (enlarge-window (round (/ (window-height (next-window)) 2.7))))

;; prevent window automatic window splitting
;; (setq same-window-regexps '("."))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; time in modeline

(display-time-mode 1)

(defface egoge-display-time
  '((((type x w32 mac))
     ;; #060525 is the background colour of my default face.
     (:foreground "#060525" :inherit bold))
    (((type tty))
     (:foreground "blue")))
  "Face used to display the time in the mode line.")
;; This causes the current time in the mode line to be displayed in
;; `egoge-display-time-face' to make it stand out visually.
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " ")
                    'face 'egoge-display-time)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tramp settings

(setq tramp-verbose 1)                  ; 0 - silent, 1 - errors, 3 -
                                        ; default, 10 - debug


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ctags / etags

(setq tags-revert-without-query t)

(setq path-to-pytags "/Users/rs/data1/sw/scripts/buildpytags") ;; wrapper that fixes problem w import
(defun create-pytags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s %s" path-to-pytags dir-name (directory-file-name dir-name)))
  )

;; auto refresh tags
(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))
(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command
   (format "%s" path-to-pytags))
  (let ((tags-revert-without-query t))  ; don't query, revert silently
    (visit-tags-table default-directory nil)))

;; auto jump
(global-set-key (kbd "C-x C-M-1") 'find-tag) ; bind to some unused placeholder
(global-set-key (kbd "C-x C-M-2") 'find-tag-other-window) ; bind to some unused placeholder
(global-set-key (kbd "M-.") (kbd "C-x C-M-1 <return>"))
(global-set-key (kbd "C-c M-.") (kbd "C-x C-M-2 <return>"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; latex

;; (defun my-tex-mode-hook ()
;; (local-set-key (kbd "C-c C-c") 'compile))
;; (add-hook 'LaTeX-mode-hook 'my-tex-mode-hook)

;;  (add-hook 'LaTeX-mode-common-hook
;;             (lambda ()
;;               (message "OK")
;;               (local-set-key (kbd "C-c C-c") 'compile))
;; )

;; (add-hook 'LaTeX-mode-common-hook
;;   (lambda ()
;;     (set (make-local-variable 'compile-command) "./compile_osx.sh")))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lowcase (builtin doesn't work?)

(defun lowcase ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward ".+" nil t)
      (replace-match (downcase (match-string 0)) t))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; vim open line

;; (defun vi-open-line-above ()
;;   "Insert a newline above the current line and put point at beginning."
;;   (interactive)
;;   (unless (bolp)
;;     (beginning-of-line))
;;   (newline)
;;   (forward-line -1)
;;   (indent-according-to-mode))

;; (defun vi-open-line-below ()
;;   "Insert a newline below the current line and put point at beginning."
;;   (interactive)
;;   (unless (eolp)
;;     (end-of-line))
;;   (newline-and-indent))

;; (global-set-key (kbd "C-o") 'vi-open-line-below)
;; ;; (global-set-key (kbd "C-S-o") 'vi-open-line-above)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sum-column

(defun sum-column()
  "Sums a column of numbers starting at point. Needs at least one
   empty line at the end of the column to insert result"
  (interactive)
  (save-excursion
    (if (and (not (= (current-column) 0))
	     (re-search-backward "[ \t]" 0 t ))
	(forward-char))
    (let ((retn 0)
	  (old-column (current-column))
	  (old-next-line-add-newlines))
      (setq next-line-add-newlines nil)
      (while (not
	      (looking-at "^[ \t]*$"))
	(move-to-column old-column t)
	(if (and (looking-at "-?[0123456789]+")
		 (eq (current-column) old-column))
		(setq retn (+ retn (string-to-number (current-word)))))
	(next-line)
	(beginning-of-line))
      (next-line)
      (next-line)
      (move-end-of-line 0)
      (insert (make-string (- old-column (current-column)) 32))
      (insert (number-to-string retn))
      (setq next-line-add-newlines old-next-line-add-newlines)
      retn)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; commonly used register files

;; (defun pe ()
;;  "Open a file containing frequently used Unicode chars"
;;  (interactive)
;;  (find-file "/Users/rs/example.txt"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; text mode fill paragrph

(defun maybe-fill-paragraph (&optional justify region)
  "Fill paragraph at or after point (see `fill-paragraph').

Does nothing if `visual-line-mode' is on."
  (interactive (progn
    	 (barf-if-buffer-read-only)
    	 (list (if current-prefix-arg 'full) t)))
  (or visual-line-mode
      (fill-paragraph justify region)))

;; Replace M-q with new binding:

(add-hook 'text-mode-hook
  (defun cjm-fix-text-mode ()
    (define-key text-mode-map "\M-q" 'maybe-fill-paragraph)
    (remove-hook 'text-mode-hook 'cjm-fix-text-mode)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; incrementing and renumbering

;; renumber region
(defun renumber (start end &optional num)
  "Renumber the list items in the current START..END region.
    If optional prefix arg NUM is given, start numbering from that number
    instead of 1."
  (interactive "*r\np")
  (save-excursion
    (goto-char start)
    (setq num (or num 1))
    (save-match-data
      (while (re-search-forward "[0-9]+]" end t)
        (replace-match (number-to-string num))
        (setq num (1+ num))))))

(defun renumber-array-index (start end &optional num)
  "renumber for array indexe [i]"
  (interactive "*r\np")
  (save-excursion
    (goto-char start)
    (setq num (or num 1))
    (save-match-data
      (while (re-search-forward "[[0-9]+]" end t)
        (replace-match (format "%s%s%s" "[" (number-to-string num) "]"))
        (setq num (1+ num))))))


;;  these funcntions are useful in macros
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789")
        (when (re-search-forward "[0-9]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "d")
                                 answer)))))))

(defun decrement-number-decimal (&optional arg)
  (interactive "p*")
  (my-increment-number-decimal (if arg (- arg) -1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; advice the search functions

(defadvice compilation-start (after compilation-start-maximize activate)
  (when (equal mode 'grep-mode)
    (switch-to-buffer "*grep*")
    ;; you may want to maximize the buffer
    (delete-other-windows)))


(defadvice occur-1 (before occur-maximize activate)
  (window-configuration-to-register ?>)) ; use some uncommon reg name

(defadvice occur-1 (after occur-maximize activate)
  (other-window 1)
  (next-line 1))

(defun occur-mode-quit ()
  "Quit and close occur window. I want to press 'q' and leave things as they were before in regard of the split of windows in the frame.
This is the equivalent of pressing C-x 0 and reset windows in the frame, in whatever way they were,
plus jumping to the latest position of the cursor which might have been changed by using the links out
of any of the matches found in occur."
  (interactive)
  (switch-to-buffer "*Occur*")
  ;; in order to know where we put the cursor thay might have jumped from qoccur
  (other-window 1)                  ;; go to the main window
  (point-to-register ?<)            ;; store the latest cursor position
  (switch-to-buffer "*Occur*")      ;; go back to the occur window
  ;; (kill-buffer "*Occur*")           ;; FIXME: test if should or not
  (jump-to-register ?>)             ;; reset the original frame state
  (register-to-point ?<))           ;; re-position cursor

(defun occur-browse-next ()
  (interactive)
  (next-line 1)
  (occur-mode-display-occurrence))

(defun occur-browse-previous ()
  (interactive)
  (previous-line 1)
  (occur-mode-display-occurrence))

;; some key bindings defined below. Use "p" ans "n" as in dired mode (without Cntrl key) for previous and next line; just show occurrence without leaving the "occur" buffer; use RET to display the line of the given occurrence, instead of jumping to i,t which you do clicking instead;  also quit mode with Ctrl-g.
(define-key occur-mode-map (kbd "q") 'occur-mode-quit)
(define-key occur-mode-map (kbd "C-q") 'occur-mode-quit)
(define-key occur-mode-map (kbd "C-g") 'occur-mode-quit)
(define-key occur-mode-map (kbd "C-RET") 'occur-mode-goto-occurrence-other-window)
(define-key occur-mode-map (kbd "C-<up>") 'occur-mode-goto-occurrence-other-window)
(define-key occur-mode-map (kbd "RET") 'occur-mode-display-occurrence)
(define-key occur-mode-map (kbd "p") 'previous-line)
(define-key occur-mode-map (kbd "n") 'next-line)
(define-key occur-mode-map (kbd "M-n") 'occur-browse-next)
(define-key occur-mode-map (kbd "M-p") 'occur-browse-previous)