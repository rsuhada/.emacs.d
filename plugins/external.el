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


(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
;; (add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/themes/")

;; (require 'color-theme)
;; (setq color-theme-load-all-themes nil)

;; (require 'color-theme-tangotango)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; zenburn

(require 'zenburn)
(zenburn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; raninbow delims
(require 'rainbow-delimiters)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(add-hook 'text-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'sh-mode-hook 'rainbow-delimiters-mode)

(add-hook 'latex-mode-hook '(lambda ()
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

(require 'breadcrumb)

(autoload 'bc-set "breadcrumb" "Set bookmark in current point." t)
(autoload 'bc-previous "breadcrumb" "Go to previous bookmark." t)
(autoload 'bc-next "breadcrumb" "Go to next bookmark." t)
(autoload 'bc-local-previous "breadcrumb" "Go to previous local bookmark." t)
(autoload 'bc-local-next "breadcrumb" "Go to next local bookmark."       t)
(autoload 'bc-goto-current "breadcrumb" "Go to the current bookmark."      t)
(autoload 'bc-list "breadcrumb" "List all bookmarks in menu mode." t)
(autoload 'bc-clear "breadcrumb" "Clear all bookmarks." t)


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
     anything-c-source-buffer-not-found
     )
)


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; prettu latex

(require 'latex-pretty-symbols)
;; (autoload 'latex-pretty-symbols "latex-pretty-symbols" "latex-pretty-symbols." t)



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

