(deftheme vim-dark
  "vim-dark theme")

(custom-theme-set-faces
 'vim-dark
 
 '(default ((t (:background "black" :foreground "white"))))
 '(mouse ((t (:background "white"))))
 '(cursor ((t (:background "white"))))
 '(border ((t (:background "white"))))
 '(region ((t (:background "#666666"))))
 
 '(font-lock-builtin-face ((t (:foreground "LightBlue"))))
 '(font-lock-comment-face ((t (:foreground "Cyan"))))
 '(font-lock-constant-face ((t (:foreground "White"))))
 '(font-lock-doc-face ((t (:foreground "Cyan"))))
 '(font-lock-function-name-face ((t (:foreground "White"))))
 '(font-lock-keyword-face ((t (:foreground "#f4f74f"))))
 '(font-lock-string-face ((t (:foreground "#6e95d3"))))
 '(font-lock-type-face ((t (:foreground "PaleGreen"))))
 '(font-lock-variable-name-face ((t (:foreground "White")))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'vim-dark)
