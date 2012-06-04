;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; line numbering
(global-linum-mode 1)
(setq column-number-mode  t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; current line in the left border - from stackowerflow

;; FIXME: could be refactored wo hl-line for my purposes
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

(defvar my-linum-current-line-number 0)

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
;; highlight current line
;; (global-hl-line-mode 1)

;; undelrine instead of highlighting
;; (set-face-attribute hl-line-face nil :underline t)

;; ;; To customize the background color
;; (set-face-background 'hl-line "#330")
;; (set-face-foreground 'highlight nil)
;; (set-face-foreground 'hl-line nil)

;; alternative
;; (require 'hl-line+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; no menu
(menu-bar-mode -1)
(tool-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; no scratch blurb

;; Disable startup message in scratch buffer
(setq-default initial-scratch-message nil)

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
(add-hook 'isearch-mode-end-hook 'my-goto-match-beginning)
(defun my-goto-match-beginning ()
  (when isearch-forward (goto-char isearch-other-end)))
(defadvice isearch-exit (after my-goto-match-beginning activate)
  "Go to beginning of match."
  (when isearch-forward (goto-char isearch-other-end)))


(defadvice isearch-search (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)))


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
(set-cursor-color "brown3")

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

(setq comment-start "#")

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dired settings

(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
                '("\\.zip\\'" ".zip" "unzip")))


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
  ("gi Google Image Search" .
   [simple-query "images.google.com" "images.google.com/images?hl=en&q=" ""])
  ("Flickr Search" .
   [simple-query "www.flickr.com" "flickr.com/search/?q=" ""])
  )
       webjump-sample-sites)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python path

(setenv "PYTHONPATH" "/usr/local/lib/python2.6/site-packages/:/Users/rs/data1/sw/pythonlibs/rs:/Users/rs/data1/sw/kapi:/Users/rs/data1/sw/esaspi/py/:")


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


