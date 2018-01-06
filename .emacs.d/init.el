;;;;;;;;;;;;;;; Auto
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes
   (quote
    ("40f69022fdf32999cdb4c7a2254e74c39e18fe501d48563248565524409a83c2" default)))
 '(package-selected-packages
   (quote
    (rtags cmake-ide use-package projectile eyebrowse zygospore magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#11131c" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))

;;;;;;;;;;;;;;; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;;;;;;;;;;;;;; General
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(set-face-attribute 'mode-line nil :height 100)
(set-face-attribute 'default nil :height 100)
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(show-paren-mode 1)
(set-face-attribute 'fringe nil :background nil)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

;;;;;;;;;;;;;;; Defuns
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun use-popup (buffer window-height)
  (add-to-list 'display-buffer-alist
               `(,buffer
                 (display-buffer-reuse-window
                  display-buffer-below-selected)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . ,window-height))))

(defun switch-to-window (buffer-name)
  (select-window (get-buffer-window buffer-name)))

;;;;;;;;;;;;;; rtags
(require 'rtags)
(rtags-enable-standard-keybindings)

;;;;;;;;;;;;;; cmake-ide
(cmake-ide-setup)

;;;;;;;;;;;;;; Eye-browse
(eyebrowse-mode t)
(define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
(define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
(define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
(define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)
(setq eyebrowse-new-workspace t)
(setq eyebrowse-mode-line-style nil)

;;;;;;;;;;;;;;; Ido-mode
(ido-mode t)

;;;;;;;;;;;;;;; Electric pair
(electric-pair-mode 1)

;;;;;;;;;;;;;;; Projectile
(projectile-global-mode t)

;;;;;;;;;;;;;;; GDB
(defadvice gdb-inferior-filter
    (around gdb-inferior-filter-without-stealing)
  (with-current-buffer (gdb-get-buffer-create 'gdb-inferior-io)
    (comint-output-filter proc string)))
(ad-activate 'gdb-inferior-filter)

;;;;;;;;;;;;;;; Window configurations
(use-popup (rx bos "*Async Shell Command*") .3)

(defun switch-to-compilation-window
  (command &optional comint)
  (switch-to-window "*compilation*"))
(advice-add 'compile :after 'switch-to-compilation-window)

(add-to-list 'display-buffer-alist
             '("*Help*" display-buffer-same-window))
(add-to-list 'display-buffer-alist
             '("*Buffer List*" display-buffer-same-window))
(add-to-list 'display-buffer-alist
             '("*shell*" display-buffer-same-window))

;;;;;;;;;;;;;;; Keybindings
(global-set-key "\C-\M-p" 'beginning-of-defun)
(global-set-key "\C-\M-n" 'end-of-defun)
(global-set-key (kbd "\C-x 1") 'zygospore-toggle-delete-other-windows)
(global-set-key "\M-u" 'undo)
(global-set-key (kbd "\C-c y") 'clipboard-yank)
(global-set-key (kbd "\C-c e b") 'eval-buffer)
(global-set-key (kbd "\C-c c") 'cmake-ide-compile)
(global-set-key (kbd "\C-x\C-d") 'ido-dired)
(global-set-key (kbd "\C-x\C-k") 'kill-buffer-and-window)
(global-set-key (kbd "\C-c g") 'magit-status)
(global-set-key (kbd "\C-c \C-d") 'duplicate-line)
(global-set-key (kbd "\C-c \C-y") 'copy-line)
(bind-key* (kbd "\C-o") 'other-window)
(global-set-key (kbd "\C-x o") 'ff-find-other-file)
(global-set-key (kbd "\C-x \C-o") (lambda () (interactive) (ff-find-other-file t)))

;;;;;;;;;;;;;;; Hooks
(add-hook 'find-file-hook 'linum-mode)
