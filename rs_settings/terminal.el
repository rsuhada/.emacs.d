;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; terminal fix

;; runing shells in mac is oblivious to the shell rc files

(setenv "PATH" "$PATH:/bin/:/usr/bin/:/utils/ds9/:/utils/p2pp/bin/:/utils/skycat/:~/data1/sw/zhtools/bin:~/data1/sw/misc:~/data1/sw/scripts:~/data1/sw/esaspi:~/data1/sw/esaspi/quick-spec:~/data1/sw/kapi:/usr/local/bin/:~/data1/sw/scripts/:/usr/texbin/")


;; Use Emacs terminfo, not system terminfo (corrects garbage
;; characters)
(setq system-uses-terminfo nil)

(setq explicit-shell-file-name  "/bin/zsh")
(setq shell-file-name "zsh")

;; (require 'ansi-term)
(defun term-send-function-key ()
  (interactive)
  (let* ((char last-input-event)
         (output (cdr (assoc char term-function-key-alist))))
    (term-send-raw-string output)))

(defconst term-function-key-alist '((f1 . "\^[OP")
                                    (f2 . "\^[OQ")
                                    (f3 . "\^[OR")
                                    (f4 . "\^[OS")
                                    (f5 . "\^[[15~")
                                    (f6 . "\^[[17~")
                                    (f7 . "\^[[18~")
                                    (f8 . "\^[[19~")
                                    (f9 . "\^[[20~")
                                    (f10 . "\^[[21~")
                                    (f11 . "\^[[23~")
                                    (f12 . "\^[[24~")))


; this requires sunrise to be loaded - for some reason term-raw-map
; gives error otherwise...
(dolist (spec term-function-key-alist)
  (define-key term-raw-map
    (read-kbd-macro (format "<%s>" (car spec)))
    'term-send-function-key))