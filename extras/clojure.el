(use-package clojure-mode
  :ensure t
  :pin melpa
  :config (setq clojure-toplevel-inside-comment-form t))

(use-package cider
  :ensure t
  :pin melpa
  :bind
  (("<localleader>e" . #'cider-eval-commands-map)
   ("<localleader>ep" . #'cider-eval-pprint-commands-map)
   ("<localleader>R" . #'clojure-refactor-map)
   ))

(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :bind (("C-;" . lsp-ui-peek-find-references)
	 ("<localleader>rr" . lsp-rename))
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
     (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  )

(use-package lsp-ui
  :ensure t)
