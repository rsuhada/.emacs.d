    (put 'kill-ring-save 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))
    (put 'kill-region 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))
Thus, ‘M-w’ with no selection copies the current line, ‘C-w’ kills it entirely, and ‘C-a M-w C-y’ duplicates it. As the interactive-form property only affects the commands’ interactive behavior, they are safe for other functions to call.

If you use slime-repl-mode (a mode for interacting with an external REPL), replace (line-beginning-position) with

    (if (eq major-mode 'slime-repl-mode)
        slime-repl-input-start-mark
      (line-beginning-position))
You could easily have this behaviour for all commands that operate on the region, if you so wish:

    (do-all-symbols (symbol)
      (when (and (commandp symbol t)
                 (string-match-p "-region$\\|kill-ring-save" (symbol-name symbol)))
        (put symbol 'interactive-form
             '(interactive
               (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (line-beginning-position) (line-beginning-position 2)))))))
With yank-handler

A further keypress can be saved by using the yank-handler text property. The following will paste a copied line above the current line regardless of the position of point:

    (defadvice kill-ring-save (around slick-copy activate)
      "When called interactively with no active region, copy a single line instead."
      (if (or (use-region-p) (not (called-interactively-p)))
          ad-do-it
        (kill-new (buffer-substring (line-beginning-position)
                                    (line-beginning-position 2))
                  nil '(yank-line))
        (message "Copied line")))
    (defadvice kill-region (around slick-copy activate)
      "When called interactively with no active region, kill a single line instead."
      (if (or (use-region-p) (not (called-interactively-p)))
          ad-do-it
        (kill-new (filter-buffer-substring (line-beginning-position)
                                           (line-beginning-position 2) t)
                  nil '(yank-line))))
    (defun yank-line (string)
      "Insert STRING above the current line."
      (beginning-of-line)
      (unless (= (elt string (1- (length string))) ?\n)
        (save-excursion (insert "\n")))
      (insert string))