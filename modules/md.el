(require 'straight)

(use-package markdown-mode
  :straight t
  :demand t
  :ensure t
  :commands markdown-mode
  :mode
  (("\\.markdown$" . markdown-mode)
   ("\\.md$" . markdown-mode)))
