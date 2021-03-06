(defun try1 ()
  (interactive)
  (color-theme-install
   '(try1
      ((background-color . "#132030")
      (background-mode . light)
      (border-color . "#292929")
      (cursor-color . "#fce94f")
      (foreground-color . "#eeeeec")
      (mouse-color . "black"))
     (fringe ((t (:background "#292929"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#1b6a1d"))))
     (region ((t (:background "#0c4b1a"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#72cf80"))))
     (font-lock-string-face ((t (:foreground "#b35152"))))
     (font-lock-type-face ((t (:foreground"#344ee2"))))
     (font-lock-variable-name-face ((t (:foreground "#d411c6"))))
     (minibuffer-prompt ((t (:foreground "#26c930" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'try1)