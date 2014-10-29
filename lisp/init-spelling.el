(require 'ispell)


;;use emacs to spell check
(setq-default ispell-program-name "aspell")
(add-hook 'org-mode-hook 'flyspell-mode)

(when (executable-find ispell-program-name)
  (require 'init-flyspell))

(provide 'init-spelling)
