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

(setq-default tab-width 4)
(setq-default c-basic-offset 4) 

;; manage backups
;;(setq make-backup-files nil)
(setq delete-old-versions t)
(setq backup-directory-alist '((".*" . "~/.emacs.d/var/auto-save")))

(add-to-list 'exec-path "~/go/bin")

(provide 'defaults)
