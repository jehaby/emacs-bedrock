(use-package clojure-mode
  :ensure t
  :pin melpa
  :config
  (setq clojure-toplevel-inside-comment-form t)
  (define-abbrev clojure-mode-abbrev-table
    "snit"
    "(require '[snitch.core :refer [defn* defmethod* *fn *let]])"))

(use-package cider
  :ensure t
  :pin melpa
  :bind
  (("<localleader>e" . #'cider-eval-commands-map)
   ("<localleader>ep" . #'cider-eval-pprint-commands-map)
   ("<localleader>t" . #'cider-test-commands-map)
   ("<localleader>R" . #'clojure-refactor-map) ;; TODO: move to clojure mode?
   ("<localleader>eif" . #'cider-inspect-defun-at-point))

  (:map cider-eval-commands-map
	("f" . #'cider-eval-buffer)))

(use-package smartparens
  :ensure t
  :bind (("<localleader>(" . sp-wrap-round)
	 ("<localleader>{" . sp-wrap-curly)
	 ("<localleader>[" . sp-wrap-square)
	 ("<localleader>DEL" . sp-splice-sexp-killing-backward)))

(use-package evil-cleverparens
  :ensure t
  :config
  ;; (dolist (m '(clojure-mode
  ;;              clojurec-mode
  ;;              clojurescript-mode
  ;;              clojurex-mode))
  ;;    (add-hook m #'evil-cleverparens-mode)) 
  )

(add-hook 'clojure-mode #'evil-cleverparens-mode)
(add-hook 'clojurec-mode #'evil-cleverparens-mode)
(add-hook 'clojurescript-mode #'evil-cleverparens-mode)
(add-hook 'clojurex-mode #'evil-cleverparens-mode)

;I would recommend putting (setq evil-move-beyond-eol t) in your
;config so that certain movement commands don't break at the end of
;the lines (from evil-cleverparens readme)
(setq evil-move-beyond-eol t)

;; (setq lsp-keymap-prefix ",")
