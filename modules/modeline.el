(require 'straight)

(straight-use-package 'doom-modeline)
(straight-use-package 'minions)
(straight-use-package 'all-the-icons)

(require 'doom-modeline)
(require 'minions)

(custom-set-variables
 '(doom-modeline-height 15)
 '(doom-modeline-bar-width 6)
 '(doom-modeline-lsp t)
 '(doom-modeline-github t)
 '(doom-modeline-major-mode-color-icon t)
 '(doom-modeline-minor-modes t))

(doom-modeline-mode)
(minions-mode)

(provide 'modeline)
