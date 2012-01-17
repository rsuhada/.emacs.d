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
;; (add-hook 'sh-mode-hook)

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
;; zenburn

(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'zenburn)
(zenburn)

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

(add-hook 'shell-script-mode-hook (lambda ()
                             (rainbow-delimiters-mode 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; select/copy
;; /cut/paste whole line if no selection
;; (require 'whole-line-or-region)
(load "tellicopy")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; textmate - autopairing + small tweaks

(require 'textmate)
(tm/initialize)

(add-hook 'sh-mode-hook
          (tm/minor-mode 0))            ; "disable" to make it work - conflicts with internal skeletons

(add-hook 'python-mode-hook
          (tm/minor-mode 1))            ; "enable" to make it work

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
(setq ac-auto-show-menu 1.1)            ;set time in seconds
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

(autoload 'bc-set "breadcrumb" "Set bookmark in current point." t)
(autoload 'bc-previous "breadcrumb" "Go to previous bookmark." t)
(autoload 'bc-next "breadcrumb" "Go to next bookmark." t)
(autoload 'bc-local-previous "breadcrumb" "Go to previous local bookmark." t)
(autoload 'bc-local-next "breadcrumb" "Go to next local bookmark."       t)
(autoload 'bc-goto-current "breadcrumb" "Go to the current bookmark."      t)
(autoload 'bc-list "breadcrumb" "List all bookmarks in menu mode." t)
(autoload 'bc-clear "breadcrumb" "Clear all bookmarks." t)
(bc-clear)                              ; clear breadcrumbs

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
     anything-c-source-bookmarks
     anything-c-source-recentf
     anything-c-source-file-name-history
     anything-c-source-file-cache
     anything-c-source-locate
     ;; anything-c-source-buffer-not-found
     )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anything tweaks

(define-key anything-map (kbd "M-k") 'anything-next-line)
(define-key anything-map (kbd "M-i") 'anything-previous-line)
(define-key anything-map (kbd "M-l") 'anything-next-source)
(define-key anything-map (kbd "M-j") 'anything-previous-source)

;; (defun my-anything ()
;;   (interactive)
;;   (anything-other-buffer
;;    '(
;;      anything-c-source-ffap-line
;;      anything-c-source-ffap-guesser
;;      anything-c-source-buffers
;;      anything-c-source-recentf
;;      anything-c-source-file-name-history
;;      anything-c-source-bookmarks
;;      anything-c-source-file-cache
;;      anything-c-source-locate
;;      anything-c-source-buffer-not-found
;;      )
;;     " *my-anything*"))

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
;;     ;; anything-c-source-cscope-text-string
;;     ))

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

(setq desktop-recover-auto-save-count 0)    ; measured in autosave cycles
(setq desktop-recover-save-period 1)    ; measured in autosave cycles

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

(add-to-list 'load-path
              "~/.emacs.d/plugins/ess-5.14/lisp/")
(require 'ess-site)

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

(add-to-list 'exec-path "/usr/local/Cellar/ruby/1.9.2-p290/bin/")
(setenv "PATH" (concat "/usr/local/Cellar/ruby/1.9.2-p290/bin/" (getenv "PATH")))
(add-to-list 'load-path "~/.emacs.d/plugins/evernote-mode-0_41/")
(require 'evernote-mode)
(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; doesn't work
;; (add-hook evernote-mode-hook
;;             (lambda ()
;;               (local-set-key (kbd "\M-s") 'evernote-save-note)
;; ))


(require 'volatile-highlights)
(volatile-highlights-mode t)

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
; (setq real-auto-save-interval 5) ;; in seconds

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; essh.el FIXME: check the s-enter verision from ess

(require 'essh)                                                    ;;
(defun essh-sh-hook ()                                             ;;
  (define-key sh-mode-map "\C-c\C-r" 'pipe-region-to-shell)        ;;
  (define-key sh-mode-map "\C-c\C-b" 'pipe-buffer-to-shell)        ;;
  (define-key sh-mode-map "\C-c\C-j" 'pipe-line-to-shell)          ;;
  (define-key sh-mode-map "\C-c\C-n" 'pipe-line-to-shell-and-step) ;;
  (define-key sh-mode-map "\C-c\C-f" 'pipe-function-to-shell)      ;;
  (define-key sh-mode-map "\C-c\C-d" 'shell-cd-current-directory)) ;;
(add-hook 'sh-mode-hook 'essh-sh-hook)                             ;;
