;; specify base directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(fset 'package-desc-vers 'package--ac-desc-version)
(package-initialize)

;; custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; python-mode - major mode for python
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\\.py\\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; flycheck - error check
(defun my/turn-on-flycheck-mode ()
  (flycheck-mode 1))
(add-hook 'python-mode-hook 'my/turn-on-flycheck-mode)

;; jedi - completion for python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; auto complete
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; py-yapf - auto format
(require 'py-yapf)
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

;; helm - awesome tool
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x C-r") 'helm-recentf) 
(global-set-key (kbd "M-y") 'helm-show-kill-ring) 
(global-set-key (kbd "M-r") 'helm-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-c i")   'helm-imenu)

(require 'helm-swoop)
(global-set-key (kbd "M-o") 'helm-swoop)
(global-set-key (kbd "C-M-o") 'helm-multi-swoop)

(require 'iedit)
(global-set-key (kbd "C-x ;") 'iedit-mode)

(semantic-mode 1)
(add-hook 'python-mode-hook
  (lambda ()
    (setq imenu-create-index-function 'python-imenu-create-index)))


