;;;
;;; yank-line
;;; Author: Eric Scrivner <eric@grapheffect.com>
;;;
;;; About:
;;;
;;;  Mode which can be used to yank a line by line number.
;;;
;;; Copyright (c) 2012, Eric Scrivner and AUTHORS
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions are met:
;;;
;;; * Redistributions of source code must retain the above copyright notice,
;;;   this list of conditions and the following disclaimer.
;;; * Redistributions in binary form must reproduce the above copyright notice,
;;;   this list of conditions and the following disclaimer in the documentation
;;;   and/or other materials provided with the distribution.
;;; * Neither the name of the cqlengine nor the names of its contributors may
;;;   be used to endorse or promote products derived from this software without
;;;   specific prior written permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;;; POSSIBILITY OF SUCH DAMAGE.

(defun yl/copy-line-as-kill (arg)
  "Copy the line with the given number or the current line if none is provided"
  (save-excursion
    (if arg
        (goto-line arg))
    (back-to-indentation)
    (let ((start (point)))
      (end-of-line)
      (copy-region-as-kill start (point)))))

(defun yl/copy-line (arg)
  (interactive "P")
  (yl/copy-line-as-kill arg))

(defun yl/yank-line (arg)
  (interactive "P")
  (yl/copy-line-as-kill arg)
  (yank))

(provide 'yank-line)