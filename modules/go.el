(require 'straight)

(straight-use-package
 'go-mode)
(straight-use-package 'go-imports)
(setq gofmt-command "goimports")

(setq tab-width 4)
(setq c-basic-offset 4) 

(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'go)
