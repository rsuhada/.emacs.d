;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mode line setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; show current function name
;; to set colors:
;; M-x customize-group  which-func
(which-function-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fancy mode-line hacked from:
;; http://amitp.blogspot.de/2011/08/emacs-custom-mode-line.html

(setq-default
 mode-line-format
 '(; Position, including warning for 80 columns
   (:propertize "%4l:" face mode-line-position-face)
   (:eval (propertize "%2c" 'face
                      (if (>= (current-column) 80)
                          'mode-line-80col-face
                        'mode-line-position-face)))
   ; emacsclient [default -- keep?]
   mode-line-client
   " "
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " " 'face 'mode-line-modified-face))
          (t " ")))
   " "
   ; directory and buffer/file name
   (:propertize (:eval (shorten-directory default-directory 10))
                face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)
   ; narrow [default -- keep?]
   (:propertize "%n"
                face mode-line-narrowed-face)
 (which-func-mode
  (" " which-func-format
   #(" " 1 1                            ; the 2 numbers are length of the strings inside the quotation marks
     (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))))
   " %p"
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   (vc-mode vc-mode)
   "  %["
   (:propertize mode-name
                face mode-line-mode-face)
   "%] "
   (:eval (propertize (format-mode-line minor-mode-alist)
                      'face 'mode-line-minor-mode-face))
   ;; time
   (:propertize mode-line-process
                face mode-line-process-face)
   (global-mode-string global-mode-string)
   "    "
 ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat "" output)))    ; original: ".../"
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-narrowed-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
    :foreground "gray60" :background "gray20"
    :inverse-video nil
    :box '(:line-width 3 :color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
    :foreground "gray80" :background "gray40"
    :inverse-video nil
    :box '(:line-width 3 :color "gray40" :style nil))

(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :foreground "#4271ae"
    :box '(:line-width 2 :color "#4271ae"))
(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :foreground "#c82829"
    ;; :background "#ffffff"
    ;; :background "grey60"
    :box '(:line-width 2 :color "#c82829"))

(set-face-attribute 'mode-line-narrowed-face nil
    :inherit 'mode-line-face
    :foreground "#c82829"
    ;; :background "#ffffff"
    ;; :background "grey80"
    ;; :box '(:line-width 2 :color "#c82829")
)

(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#eab700"
    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face
    :family "Menlo" :height 100)
(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :foreground "gray40"
    :height 110)
(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
    :inherit 'mode-line-position-face
    :foreground "black" :background "#eab700")
