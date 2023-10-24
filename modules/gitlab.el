(require 'straight)

;; git@gitlab.com:joewreschnig/gitlab-ci-mode.git
(straight-use-package '(gitlab-ci-mode :type git :host gitlab :repo "joewreschnig/gitlab-ci-mode"))

(provide 'gitlab)
