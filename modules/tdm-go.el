;;; tdm-go.el --- Configuration for Go programming  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Travis McLane

;; Author: Travis McLane <tmclane@gmail.com>
;; Keywords: convenience, languages

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides configuration of `go' package for use with Rust programming.

;;; Code:
(require 'straight)
(require 'jme-common)
(straight-use-package 'go-mode)
(straight-use-package 'go-imports)
(setq gofmt-command "goimports")

                    ;(straight-use-package 'go-autocomplete)
                    ;(straight-use-package 'eglot)
(straight-use-package 'project)
(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))
;  (add-hook 'go-mode-hook 'eglot-ensure)

(defun tdm-go--enable ()
  "Enable configuration."

  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'project-find-functions 'project-find-go-module))

;  (remove-hook 'go-mode-hook 'eglot-ensure)

(defun tdm-go--disable ()
  "Disable configuration."
  (remove-hook 'before-save-hook 'gofmt-before-save t)
  (remove-hook 'project-find-functions 'project-find-go-module))

(jme-common-defconfiguration tdm-go "Configuration for Go programming")

(provide 'tdm-go)
;;; tdm-go.el ends here
