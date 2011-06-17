;;; Override Phil's defaults

;;; I like this one coz I forget bindings
(if (fboundp 'menu-bar-mode) (menu-bar-mode))
;;; enable this if you want the tool buttons at the top. I don't, but
;;; my coworkers who I'm helping learn emacs will
;(if (fboundp 'tool-bar-mode) (tool-bar-mode))
;;
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode))


;;; My defaults
(global-set-key "\C-xc" 'compile)
;;; use emacs server
(server-start)

