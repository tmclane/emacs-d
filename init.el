;; Monitor startup time.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Specify a custom file
(setq custom-file
      (concat (file-name-directory user-init-file) "custom.el"))

;; straight bootstrap code (bootstrap-version 5)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(require 'straight)
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; Control the creation of files in Emacs directory.
(straight-use-package 'no-littering)

(require 'no-littering nil 'noerror)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
(setq lock-file-name-transforms
      `(("\\`/.*/\\([^/]+\\)\\'",(no-littering-expand-var-file-name "locks/") t)))

(eval-after-load 'no-littering `(make-directory (no-littering-expand-var-file-name "locks/") t))

(setq cfg-directory (expand-file-name "conf/" user-emacs-directory))
(setq module-directory (expand-file-name "modules/" user-emacs-directory))

;; Load machine dependent configuration
(load
 (expand-file-name
  (concat
   cfg-directory
   (car (split-string (system-name)  "\\."))))
 'noerror)

;; Add local modules directory to the load path
(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))

;; Load all modules found in the module-directory
(dolist (elt (directory-files module-directory nil "^.*.el$"))
  (message (format "Loading %s" (file-name-sans-extension elt)))
  (require (intern (file-name-sans-extension elt))))

;; Load OS dependent configuration
(load
 (expand-file-name
  (concat
   cfg-directory
   (symbol-name system-type)
   ".el"))
 'noerror)

;; Call the module
(when (fboundp
       (intern (concat "jme-" (symbol-name system-type))))
  (funcall (intern (concat "jme-" (symbol-name system-type))) 1))

;; Activate modules

(when (fboundp 'jme-local-machine-config)
  (jme-local-machine-config))
