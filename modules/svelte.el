(require 'straight)

;; install prerequisites
(straight-use-package 'typescript-mode)
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)

;; install svelte-mode
(straight-use-package '(svelte-mode :type git :host github :repo "leafOfTree/svelte-mode"))

(provide 'svelte)
