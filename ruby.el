;; Setup ruby electric mode
(eval-after-load 'ruby-mode
  '(progn
     (add-hook 'ruby-mode-hook
               (lambda ()
                 (require 'ruby-electric )
    (ruby-electric-mode t)))))


;; Emacs rails reloaded
(setq load-path (cons (expand-file-name "~/.emacs.d/emacs-rails-reloaded") load-path))
(require 'rails-autoload)
;; rvm
(setq load-path (cons (expand-file-name "~/.emacs.d/rvm") load-path))
(require 'rvm)
(rvm-use-default)

;; load snippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory
 (concat (file-name-directory (or load-file-name buffer-file-name))
   "fo/yasnippets-rails/rails-snippets/"))

(defun ruby-run-buffer ()
  (interactive)
  "Stubbed out for compile mode coz using cygwin emacs and windows ruby"
  (compile (concat "ruby " (file-name-nondirectory (buffer-file-name)))))
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\C-cc" 'ruby-run-buffer)))