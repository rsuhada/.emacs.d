;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mode hooks

;; (defun jd-add-timestamp ()
;;   (when (looking-at-p "\\.cat")
;;     (setq flyspell-mode t)
;;   ))


;; (defun set_tab_mode ()
;;     (when (looking-at-p "\\.cat")
;;   (orgtbl-mode)
;;   ))

(defun my-set-tab-mode ()
  (when (or (or (and (stringp buffer-file-name)
             (string-match "\\.cat\\'" buffer-file-name))
(and (stringp buffer-file-name)
             (string-match "\\.tab\\'" buffer-file-name)))
(and (stringp buffer-file-name)
             (string-match "\\.dat\\'" buffer-file-name)))
    (toggle-truncate-lines)
    (turn-on-orgtbl)))

(add-hook 'find-file-hook 'my-set-tab-mode)

