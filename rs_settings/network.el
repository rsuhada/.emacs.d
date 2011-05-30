;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; network stuff, e.g. for tramp

(add-to-list 'tramp-default-proxies-alist
             '("\\`dst01\\'"
               nil
               "/ssh:%u@o23.mpe.mpg.de:"))
