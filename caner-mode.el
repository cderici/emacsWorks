(require 'regexp-opt)

(make-variable-buffer-local
 (defvar caner-count 0
   "# of caner's inserted into the current buffer"))

(defun insert-caner ()
  (interactive)
  (setq caner-count (1+ caner-count))
  (insert "caner"))

(define-minor-mode caner-mode
  "Get your free caners in the right places!"
  :lighter " caner"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "C-i c") 'insert-caner)
	    map))

(add-hook 'racket-mode-hook 'caner-mode)

(provide 'caner-mode)

;; replace all keys pointing to a certain command with one of your own choosing by using the remap event :

; (define-key (current-global-map) [remap kill-line] 'my-homemade-kill-line)

;; globally remap all key binds that point to kill-line to my-homemade-kill-line
