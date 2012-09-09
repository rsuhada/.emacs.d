;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color themes - place this to the end of our init.el after external

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; zenburn

;; (add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
;; (require 'zenburn)
;; (zenburn)


;; (set-cursor-color "brown3")
;; (set-face-background 'hl-line "#212121")   ; very subtle zenburn to be used with fringe line marker

;; current line in fringe - my-linum-hl #8c5353 (red)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bbatsov-solarized - not nice

;; Now you can load the theme with the interactive function
;; `load-theme`.qw

;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/bbatsov-solarized/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; standard solarized

;; (add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
;; (add-to-list 'load-path
;;               "~/.emacs.d/plugins/solarized/")
;; (require 'color-theme-solarized)
;; (color-theme-solarized-dark)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rs solarized

(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(add-to-list 'load-path
              "~/.emacs.d/plugins/rs-solarized/")
(require 'color-theme-solarized)
(color-theme-solarized-dark)

;; (set-face-background 'hl-line "#0a2832")   ; very subtle zenburn to be used with fringe line marker
(set-face-background 'hl-line "#081F26")   ; very subtle zenburn to be used with fringe line marker

(set-cursor-color "brown3")
(setq my-linum-hl "#5859b7")
;; my-linum-hl : #259185    (cyan) - set via customize
