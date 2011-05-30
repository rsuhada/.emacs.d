;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rectangle mode improvement

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cua approach
(setq cua-enable-cua-keys nil) ;; only for rectangles
(cua-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rect-mark
;; (global-set-key (kbd "C-x 1") 'rm-set-mark)
;; (global-set-key (kbd "C-w")
;;   '(lambda(b e) (interactive "r")
;;      (if rm-mark-active
;;        (rm-kill-region b e) (kill-region b e))))
;; (global-set-key (kbd "M-w")
;;   '(lambda(b e) (interactive "r")
;;      (if rm-mark-active
;;        (rm-kill-ring-save b e) (kill-ring-save b e))))
;; (global-set-key (kbd "C-x C-x")
;;   '(lambda(&optional p) (interactive "p")
;;      (if rm-mark-active
;;        (rm-exchange-point-and-mark p) (exchange-point-and-mark p))))

;; (global-set-key (kbd "C-x r <down-mouse-1>") 'rm-mouse-drag-region)
