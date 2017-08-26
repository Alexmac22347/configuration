(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-splash-screen t)
(set-face-attribute 'mode-line nil :height 100)
(set-face-attribute 'default nil :height 100)
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(show-paren-mode 1)
;(set-face-attribute 'region nil :background "#444444")
						      
						      

;; (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(custom-enabled-themes (quote (vim-dark)))
;; '(custom-safe-themes
;;   (quote
;;    ("21a6485e50fe857df362c2b7689414897c0973af9c19fe28af4dcea6f706bda0" "296ed9cc8f4e730239a7df764c13cf8c986071497f51095ff14fcbd37d1c638e" "67e6f21f83fd39b91f3e53f2ed51227c423151c668e93501ba20de4a7656e336" "beb6247a23f2eb46b4889d1a96b41d60be097d633ae48c2d60658b48ee3ccb8d" "3737c6946e16baf8baca984adf5ab9bb7082d7686790995ca674e0da3cd8467f" "67a4b2fff6034898df74347196a5954c5cd33040075e6228404bdc8b7cb12e6f" default))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )
