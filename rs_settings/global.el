;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; line numbering
(global-linum-mode 1)
(setq column-number-mode  t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autosave sessions
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Gotta see matching parens
(show-paren-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Trailing whitespace is unnecessary
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; highlight current line
(global-hl-line-mode 1)
;; To customize the background color
(set-face-background 'hl-line "#330")
(set-face-foreground 'highlight nil)
(set-face-foreground 'hl-line nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; no menu
(menu-bar-mode -1)
(tool-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ivisible backup files
(setq backup-directory-alist '(("." . "~/.emacs_backups")))
;; (setq auto-save-file-name-transforms
      ;; `(("." , "~/.emacs.d/backup")))
(setq auto-save-interval 100)
(setq auto-save-timeout 15)
(setq make-backup-files         t ;backup my files
      backup-by-copying         t ;don't clobber symlinks
      delete-old-versions       t
      kept-new-versions         6
      kept-old-versions         2
      version-control           t ;use versioned backups
      vc-make-backup-files      t ;make backups for cvs projects
      vc-follow-symlinks        t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set monospace font: for mac andale mono looks good
;; (set-default-font "-apple-bitstream vera sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman")

;; (set-face-attribute 'default nil :height 130)
;; (and window-system
;;      (create-fontset-from-fontset-spec
;;       (concat
;;        "-apple-monaco-medium-r-normal--13-*-*-*-*-*-fontset-monaco,"
;;        "ascii:-apple-monaco-medium-r-normal--13-100-*-*-m-100-mac-roman"))
;;      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set transient mark mode (needed for hippie-expand/smart tab)
(setq transient-mark-mode t)

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
;; move newline ads newline
(setq next-line-add-newlines t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Use command as the meta key
; (setq ns-command-modifier (quote meta))

; Don't show the startup screen
; (setq inhibit-startup-message t)