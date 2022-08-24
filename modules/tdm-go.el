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
(straight-use-package 'use-package)
(use-package go-imports
  :straight t
  :demand t
  :ensure t)

(use-package go-autocomplete
  :straight t
  :demand t
  :ensure t
  :config
  (ac-config-default))

(use-package go-mode
  :straight t
  :demand t
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save))
;;  (add-hook 'completion-at-point-functions 'go-complete-at-point))

;; (use-package go-guru
;;   :demand t
;;   :ensure t)

(use-package go-snippets
  :straight t
  :demand t
  :ensure t)

(straight-use-package 'rustic)

(defun jme-rust--enable ()
  "Enable configuration."
  (custom-set-variables
   '(rustic-lsp-client 'eglot))
  (add-hook 'rustic-mode-hook #'jme-common-auto-save-on-compilation))

(defun jme-rust--disable ()
  "Disable configuration."
  (remove-hook 'rustic-mode-hook #'jme-common-auto-save-on-compilation))

(jme-common-defconfiguration jme-rust "Configuration for Rust programming")

(provide 'jme-rust)
;;; jme-rust.el ends here
;;; jme-rust.el --- Configuration for Rust programming  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  John Eastman

;; Author: John Eastman <jeastman@miggle.lan>
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

;; Provides configuration of `go-mode' package for use with Go programming.

;;; Code:
(require 'straight)
(require 'jme-common)
(straight-use-package 'go-mode)
(straight-use-package 'go-imports)
(straight-use-package 'go-autocomplete)

(defun tdm-go--enable ()
  "Enable configuration."
  (add-hook 'before-save-hook #'gofmt-before-save))

(defun tdm-go--disable ()
  "Disable configuration."
  (remove-hook 'before-save-hook 'gofmt-before-save t))

(jme-common-defconfiguration tdm-go "Configuration for Go programming")

(provide 'tdm-go)
;;; tdm-go.el ends here
