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
;; (set-face-background 'hl-line "#081F26")   ; very subtle zenburn to be used with fringe line marker
;; (setq my-linum-hl "#5859b7")

(set-cursor-color "brown3")

;; stuff needing manual tweaking via customize face:
;; my-linum-hl : #259185    (cyan)
;; org-todo: backgrond switch off, foreground red


;; here is the palete

;; (defvar solarized-colors           ; ANSI(Solarized terminal)
;;   ;; name     sRGB      Gen RGB   256       16              8
;; ;;'((base03  "#002b36" "#042028" "#1c1c1c" "brightblack"   "black")
;;   '((base03  "#002b36" "#03181F" "#1c1c1c" "brightblack"   "black")
;;     (base02  "#b58900" "#0a2832" "#262626" "black"         "black")
;;     (base01  "#586e75" "#465a61" "#585858" "brightgreen"   "green")
;;     (base00  "#657b83" "#52676f" "#626262" "brightyellow"  "yellow")
;;     ;; (base0   "#839496" "#708183" "#808080" "brightblue"    "blue")
;;     ;; (base0   "#839496" "#819294" "#808080" "brightblue"    "blue")
;;     (base0   "#839496" "#8b9a9b" "#808080" "brightblue"    "blue")
;;     (base1   "#93a1a1" "#81908f" "#8a8a8a" "brightcyan"    "cyan") ;comments
;;     (base2   "#eee8d5" "#e9e2cb" "#e4e4e4" "white"         "white")
;;     (base3   "#fdf6e3" "#fcf4dc" "#ffffd7" "brightwhite"   "white")
;;     (yellow  "#b58900" "#a57705" "#af8700" "yellow"        "yellow")
;;     (orange  "#cb4b16" "#bd3612" "#d75f00" "brightred"     "red")
;;     (red     "#dc322f" "#c60007" "#d70000" "red"           "red")
;;     (magenta "#d33682" "#c61b6e" "#af005f" "magenta"       "magenta")
;;     (violet  "#6c71c4" "#5859b7" "#5f5faf" "brightmagenta" "magenta")
;;     (blue    "#268bd2" "#2075c7" "#0087ff" "blue"          "blue")
;;     (cyan    "#2aa198" "#259185" "#00afaf" "cyan"          "cyan")
;;     (green   "#859900" "#728a05" "#5f8700" "green"         "green"))
;;   "This is a table of all the colors used by the Solarized color theme. Each
;;    column is a different set, one of which will be chosen based on term
;;    capabilities, etc.")
