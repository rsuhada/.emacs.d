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

;; (add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
;; (add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/themes/")

;; standard color theme installation: also use Options/Appearance/Adopt*as Default
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      ;; (color-theme-billw)))
;;      (color-theme-rs-dark01)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tangotango


;; (add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
;; (add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/themes/")

;; (require 'color-theme)
;; (setq color-theme-load-all-themes nil)

;; (require 'color-theme-tangotango)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; raninbow delims
(require 'rainbow-delimiters)

(add-hook 'text-mode-hook '(lambda ()
                             (rainbow-delimiters-mode 1)))

(add-hook 'python-mode-hook '(lambda ()
                             (rainbow-delimiters-mode 1)))

(add-hook 'sh-mode-hook (lambda ()
                             (rainbow-delimiters-mode 1)))

(add-hook 'latex-mode-hook '(lambda ()
                             (rainbow-delimiters-mode 1)))

(add-hook 'emacs-lisp-mode-hook '(lambda ()
                             (rainbow-delimiters-mode 1)))

(add-hook 'ess-mode-hook '(lambda ()
                             (rainbow-delimiters-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; select/copy
;; /cut/paste whole line if no selection
;; (require 'whole-line-or-region)
(load "tellicopy")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autopair

;; (require 'autopair)
;; (autopair-global-mode) ;; to enable in all buffers


;; (add-hook 'sh-mode-hook 'autopair-mode)
;; (add-hook 'emacs-lisp-mode-common-hook #'(lambda () (autopair-mode)))
;; (autopair-global-mode) ;; enable autopair in all buffers
;; (add-hook 'c-mode-common-hook #'(lambda () (autopair-mode)))
;; (add-hook 'emacs-lisp-mode-hook '(lambda () (setq autopair-dont-activate t)))
;; (add-hook 'emacs-lisp-mode-hook 'autopair-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; run server: for chrome
(require 'edit-server)
(edit-server-start)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smex - ido support for M-x
(require 'smex)
(smex-initialize)
;; Bind some keys:
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands) ;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autocomplete

(add-to-list 'load-path
              "~/.emacs.d/plugins/auto-complete-1.3.1/")

(require 'auto-complete-config)
(ac-flyspell-workaround)                ; has to be in this line otherwise does not work
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'sh-mode)
(add-to-list 'ac-modes 'ess-mode)
(setq ac-auto-show-menu 0.9)            ;set time in seconds
(setq ac-ignore-case nil)
(setq ac-use-comphist nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hungry-delete - doesn't seem very useful at the moment

;; (require 'hungry-delete)

;; (add-hook 'sh-mode-hook 'hungry-delete-mode)
;; (add-hook 'emacs-lisp-mode-hook 'hungry-delete-mode)
;; (add-hook 'text-mode-hook 'hungry-delete-mode)
;; (add-hook 'latex-mode-hook '(lambda ()
;;                              (hungry-delete-mode 1)))

;; (add-hook 'python-mode-hook '(lambda () ;; in python doesn't work - but likely it's better
;; (hungry-delete-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; breadcrumbs

;; (require 'breadcrumb)
;; (autoload 'bc-set "breadcrumb" "Set bookmark in current point." t)
;; (autoload 'bc-previous "breadcrumb" "Go to previous bookmark." t)
;; (autoload 'bc-next "breadcrumb" "Go to next bookmark." t)
;; (autoload 'bc-local-previous "breadcrumb" "Go to previous local bookmark." t)
;; (autoload 'bc-local-next "breadcrumb" "Go to next local bookmark."       t)
;; (autoload 'bc-goto-current "breadcrumb" "Go to the current bookmark."      t)
;; (autoload 'bc-list "breadcrumb" "List all bookmarks in menu mode." t)
;; (autoload 'bc-clear "breadcrumb" "Clear all bookmarks." t)
;; (bc-clear)                              ; clear breadcrumbs

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; command frequency
;; (setq-default command-frequency-table-file "~/.emacs.d/plugins/misc/frequencies")
;; (require 'command-frequency)
;; (command-frequency-table-load)
;; (command-frequency-mode 1)
;; (command-frequency-autosave-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; counter
;; C-u C-c c for setup
;; C-u 100 C-c c to insert 100 numbers

(global-unset-key (kbd "C-c c")) ; conflicts with org template launcher
(autoload 'counter "counter" nil t)
(global-set-key "\C-cc" 'counter)

(add-hook 'counter-post-insert-hook '(lambda ()
                             (newline))) ; or: newline-and-indent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; constants

(autoload 'constants-insert "constants" "Insert constants into source." t)
(autoload 'constants-get "constants" "Get the value of a constant." t)
(autoload 'constants-replace "constants" "Replace name of a constant." t)
;; (define-key global-map "\C-cci" 'constants-insert)
;; (define-key global-map "\C-ccg" 'constants-get)
;; (define-key global-map "\C-ccr" 'constants-replace)
(setq constants-unit-system 'cgs)   ;  this is the default

;; Use "cc" as the standard variable name for speed of light,
;; "bk" for Boltzmann's constant, and "hp" for Planck's constant
(setq constants-rename '(("cc" . "c") ("bk" . "k") ("hp" . "h")))

;; A default list of constants to insert when none are specified
(setq constants-default-list "cc,bk,hp,Mpc,Msun")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dot-mode (repeat complex commands)

:; (autoload 'dot-mode "dot-mode" nil t) ; vi `.' command emulation
;; (global-set-key [(control ?.)] (lambda () (interactive) (dot-mode 1)
                                 ;; (message "Dot mode activated.")))

(require 'dot-mode)
(add-hook 'find-file-hooks 'dot-mode-on)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my mini-setup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anything
(add-to-list 'load-path "~/.emacs.d/plugins/a-c")
;; (require 'anything-config)
(require 'anything-startup)

(setq anything-sources
   '(
     anything-c-source-ffap-line
     anything-c-source-ffap-guesser
     anything-c-source-buffers
     anything-c-source-imenu
     anything-c-source-etags-select
     anything-c-source-bm
     anything-c-source-recentf
     anything-c-source-file-name-history
     anything-c-source-file-cache
     anything-c-source-files-in-current-dir+
     anything-c-source-locate
     )
)

;; anything-c-source-buffer-not-found
;; anything-c-source-bookmarks

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anything tweaks

(define-key anything-map (kbd "M-k") 'anything-next-line)
(define-key anything-map (kbd "M-i") 'anything-previous-line)
(define-key anything-map (kbd "M-l") 'anything-next-source)
(define-key anything-map (kbd "M-j") 'anything-previous-source)


;; (setq anything-sources
;;       '(;; anything-c-source-buffers+
;;         ;; anything-c-source-recentf
;;         ;; anything-c-source-files-in-current-dir+
;;         anything-c-source-bookmarks
;;         ;; anything-c-source-kill-ring
;;         anything-c-source-buffer-not-found
;;         anything-c-source-define-global-abbrev
;;         anything-c-source-define-mode-abbrev
;;         ))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; reddit setup
;; (setq anything-for-files-prefered-list
;;   '(anything-c-source-ffap-line
;;     anything-c-source-ffap-guesser
;;     anything-c-source-filelist
;;     anything-c-source-buffers+
;;     anything-c-source-recentf
;;     anything-c-source-bookmarks
;;     anything-c-source-file-cache
;;     anything-c-source-files-in-current-dir+
;;     ;; anything-c-source-locate
;; ))
;; (setq anything-sources
;;   '(anything-c-source-ffap-line
;;     anything-c-source-ffap-guesser
;;     anything-c-source-files-in-all-dired
;;     anything-c-source-filelist
;;     ;; anything-c-source-locate
;;     anything-c-source-recentf
;;     anything-c-source-file-name-history
;;     ;; anything-c-source-buffers
;;     anything-c-source-emacs-commands
;;     ;; anything-c-source-buffers
;;     ;; anything-c-source-buffer-not-found
;;     ;; anything-c-source-info-pages
;;     ;; anything-c-source-info-elisp
;;     ;; anything-cscope-db-directory
;;     ;; anything-c-source-cscope-c-cymbol
;;     ;; anything-c-source-cscope-global-definition
;;     ;; anything-c-source-cscope-called-function
;;     ;; anything-c-source-cscope-calling-this-function
;;     ;; anything-c-source-cscope-text-stribg))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; at the moment not functioning...
;; (require 'ac-python)
;; (require 'ac-math)

;; (add-to-list 'ac-modes 'latex-mode)
;; (defun ac-latex-mode-setup ()
;;   (setq ac-sources
;;         (append '(ac-source-math-latex ac-source-latex-commands  ac-source-math-unicode)
;;                 ac-sources))
;;   )
;; (add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; replace scroll bar
(if (require 'sml-modeline nil 'noerror)    ;; use sml-modeline if available
  (progn
    (sml-modeline-mode 1)                   ;; show buffer pos in the mode line
    (scroll-bar-mode -1))                   ;; turn off the scrollbar
  (scroll-bar-mode 1)                       ;; otherwise, show a scrollbar
  (set-scroll-bar-mode 'right))             ;; ... on the right

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ace-jump
(require 'ace-jump-mode)

;; (setq ace-jump-mode-move-keys (loop for i from (?a ?s) collect i))

;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; "C-u C-c SPC" ==> ace-jump-char-mode
;; "C-u C-u C-c SPC" ==> ace-jump-line-mode

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; browsing kill ring
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backup-mode

(setq backup-directory-alist '(("." . "~/.emacs-backups")))
(defvar backup-directory "~/.emacs-backups/")
(defvar tramp-backup-directory "~/.emacs-backups/tramp-backups/")

(add-to-list 'load-path "~/.emacs.d/plugins/backups-mode/")
(require 'backups-mode)

(setq auto-save-interval 100)
(setq auto-save-timeout 15)
(setq make-backup-files         t ;backup my files
      backup-by-copying         t ;don't clobber symlinks
      delete-old-versions       t
      kept-new-versions         10
      kept-old-versions         5
      version-control           t ;use versioned backups
      vc-make-backup-files      t ;make backups for cvs projects
      vc-follow-symlinks        t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; pretty latex - gets in the way at the moment

;; (require 'latex-pretty-symbols)
;; ;; (autoload 'latex-pretty-symbols "latex-pretty-symbols" "latex-pretty-symbols." t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; highlight-indentation

(autoload 'highlight-indentation "highlight-indentation" "highlight-indentation" t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; typing

(autoload 'typing-of-emacs "typing" "The Typing Of Emacs." t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; desktop autosaving and recovery

(require 'desktop-recover)
(setq desktop-recover-location
      (desktop-recover-fixdir "$HOME/")) ;; ~/.emacs.d is the default

;; (setq desktop-recover-auto-save-count 0)    ; measured in autosave cycles
(setq desktop-recover-save-period 1)    ; measured in autosave cycles - doesn't work?

(run-with-idle-timer 100.0 t 'desktop-save-in-desktop-dir) ; if idle for 5s save?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evaling math in buffers

(autoload 'macro-math-eval-and-round-region "macro-math" "macro-math" t)
(autoload 'macro-math-eval-region "macro-math" "macro-math" t)

;; (global-set-key "\C-x~" 'macro-math-eval-and-round-region)
;; (global-set-key "\C-x=" 'macro-math-eval-region)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete - works for bash but not for python - kills yasnippet
;; (add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1/")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1//ac-dict")
;; (ac-config-default)


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


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; smart-tab

;; (require 'smart-tab)
;; (global-smart-tab-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; undo tree

(require 'undo-tree)
(global-undo-tree-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil

;; (add-to-list 'load-path "~/.emacs.d/plugins/evil")
;; (require 'evil)
;; (evil-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rectangle edit

(autoload 'inline-string-rectangle "inline-string-rectangle" "Inline string rectangle" t)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multiple-selection


;; (defun rs/mark-multi-next ()
;;   (interactive)
;;         (if (not (region-active-p))
;;         (set-mark)
;;         (forward-word)
;;         (mark-next-like-this)))

(autoload 'mark-previous-like-this "mark-more-like-this" "mark-previous-like-this" t)
(autoload 'mark-next-like-this "mark-more-like-this" "mark-next-like-this" t)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
;; (global-set-key (kbd "C->") 'rs/mark-multi-next)

;; FIXME
(defun rs/mark-multi-next ()
  (interactive)
        (if (not (region-active-p))
        (set-mark-command)
        (forward-word)
        (mark-next-like-this)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ess

;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/ess-5.14/lisp/")
;; (autoload 'ess-site "ess-site.el" "ESS mode" t)
;; (require 'ess-site)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; from steve yegge

;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
 (let ((name (buffer-name))
	(filename (buffer-file-name)))
 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (if (get-buffer new-name)
	 (message "A buffer named '%s' already exists!" new-name)
	(progn 	 (rename-file name new-name 1) 	 (rename-buffer new-name) 	 (set-visited-file-name new-name) 	 (set-buffer-modified-p nil)))))) ;;

;; Never understood why Emacs doesn't have this function, either.
;;
(defun move-buffer-file (dir)
 "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
 (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	 (if (string-match dir "\\(?:/\\|\\\\)$")
	 (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (progn 	(copy-file filename newname 1) 	(delete-file filename) 	(set-visited-file-name newname)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; markdown mode

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
 (setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evernote

;; (add-to-list 'exec-path "/usr/local/Cellar/ruby/1.9.2-p290/bin/")
;; (setenv "PATH" (concat "/usr/local/Cellar/ruby/1.9.2-p290/bin/" (getenv "PATH")))
;; (add-to-list 'load-path "~/.emacs.d/plugins/evernote-mode-0_41/")
;; (require 'evernote-mode)
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
;; (global-set-key "\C-cec" 'evernote-create-note)
;; (global-set-key "\C-ceo" 'evernote-open-note)
;; (global-set-key "\C-ces" 'evernote-search-notes)
;; (global-set-key "\C-ceS" 'evernote-do-saved-search)
;; (global-set-key "\C-cew" 'evernote-write-note)
;; (global-set-key "\C-cep" 'evernote-post-region)
;; (global-set-key "\C-ceb" 'evernote-browser)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; doesn't work
;; (add-hook evernote-mode-hook
;;             (lambda ()
;;               (local-set-key (kbd "\M-s") 'evernote-save-note)
;; ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; volatile highhlight - 50/50 whether this is helpful

;; (require 'volatile-highlights)
;; (volatile-highlights-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-save files - not working auto-saves only once per session...

;; (require 'real-auto-save)
;; (add-hook 'text-mode-hook 'turn-on-real-auto-save)
;; (add-hook 'sh-mode-hook 'turn-on-real-auto-save)
;; (add-hook 'python-mode-hook 'turn-on-real-auto-save)
;; (add-hook 'org-mode-hook 'turn-on-real-auto-save)
;; (add-hook 'ess-mode-hook 'turn-on-real-auto-save)
;; (add-hook 'markdown-mode-hook 'turn-on-real-auto-save)
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-real-auto-save);
;; (setq real-auto-save-interval 1) ;; in seconds

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; essh.el FIXME: check the s-enter verision from ess

(require 'essh)                                                    ;;
;; (autoload 'essh "essh.el" "R mode" t)
(defun essh-sh-hook ()                                             ;;
  (define-key sh-mode-map "\C-c\C-r" 'pipe-region-to-shell)        ;;
  (define-key sh-mode-map "\C-c\C-b" 'pipe-buffer-to-shell)        ;;
  (define-key sh-mode-map "\C-c\C-j" 'pipe-line-to-shell)          ;;
  (define-key sh-mode-map "\C-c\C-n" 'pipe-line-to-shell-and-step) ;;
  (define-key sh-mode-map "\C-c\C-f" 'pipe-function-to-shell)      ;;
  (define-key sh-mode-map "\C-c\C-d" 'shell-cd-current-directory)) ;;
(add-hook 'sh-mode-hook 'essh-sh-hook)                             ;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; textmate - autopairing + small tweaks
;; - buggy and conflicting with sh-mode

;; (require 'textmate)
;; (tm/initialize)

;; (add-hook 'sh-mode-hook
;;            (tm/minor-mode 0))            ; "disable" to make it work - conflicts with internal skeletons

;; (add-hook 'python-mode-hook
;;           (tm/minor-mode 1))            ; "enable" to make it work

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sunrise commander

(add-to-list 'load-path "~/.emacs.d/plugins/sunrise-commander/")
(require 'sunrise-commander)
(require 'sunrise-x-buttons)
(require 'sunrise-x-mirror)
(require 'sunrise-x-modeline)

(add-to-list 'auto-mode-alist '("\\.srvm\\'" . sr-virtual-mode))

(defun sr-browse-file (&optional file)
  "Display the selected file with the default appication."
  (interactive)
  (setq file (or file (dired-get-filename)))
  (save-selected-window
    (sr-select-viewer-window)
    (let ((buff (current-buffer))
	  (fname (if (file-directory-p file)
		     file
		   (file-name-nondirectory file)))
	  (app (cond
		((eq system-type 'darwin)	"open %s")
		((eq system-type 'windows-nt)	"open %s")
		(t				"xdg-open %s"))))
      (start-process-shell-command "open" nil (format app file))
      (unless (eq buff (current-buffer))
        (sr-scrollable-viewer (current-buffer)))
      (message "Opening \"%s\" ..." fname))))

;; variables
(setq sr-right-directory "~/")
(setq sr-left-directory "~/Downloads/")

(setq sr-attributes-display-mask '(nil nil nil nil t t t))
(add-hook 'sr-init-hook 'sr-toggle-attributes)

;; keys

(define-key sr-mode-map "n"           'sr-goto-dir)
(define-key sr-mode-map "\C-n"           'sr-fuzzy-narrow)
(define-key sr-mode-map "j"           'sr-dired-prev-subdir)
;; (define-key sr-mode-map "k"           'sr-scroll-up)
(define-key sr-mode-map "k"           'next-line)
;; (define-key sr-mode-map "i"           'sr-scroll-down) ; originally : dired-do-kill-line
(define-key sr-mode-map "i"           'previous-line) ; originally : dired-do-kill-lines
(define-key sr-mode-map "l"           'sr-advertised-find-file)
(define-key sr-mode-map "\C-j"        'sr-advertised-find-file)
(define-key sr-mode-map "\C-s"        'sr-sticky-isearch-forward)
(define-key sr-mode-map "\C-cs"        'sr-interactive-sort)
(define-key sr-mode-map "f"           'sr-fuzzy-narrow)

;; (add-hook 'sr-start-hook 'sr-toggle-attributes)
;; (add-hook 'sr-refresh-hook 'sr-sticky-isearch-forward)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jump to last edit place

(require 'goto-last-change)
(global-set-key "\C-p" 'goto-last-change)
(global-set-key "\C-\M-p" 'pop-global-mark)

;; ;; npt very useful atm
;; ;; (global-set-key "\C-p" 'mark-set-command)
;; (require 'marker-visit)
;; (global-set-key "\C-\M-p" 'marker-visit-prev)
;; (global-set-key "\C-\M-n" 'marker-visit-next) ;was forward-list

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; extend-region

(add-to-list 'load-path "~/.emacs.d/plugins/expand-region/")
(require 'expand-region)

(global-set-key (kbd "M-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ; was: mark-sexp
(global-set-key (kbd "C-@") 'mark-word)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; deft

;; (autoload 'deft "deft.el" "Deft mode" t)
;; (setq deft-extension "org")
;; (setq deft-directory "~/org/")
;; (setq deft-text-mode 'org-mode)
;; (setq deft-use-filename-as-title t)
;; (setq deft-auto-save-interval 5.0)
;; (setq deft-time-format " %H:%M %d-%m-%Y")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rotate-text
;; FIXME: move to own file

(defvar rotate-text-rotations
  '(("true" "false")
    ("True" "False")
    ("yes" "no")
    ("Yes" "No")
    ("0" "1")
    ("pn" "m1" "m2")
    ("PN" "M1" "M2")
    ("width" "height")
    ("left" "top" "right" "bottom")
    ("start" "end")
    ("red" "orange" "yellow" "green" "blue" "indigo" "violet")
    ("zero" "one" "two"))
  "List of text rotation sets.")

(defun rotate-region (beg end)
  "Rotate all matches in `rotate-text-rotations' between point and mark."
  (interactive "r")
  (let ((regexp (rotate-convert-rotations-to-regexp
		 rotate-text-rotations))
	(end-mark (copy-marker end)))
    (save-excursion
      (goto-char beg)
      (while (re-search-forward regexp (marker-position end-mark) t)
	(let* ((found (match-string 0))
	       (replace (rotate-next found)))
	  (replace-match replace))))))

(defun rotate-string (string &optional rotations)
  "Rotate all matches in STRING using associations in ROTATIONS.
If ROTATIONS are not given it defaults to `rotate-text-rotations'."
  (let ((regexp (rotate-convert-rotations-to-regexp
		 (or rotations rotate-text-rotations)))
	(start 0))
    (while (string-match regexp string start)
      (let* ((found (match-string 0 string))
	     (replace (rotate-next
		       found
		       (or rotations rotate-text-rotations))))
	(setq start (+ (match-end 0)
		       (- (length replace) (length found))))
	(setq string (replace-match replace nil t string))))
    string))

(defun rotate-next (string &optional rotations)
  "Return the next element after STRING in ROTATIONS."
  (let ((rots (rotate-get-rotations-for
	       string
	       (or rotations rotate-text-rotations))))
    (if (> (length rots) 1)
	(error (format "Ambiguous rotation for %s" string))
      (if (< (length rots) 1)
	  ;; If we get this far, this should not occur:
	  (error (format "Unknown rotation for %s" string))
	(let ((occurs-in-rots (member string (car rots))))
	  (if (null occurs-in-rots)
	      ;; If we get this far, this should *never* occur:
	      (error (format "Unknown rotation for %s" string))
	  (if (null (cdr occurs-in-rots))
	      (caar rots)
	    (cadr occurs-in-rots))))))))

(defun rotate-get-rotations-for (string &optional rotations)
  "Return the string rotations for STRING in ROTATIONS."
  (remq nil (mapcar (lambda (rot) (if (member string rot) rot))
		    (or rotations rotate-text-rotations))))

(defun rotate-convert-rotations-to-regexp (rotations)
  (regexp-opt (rotate-flatten-list rotations)))

(defun rotate-flatten-list (list-of-lists)
  "Flatten LIST-OF-LISTS to a single list.
Example:
  (rotate-flatten-list '((a b c) (1 ((2 3)))))
    => (a b c 1 2 3)"
  (if (null list-of-lists)
      list-of-lists
    (if (listp list-of-lists)
	(append (rotate-flatten-list (car list-of-lists))
		(rotate-flatten-list (cdr list-of-lists)))
      (list list-of-lists))))

(defun rotate-word-at-point ()
  "Rotate word at point based on sets in `rotate-text-rotations'."
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word))
        (opoint (point)))
    (when (consp bounds)
      (let ((beg (car bounds))
            (end (copy-marker (cdr bounds))))
        (rotate-region beg end)
        (goto-char (if (> opoint end) end opoint))))))

;; (global-set-key "\C-c/" 'rotate-word-at-point)
(global-set-key "\C-\M-]" 'rotate-word-at-point)

;; (defun indent-or-rotate ()
;;   "If point is at end of a word, then else indent the line."
;;   (interactive)
;;   (if (looking-at "\\>")
;;       (rotate-region (save-excursion (forward-word -1) (point))
;; 		     (point))
;;     (indent-for-tab-command)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; w3m - not working at the moment

;; (setq w3m-command "/usr/local/bin/w3m")

;; (add-to-list 'load-path "~/.emacs.d/plugins/emacs-w3m")
;; ; default
;; ;; (setq browse-url-browser-function 'w3m-browse-url)

;; (require 'w3m-load)
;; (setq w3m-default-display-inline-images t)
;; (setq w3m-use-cookies t)
;; (setq w3m-follow-redirection 3)
;; (setq w3m-home-page "http://google.com")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mediawiki

;; M-x customize-variable RET mediawiki-site-alist RET Set up the
;; information for any sites. If you don’t wish to store your
;; password, you can leave it blank and you’ll be prompted.  C-x C-s
;; M-x mediawiki-site RET {your site name} RET You should now be
;; editting the default page. If you didn’t specify one, you are now
;; logged in.  M-x mediawiki-open RET Main Page RET # for example

(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'mediawiki)

;; org-mediawiki not working
;; (require 'org-mediawiki)
;; (add-to-list 'load-path "~/install/git/org-mode/EXPERIMENTAL/")
;; (add-to-list 'load-path "~/.emacs.d/plugins/org-7.7/")

;; setup the credentials
;; (abbrev-table-put mediawiki-mode-abbrev-table :parents (list text-mode-abbrev-table))
;; (setq mediawiki-site-alist '(("Wikipedia" "http://en.wikipedia.org/w" "" "" "Main Page")
;;                              ("WikEmacs" "http://wikemacs.org/w/" "" "" "Main Page")))

;; ;; Emacs users care more for WikEmacs than Wikipedia :-)
;; (setq mediawiki-site-default "WikEmacs")*

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; saaxy -> hermes

(add-to-list 'load-path "~/.emacs.d/plugins/hermes/")
(require 'hermes)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yaml mode

(add-to-list 'load-path "~/.emacs.d/plugins/yaml/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; tomathino - pomodoro
;; (add-to-list 'load-path "~/.emacs.d/plugins/tomatinho")
;; (require 'tomatinho)
;; (global-set-key [C-f12]   'tomatinho)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; pomodoro
;; (require 'pomodoro)
(require 'pomodoro)
;; (global-set-key [C-f12]   'pomodoro)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; pomodoro - kanis version with libnotify

;; (add-to-list 'load-path "~/.emacs.d/plugins/pomodoro/")
;; (require 'pomodoro)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bookmark-+

;; (add-to-list 'load-path "~/.emacs.d/plugins/bookmark-plus/")
;; (require 'bookmark+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bm - visible bookmarks
(require 'bm)

(setq bm-repository-size nil)

;; subtler marks
(setq bm-marker 'bm-marker-left)
(setq bm-highlight-style 'bm-highlight-only-fringe)

;; make bookmarks persistent as default
(setq-default bm-buffer-persistence t)

;; Loading the repository from file when on start up.
(add-hook' after-init-hook 'bm-repository-load)

;; Restoring bookmarks when on file find.
(add-hook 'find-file-hooks 'bm-buffer-restore)

;; Saving bookmark data on killing a buffer
(add-hook 'kill-buffer-hook 'bm-buffer-save)

;; Saving the repository to file when on exit.
;; kill-buffer-hook is not called when emacs is killed, so we
;; must save all bookmarks first.
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jabber
;; adjust this path:
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-jabber-0.8.91/")
(require 'jabber-autoloads)
(load "~/.emacs.d/rs_settings/ignore.el")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(jabber-auto-reconnect nil)
 '(jabber-avatar-verbose nil)
 '(jabber-vcard-avatars-retrieve nil)
 '(jabber-chat-buffer-format "*-jab-%n-*")
 '(jabber-history-enabled t)
 '(jabber-mode-line-mode nil)
 '(jabber-roster-buffer "*-jab-*")
 '(jabber-roster-line-format " %c %-25n %u %-8s (%r)")
 '(jabber-show-offline-contacts t))


(defun adjust-jabber-mode-line ()
  (setq global-mode-string (delete '(t jabber-activity-mode-string) global-mode-string))
  (add-to-list 'global-mode-string jabber-activity-count-in-title-format))

(add-hook 'jabber-chat-mode-hook 'adjust-jabber-mode-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; unscroll

(require 'atim-unscroll)
(atim-unscroll-global-mode)

(global-set-key (kbd "C-M-p") 'atim-unscroll-up)
(global-set-key (kbd "C-M-n") 'atim-unscroll-down)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; chords

;;      (key-chord-define-global ",."     "<>\C-b")
;;      (key-chord-define-global "hj"     'undo)
;;      (key-chord-define-global [?h ?j]  'undo)  ; the same
;;      (key-chord-define-global "jk"     'dabbrev-expand)
;;      (key-chord-define-global "cv"     'reindent-then-newline-and-indent)
;;      (key-chord-define-global "4r"     "$")
;;
;;      (key-chord-define-global "''"     "`'\C-b")
;;      (key-chord-define-global ",,"     'indent-for-comment)
;;      (key-chord-define-global "qq"     "the ")
;;      (key-chord-define-global "QQ"     "The ")
;;
;;      (key-chord-define c++-mode-map ";;"  "\C-e;")
;;      (key-chord-define c++-mode-map "{}"  "{\n\n}\C-p\t")

(add-to-list 'load-path "~/.emacs.d/plugins/misc/")
(require 'key-chord)
(key-chord-mode 1)

(setq key-chord-two-keys-delay 0.07)    ;default=0.1
(setq key-chord-one-key-delay  0.2)    ;default=0.2

;; (key-chord-define-global "kl"     'forward-word)
;; (key-chord-define-global "jk"     'backward-word)

(key-chord-define-global "4r"     "$")
(key-chord-define-global "5t"     "%")
(key-chord-define-global "6t"     "^")
(key-chord-define-global "6y"     "^")
(key-chord-define-global "7y"     "&")
(key-chord-define-global "8i"     "*")
(key-chord-define-global "8u"     "*")
(key-chord-define-global "9i"     "(")
(key-chord-define-global "0o"     ")")
(key-chord-define-global "p-"     "_")

(key-chord-define-global "qw" 'rs-macro/mark-line)

;; mode specific maps can't be in bindings because they require
;; preloaded libs

(add-hook 'python-mode-hook
          #'(lambda ()
              (key-chord-define python-mode-map "cc"  'python-send-buffer)))


(key-chord-define org-mode-map "cc"  'org-capture-finalize) ;; doesn't work

(key-chord-define-global "kk" 'rs-macro/new-item)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; minimap

;; (require 'minimap)
;; (autoload 'minimap "minimap.el" "Minimap mode" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; etags

;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/eproject")
;; (require 'eproject)
;; (require 'etags-select)
;; (require 'eproject-extras)

;; (defun build-ctags ()
;;   (interactive)
;;   (message "building project tags")
;;   (let ((root (eproject-root)))
;;     (shell-command
;;      (format "%s" path-to-pytags)))
;;   (visit-project-tags)
;;   (message "tags built successfully"))


;; (defun build-ctags ()
;;   (interactive)
;;   (message "building project tags")
;;   (let ((root (eproject-root)))
;;     (shell-command
;;      (concat "/usr/local/Cellar/ctags/5.8/bin/ctags -e -R --exclude=.git -f " root "TAGS " root)))
;;   (visit-project-tags)
;;   (message "tags built successfully"))

;; (defun visit-project-tags ()
;;   (interactive)
;;   (let ((tags-file (concat (eproject-root) "TAGS")))
;;     (visit-tags-table tags-file)
;;     (message (concat "Loaded " tags-file))))

;; (defun hbin-find-tag ()
;;   "Borrow from http://mattbriggs.net/blog/2012/03/18/awesome-emacs-plugins-ctags/"
;;   (interactive)
;;   (if (file-exists-p (concat (eproject-root) "TAGS"))
;;       (visit-project-tags)
;;     (build-ctags))
;;   (etags-select-find-tag-at-point))

;; (global-set-key (kbd "M-.") 'hbin-find-tag)

;; (global-set-key (kbd "M-.") 'etags-select-find-tag-at-point)

;; (defun visit-project-tags ()
;;   (interactive)
;;   (let ((tags-file (concat (eproject-root) "TAGS")))
;;     (visit-tags-table tags-file)
;;     (message (concat "Loaded " tags-file))))

;; (defun hbin-find-tag ()
;;   "Borrow from http://mattbriggs.net/blog/2012/03/18/awesome-emacs-plugins-ctags/"
;;   (interactive)
;;   (if (file-exists-p (concat (eproject-root) "TAGS"))
;;       (visit-project-tags)
;;     (build-ctags))
;;   (etags-select-find-tag-at-point))

;; (global-set-key (kbd "M-.") 'hbin-find-tag)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; awk-it

(require 'awk-it)