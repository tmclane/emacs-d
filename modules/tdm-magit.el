(require 'straight)

(use-package magit
  :straight t
  :demand t
  :ensure t
  :commands markdown-mode
  :bind (("C-x g" . magit-status))
  :mode
  (("\\.markdown$" . markdown-mode)
   ("\\.md$" . markdown-mode)))



