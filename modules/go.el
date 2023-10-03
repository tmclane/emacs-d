(require 'straight)

(straight-use-package 'go-mode)
(straight-use-package 'go-imports)

(setq gofmt-command "goimports")

(defun customize-go ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq tab-width 4
        c-basic-offset 4
        indent-tabs-mode 1))

(add-hook 'go-mode-hook 'customize-go)

(provide 'go)
