;;; tdm-webmode.el --- Configuration for Web programming  -*- lexical-binding: t; -*-

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

;; Provides configuration of 'web-mode' package for use with web programming.

;;; Code:
(require 'straight)
(require 'jme-common)
(straight-use-package 'use-package)

(use-package web-mode
  :straight t
  :demand t
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.svelte?\\'" . web-mode))

(defun tdm-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-markup-indent-offset 2
        web-mode-script-padding 2
        web-mode-indent-style 2))
                                        ;(add-hook 'web-mode-hook 'tdm-web-mode-hook)
(with-eval-after-load 'web-mode
  (tdm-web-mode-hook))

(defun tdm-svelte--enable ()
  "Enable configuration."
)

(defun tdm-svelte--disable ()
  "Disable configuration."
)

(jme-common-defconfiguration tdm-webmode "Configuration for Web programming")

(provide 'tdm-webmode)
;;; tdm-webmode.el ends here
