(use-package clojure-mode
  :ensure t
  :pin melpa-stable)

(use-package cider
  :ensure t
  :pin melpa-stable)

(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
     (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  )

(use-package lsp-ui
  :ensure t)
