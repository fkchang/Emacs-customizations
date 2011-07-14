
(defvar custom-packages (list 'textmate
                              'yaml-mode
                              'yasnippet-bundle
                              'rspec-mode
                              'haml-mode
                              'sass-mode
                              'mode-compile
                              'anything
                              'anything-config
                              'rspec-mode
                              'rvm
                              )
  "Custom libraries that should be installed by default.")

(defun custom-elpa-install ()
  "Install all custom packages that aren't installed."
  (interactive)
  (dolist (package custom-packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))


;; On your first run, this should pull in all thecustom  packages.

(when (esk-online?)
  (unless package-archive-contents (package-refresh-contents))
  (custom-elpa-install))

(provide 'customized-elpa)
