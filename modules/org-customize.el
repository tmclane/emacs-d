(require 'straight)

(straight-use-package 'org)
(straight-use-package 'org-contrib)
(straight-use-package 'htmlize)
(straight-use-package '(org-modern :type git :host github :repo "minad/org-modern"))

(add-hook 'org-mode-hook #'org-modern-mode)


(setq line-spacing 0.2)
(setq variable-pitch-mode 'true)
(setq visual-line-mode 'true)
(setq org-modern-mode 'true)
(setq olivetti-mode 'true)

(custom-set-variables
 ;; Adapt indentation to outline node level
 '(org-adapt-indentation t)
 ;; Don't keep tags aligned (for org-modern)
 '(org-auto-align-tags nil)
 ;; Check invisible regions before editing
 '(org-catch-invisible-edits 'show-and-error)
 ;; Fall-back file for org-capture
 '(org-default-notes-file (concat org-directory "/notes.org"))
 ;; The ellipsis to use in org
 '(org-ellipsis " ▾")
 ;; Hide markup when viewing (for org-modern)
 '(org-hide-emphasis-markers t)
 ;; Insert new headings after the current subtree
 '(org-insert-heading-respect-content t)
 ;; Record time when an item is done
 '(org-log-done 'time)
 ;; Drawer to log info into
 '(org-log-into-drawer "LOGBOOK")
 ;; Handle outline path in one step
 '(org-outline-path-complete-in-steps nil)
 ;; Show entities as UTF-8 characters
 '(org-pretty-entities t)
 ;; Allow creation of headlines when refiling
 '(org-refile-allow-creating-parent-nodes 'confirm)
 ;; limit refiling to agenda files
 '(org-refile-targets '((org-agenda-files . (:maxlevel . 5))))
 ;; Provide refile targets as paths
 '(org-refile-use-outline-path 'file)
 ;; Make ctrl-a/ctrl-e headline aware
 '(org-special-ctrl-a/e t)
 ;; Fontify code in source blocks
 '(org-src-fontify-natively t)
 ;; Use the native language tabs in code blocks
 '(org-src-tab-acts-natively t)
 ;; Don't switch to overview when loading org files
 '(org-startup-folded nil)
 ;; Column for tags (for org-modern)
 '(org-tags-column 0)
;; '(org-modules '(org-annotate-file
;;                 ol-bibtex
                                        ;                 ol-eww))

 )
 ;; Languages to use for babel
 ;; '(org-babel-load-languages
 ;;   '((emacs-lisp . t)
 ;;     (ditaa . t)
 ;;     (dot . t)
 ;;     (gnuplot . t)
 ;;     (plantuml . t)
 ;;     (python . t)
 ;;     (js . t)
 ;;     (lisp . t)
 ;;     (shell . t))))

;; Workflow steps
(custom-set-variables '(org-todo-keywords
                        '((sequence "TODO(t)" "NEXT(n!)" "STARTED(s!)" "WAITING(w@/!)" "STALLED(x@/!)" "|" "DONE(d!)" "CANCELLED(c@)")
                          (sequence "TASK(f)" "|" "DONE(d!)")
                          (sequence "MAYBE(m)" "|" "DONE(d!)" "CANCELLED(c@)")
                          (sequence "RISK(r)" "|" "MITIGATED(i@)"))))

;(org-babel-do-load-languages
; 'org-babal-load-languages
; 'org-babal-load-languages)


(provide 'org-customize)

