;; Set the default value for various coding systems to UTF-8
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; Allow all commands to work normally
(setq disabled-command-function nil)

;; Use "y" and "n" instead of "yes" and "no"
(setq use-short-answers t)

;; Surpress beeps
(setq ring-bell-function 'ignore)

;; Security defaults
;; Use gnutls for checks
(defvar gnutls-verify-error)
(setq gnutls-verify-error t)

(provide 'defaults)
